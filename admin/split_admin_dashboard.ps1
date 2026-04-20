$sourceFile = 'statistique.html'
$raw = Get-Content -Raw -LiteralPath $sourceFile

$bodyMarker = '<body class="font-roboto bg-white">'
$overviewMarker = '<div id="admin-overview" class="admin-tab-content">'
$usersMarker = '<div id="admin-users" class="admin-tab-content hidden">'
$workflowsMarker = '<div id="admin-workflows" class="admin-tab-content hidden">'
$contentMarker = '<div id="admin-content" class="admin-tab-content hidden">'
$analyticsMarker = '<div id="admin-analytics" class="admin-tab-content hidden">'
$settingsMarker = '<div id="admin-settings" class="admin-tab-content hidden">'
$sectionEndMarker = "        </div>`r`n    </section>"
$scriptMarker = "    <script>"

$bodyIndex = $raw.IndexOf($bodyMarker)
$overviewIndex = $raw.IndexOf($overviewMarker)
$usersIndex = $raw.IndexOf($usersMarker)
$workflowsIndex = $raw.IndexOf($workflowsMarker)
$contentIndex = $raw.IndexOf($contentMarker)
$analyticsIndex = $raw.IndexOf($analyticsMarker)
$settingsIndex = $raw.IndexOf($settingsMarker)
$sectionEndIndex = $raw.IndexOf($sectionEndMarker, $settingsIndex)
$scriptIndex = $raw.IndexOf($scriptMarker, $sectionEndIndex)

$head = $raw.Substring(0, $bodyIndex + $bodyMarker.Length)
$prefix = $raw.Substring($bodyIndex + $bodyMarker.Length, $overviewIndex - ($bodyIndex + $bodyMarker.Length))
$sectionEnd = $raw.Substring($sectionEndIndex, $scriptIndex - $sectionEndIndex)
$scripts = $raw.Substring($scriptIndex)

function Get-Block([int]$start, [int]$end) {
    return $raw.Substring($start, $end - $start).TrimEnd()
}

$blocks = @{
    overview = Get-Block $overviewIndex $usersIndex
    users = Get-Block $usersIndex $workflowsIndex
    workflows = Get-Block $workflowsIndex $contentIndex
    content = Get-Block $contentIndex $analyticsIndex
    analytics = Get-Block $analyticsIndex $settingsIndex
    settings = Get-Block $settingsIndex $sectionEndIndex
}

function Get-Nav([string]$active) {
    $items = @(
        @{ file = 'statistique.html'; key = 'overview'; label = "Vue d'ensemble" },
        @{ file = 'utilisateurs.html'; key = 'users'; label = 'Gestion Utilisateurs' },
        @{ file = 'workflows.html'; key = 'workflows'; label = 'Workflows' },
        @{ file = 'contenu.html'; key = 'content'; label = 'Gestion Contenu' },
        @{ file = 'analytics.html'; key = 'analytics'; label = 'Analytics' },
        @{ file = 'parametres.html'; key = 'settings'; label = 'Paramètres' }
    )

    $links = foreach ($item in $items) {
        $classes = if ($item.key -eq $active) {
            'admin-tab-btn px-4 py-2 !rounded-button font-inter text-sm font-medium bg-primary text-white transition-colors whitespace-nowrap cursor-pointer'
        } else {
            'admin-tab-btn px-4 py-2 !rounded-button font-inter text-sm font-medium text-gray-600 hover:bg-gray-50 transition-colors whitespace-nowrap cursor-pointer'
        }
        "                <a href=`"$($item.file)`" class=`"$classes`">$($item.label)</a>"
    }

    return @"
            <div class="flex space-x-1 mb-8 bg-white rounded-lg p-1 shadow-sm overflow-x-auto">
$($links -join "`r`n")
            </div>
"@
}

function Normalize-Text([string]$content) {
    return $content
}

function Build-Page([string]$active, [string]$contentBlock) {
    $navStart = $prefix.IndexOf('            <!-- Administration Navigation -->')
    $overviewCommentStart = $prefix.IndexOf('            <!-- Overview Tab -->')
    $prefixBeforeNav = $prefix.Substring(0, $navStart)
    $prefixAfterNav = ''
    if ($overviewCommentStart -gt -1) {
        $prefixAfterNav = ''
    }

    $cleanBlock = $contentBlock.Replace(' class="admin-tab-content hidden"', ' class="admin-tab-content"')
    $page = $head + $prefixBeforeNav + "            <!-- Administration Navigation -->`r`n" + (Get-Nav $active) + "`r`n" + $cleanBlock + "`r`n" + $sectionEnd + $scripts
    return Normalize-Text($page)
}

$pages = @(
    @{ file = 'statistique.html'; key = 'overview'; content = $blocks.overview },
    @{ file = 'utilisateurs.html'; key = 'users'; content = $blocks.users },
    @{ file = 'workflows.html'; key = 'workflows'; content = $blocks.workflows },
    @{ file = 'contenu.html'; key = 'content'; content = $blocks.content },
    @{ file = 'analytics.html'; key = 'analytics'; content = $blocks.analytics },
    @{ file = 'parametres.html'; key = 'settings'; content = $blocks.settings }
)

foreach ($page in $pages) {
    Set-Content -LiteralPath $page.file -Value (Build-Page $page.key $page.content) -Encoding UTF8
}

