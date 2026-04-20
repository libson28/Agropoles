$commonHead = @'
<!DOCTYPE html>
<html lang="fr">
<head>
    <script src="https://static.readdy.ai/static/e.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Programme National de Développement des Agropoles du Sénégal</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/4.6.0/remixicon.min.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#2E7D32',
                        secondary: '#66BB6A'
                    },
                    borderRadius: {
                        'none': '0px',
                        'sm': '4px',
                        DEFAULT: '8px',
                        'md': '12px',
                        'lg': '16px',
                        'xl': '20px',
                        '2xl': '24px',
                        '3xl': '32px',
                        'full': '9999px',
                        'button': '8px'
                    },
                    fontFamily: {
                        'inter': ['Inter', 'sans-serif'],
                        'poppins': ['Poppins', 'sans-serif'],
                        'roboto': ['Roboto', 'sans-serif']
                    }
                }
            }
        }
    </script>
    <style>
        :where([class^="ri-"])::before {
            content: "\f3c2";
        }
    </style>
</head>
<body class="font-roboto bg-white">
'@

$header = @'
<section class="pt-16 bg-gray-50 min-h-screen">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <div class="flex items-center justify-between mb-8">
            <div>
                <h1 class="text-3xl font-poppins font-bold text-primary">Tableau de Bord</h1>
                <p class="font-roboto text-gray-600 mt-1">Bonjour Amadou, voici un aperçu de votre activité</p>
            </div>
            <div class="flex items-center space-x-4">
                <button class="relative p-2 text-gray-400 hover:text-primary transition-colors">
                    <i class="ri-notification-line text-xl"></i>
                    <span class="absolute top-0 right-0 w-2 h-2 bg-red-500 rounded-full"></span>
                </button>
                <div class="flex items-center space-x-3">
                    <img src="https://readdy.ai/api/search-image?query=Professional%20African%20farmer%20portrait%2C%20confident%20male%20agriculturist%2C%20smiling%20farmer%20in%20agricultural%20setting%2C%20professional%20headshot%20photography&width=100&height=100&seq=profile001&orientation=squarish" alt="Profil" class="w-10 h-10 rounded-full object-cover object-top">
                    <div>
                        <div class="font-inter font-medium text-gray-900">Amadou Sy</div>
                        <div class="font-roboto text-sm text-gray-600">Producteur</div>
                    </div>
                </div>
            </div>
        </div>
'@

function Get-Nav([string]$active) {
    $items = @(
        @{ file = 'tableauDeBord.html'; key = 'overview'; label = "Vue d'ensemble" },
        @{ file = 'profil.html'; key = 'profile'; label = 'Mon Profil' },
        @{ file = 'paiement.html'; key = 'payments'; label = 'Paiements' },
        @{ file = 'messages.html'; key = 'messages'; label = 'Messages' },
        @{ file = 'produit.html'; key = 'marketplace'; label = 'Mes Produits' },
        @{ file = 'formalites.html'; key = 'formalities'; label = 'Formalités' }
    )

    $links = foreach ($item in $items) {
        $classes = if ($item.key -eq $active) {
            'dashboard-tab-btn px-4 py-2 !rounded-button font-inter text-sm font-medium bg-primary text-white transition-colors whitespace-nowrap'
        } else {
            'dashboard-tab-btn px-4 py-2 !rounded-button font-inter text-sm font-medium text-gray-600 hover:bg-gray-50 transition-colors whitespace-nowrap'
        }
        "                <a href=`"$($item.file)`" class=`"$classes`">$($item.label)</a>"
    }

    return @"
        <div class="flex space-x-1 mb-8 bg-white rounded-lg p-1 shadow-sm overflow-x-auto">
$($links -join "`r`n")
        </div>
"@
}

$overviewContent = @'
        <div class="grid md:grid-cols-4 gap-6 mb-8">
            <div class="bg-white p-6 rounded-xl shadow-sm">
                <div class="flex items-center justify-between mb-4">
                    <div class="w-12 h-12 flex items-center justify-center bg-primary bg-opacity-10 rounded-lg">
                        <i class="ri-plant-line text-primary text-xl"></i>
                    </div>
                    <span class="text-sm font-roboto text-green-600 bg-green-50 px-2 py-1 rounded">+12%</span>
                </div>
                <div class="text-2xl font-poppins font-bold text-gray-900 mb-1">2,450 kg</div>
                <div class="font-roboto text-gray-600 text-sm">Production ce mois</div>
            </div>
            <div class="bg-white p-6 rounded-xl shadow-sm">
                <div class="flex items-center justify-between mb-4">
                    <div class="w-12 h-12 flex items-center justify-center bg-secondary bg-opacity-10 rounded-lg">
                        <i class="ri-money-dollar-circle-line text-secondary text-xl"></i>
                    </div>
                    <span class="text-sm font-roboto text-green-600 bg-green-50 px-2 py-1 rounded">+8%</span>
                </div>
                <div class="text-2xl font-poppins font-bold text-gray-900 mb-1">1,2M FCFA</div>
                <div class="font-roboto text-gray-600 text-sm">Revenus ce mois</div>
            </div>
            <div class="bg-white p-6 rounded-xl shadow-sm">
                <div class="flex items-center justify-between mb-4">
                    <div class="w-12 h-12 flex items-center justify-center bg-blue-100 rounded-lg">
                        <i class="ri-shopping-cart-line text-blue-600 text-xl"></i>
                    </div>
                    <span class="text-sm font-roboto text-blue-600 bg-blue-50 px-2 py-1 rounded">15 actives</span>
                </div>
                <div class="text-2xl font-poppins font-bold text-gray-900 mb-1">23</div>
                <div class="font-roboto text-gray-600 text-sm">Commandes totales</div>
            </div>
            <div class="bg-white p-6 rounded-xl shadow-sm">
                <div class="flex items-center justify-between mb-4">
                    <div class="w-12 h-12 flex items-center justify-center bg-orange-100 rounded-lg">
                        <i class="ri-star-line text-orange-500 text-xl"></i>
                    </div>
                    <span class="text-sm font-roboto text-orange-600 bg-orange-50 px-2 py-1 rounded">4.8/5</span>
                </div>
                <div class="text-2xl font-poppins font-bold text-gray-900 mb-1">92%</div>
                <div class="font-roboto text-gray-600 text-sm">Satisfaction client</div>
            </div>
        </div>
        <div class="grid md:grid-cols-2 gap-8 mb-8">
            <div class="bg-white p-6 rounded-xl shadow-sm">
                <h3 class="text-lg font-inter font-semibold text-gray-900 mb-6">Évolution de la Production</h3>
                <div id="production-chart" class="h-64"></div>
            </div>
            <div class="bg-white p-6 rounded-xl shadow-sm">
                <h3 class="text-lg font-inter font-semibold text-gray-900 mb-6">Répartition des Ventes</h3>
                <div id="sales-chart" class="h-64"></div>
            </div>
        </div>
        <div class="grid md:grid-cols-2 gap-8">
            <div class="bg-white p-6 rounded-xl shadow-sm">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-lg font-inter font-semibold text-gray-900">Activités Récentes</h3>
                    <button class="text-primary font-inter text-sm hover:text-green-800 transition-colors">Voir tout</button>
                </div>
                <div class="space-y-4">
                    <div class="flex items-start space-x-4">
                        <div class="w-8 h-8 flex items-center justify-center bg-green-100 rounded-full">
                            <i class="ri-check-line text-green-600 text-sm"></i>
                        </div>
                        <div class="flex-1">
                            <div class="font-roboto text-gray-900 text-sm">Commande #CMD-2024-156 livrée</div>
                            <div class="font-roboto text-gray-500 text-xs mt-1">Il y a 2 heures</div>
                        </div>
                    </div>
                    <div class="flex items-start space-x-4">
                        <div class="w-8 h-8 flex items-center justify-center bg-blue-100 rounded-full">
                            <i class="ri-message-line text-blue-600 text-sm"></i>
                        </div>
                        <div class="flex-1">
                            <div class="font-roboto text-gray-900 text-sm">Nouveau message de Fatou Diallo</div>
                            <div class="font-roboto text-gray-500 text-xs mt-1">Il y a 4 heures</div>
                        </div>
                    </div>
                    <div class="flex items-start space-x-4">
                        <div class="w-8 h-8 flex items-center justify-center bg-orange-100 rounded-full">
                            <i class="ri-money-dollar-circle-line text-orange-600 text-sm"></i>
                        </div>
                        <div class="flex-1">
                            <div class="font-roboto text-gray-900 text-sm">Paiement de 450,000 FCFA reçu</div>
                            <div class="font-roboto text-gray-500 text-xs mt-1">Hier à 16:30</div>
                        </div>
                    </div>
                    <div class="flex items-start space-x-4">
                        <div class="w-8 h-8 flex items-center justify-center bg-purple-100 rounded-full">
                            <i class="ri-shopping-cart-line text-purple-600 text-sm"></i>
                        </div>
                        <div class="flex-1">
                            <div class="font-roboto text-gray-900 text-sm">Nouvelle commande de 200kg de tomates</div>
                            <div class="font-roboto text-gray-500 text-xs mt-1">Hier à 14:20</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bg-white p-6 rounded-xl shadow-sm">
                <div class="flex items-center justify-between mb-6">
                    <h3 class="text-lg font-inter font-semibold text-gray-900">Notifications</h3>
                    <button class="text-primary font-inter text-sm hover:text-green-800 transition-colors">Marquer comme lues</button>
                </div>
                <div class="space-y-4">
                    <div class="flex items-start space-x-4 p-3 bg-blue-50 rounded-lg">
                        <div class="w-8 h-8 flex items-center justify-center bg-blue-100 rounded-full">
                            <i class="ri-information-line text-blue-600 text-sm"></i>
                        </div>
                        <div class="flex-1">
                            <div class="font-roboto text-gray-900 text-sm font-medium">Formation disponible</div>
                            <div class="font-roboto text-gray-600 text-xs mt-1">Nouvelle session de formation sur les techniques de conservation disponible</div>
                        </div>
                    </div>
                    <div class="flex items-start space-x-4 p-3 bg-green-50 rounded-lg">
                        <div class="w-8 h-8 flex items-center justify-center bg-green-100 rounded-full">
                            <i class="ri-gift-line text-green-600 text-sm"></i>
                        </div>
                        <div class="flex-1">
                            <div class="font-roboto text-gray-900 text-sm font-medium">Opportunité de financement</div>
                            <div class="font-roboto text-gray-600 text-xs mt-1">Nouveau programme de crédit agricole à taux préférentiel disponible</div>
                        </div>
                    </div>
                    <div class="flex items-start space-x-4 p-3 bg-orange-50 rounded-lg">
                        <div class="w-8 h-8 flex items-center justify-center bg-orange-100 rounded-full">
                            <i class="ri-alert-line text-orange-600 text-sm"></i>
                        </div>
                        <div class="flex-1">
                            <div class="font-roboto text-gray-900 text-sm font-medium">Rappel de paiement</div>
                            <div class="font-roboto text-gray-600 text-xs mt-1">Facture #FAC-2024-089 échue dans 3 jours</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
'@

$profileContent = @'
        <div class="grid md:grid-cols-3 gap-8">
            <div class="md:col-span-2 space-y-8">
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <h3 class="text-lg font-inter font-semibold text-gray-900 mb-6">Informations Personnelles</h3>
                    <form class="space-y-6">
                        <div class="grid md:grid-cols-2 gap-4">
                            <div>
                                <label class="block font-inter font-medium text-gray-700 mb-2">Prénom</label>
                                <input type="text" value="Amadou" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm">
                            </div>
                            <div>
                                <label class="block font-inter font-medium text-gray-700 mb-2">Nom</label>
                                <input type="text" value="Sy" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm">
                            </div>
                        </div>
                        <div>
                            <label class="block font-inter font-medium text-gray-700 mb-2">Email</label>
                            <input type="email" value="amadou.sy@email.com" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm">
                        </div>
                        <div class="grid md:grid-cols-2 gap-4">
                            <div>
                                <label class="block font-inter font-medium text-gray-700 mb-2">Téléphone</label>
                                <input type="tel" value="+221 77 123 45 67" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm">
                            </div>
                            <div>
                                <label class="block font-inter font-medium text-gray-700 mb-2">Région</label>
                                <select class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm pr-8">
                                    <option>Saint-Louis</option>
                                    <option>Dakar</option>
                                    <option>Thiès</option>
                                    <option>Kolda</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <label class="block font-inter font-medium text-gray-700 mb-2">Adresse</label>
                            <textarea rows="3" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm resize-none">Route de Rosso, Saint-Louis, Sénégal</textarea>
                        </div>
                        <button type="submit" class="px-6 py-3 bg-primary text-white font-inter font-medium !rounded-button hover:bg-green-800 transition-colors whitespace-nowrap">Mettre à jour le profil</button>
                    </form>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <h3 class="text-lg font-inter font-semibold text-gray-900 mb-6">Coffre-fort Numérique</h3>
                    <div class="space-y-4">
                        <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 flex items-center justify-center bg-green-100 rounded-lg"><i class="ri-file-check-line text-green-600"></i></div>
                                <div>
                                    <div class="font-roboto text-gray-900 text-sm font-medium">Carte d'identité</div>
                                    <div class="font-roboto text-gray-500 text-xs">Vérifié</div>
                                </div>
                            </div>
                            <button class="text-primary hover:text-green-800 transition-colors"><i class="ri-eye-line"></i></button>
                        </div>
                        <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 flex items-center justify-center bg-green-100 rounded-lg"><i class="ri-file-check-line text-green-600"></i></div>
                                <div>
                                    <div class="font-roboto text-gray-900 text-sm font-medium">Certificat agricole</div>
                                    <div class="font-roboto text-gray-500 text-xs">Vérifié</div>
                                </div>
                            </div>
                            <button class="text-primary hover:text-green-800 transition-colors"><i class="ri-eye-line"></i></button>
                        </div>
                        <div class="flex items-center justify-between p-4 border border-dashed border-gray-300 rounded-lg">
                            <div class="flex items-center space-x-3">
                                <div class="w-10 h-10 flex items-center justify-center bg-gray-100 rounded-lg"><i class="ri-file-add-line text-gray-400"></i></div>
                                <div><div class="font-roboto text-gray-700 text-sm">Ajouter un document</div></div>
                            </div>
                            <button class="text-primary hover:text-green-800 transition-colors"><i class="ri-upload-line"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="space-y-8">
                <div class="bg-white p-6 rounded-xl shadow-sm text-center">
                    <img src="https://readdy.ai/api/search-image?query=Professional%20African%20farmer%20portrait%2C%20confident%20male%20agriculturist%2C%20smiling%20farmer%20in%20agricultural%20setting%2C%20professional%20headshot%20photography&width=200&height=200&seq=profile002&orientation=squarish" alt="Photo de profil" class="w-24 h-24 rounded-full mx-auto mb-4 object-cover object-top">
                    <h4 class="font-inter font-semibold text-gray-900 mb-2">Amadou Sy</h4>
                    <div class="flex items-center justify-center space-x-2 mb-4">
                        <span class="px-3 py-1 bg-secondary bg-opacity-20 text-secondary text-sm font-medium rounded-full">Producteur</span>
                        <span class="px-3 py-1 bg-green-100 text-green-700 text-sm font-medium rounded-full">Vérifié</span>
                    </div>
                    <div class="space-y-2 text-sm font-roboto text-gray-600">
                        <div class="flex items-center justify-center"><i class="ri-map-pin-line mr-2"></i>Saint-Louis, Sénégal</div>
                        <div class="flex items-center justify-center"><i class="ri-calendar-line mr-2"></i>Membre depuis Mars 2023</div>
                    </div>
                    <button class="w-full mt-4 px-4 py-2 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">Changer la photo</button>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <h4 class="font-inter font-semibold text-gray-900 mb-4">Statistiques d'Activité</h4>
                    <div class="space-y-4">
                        <div class="flex items-center justify-between">
                            <span class="font-roboto text-gray-600 text-sm">Profil complété</span>
                            <div class="flex items-center space-x-2">
                                <div class="w-16 h-2 bg-gray-200 rounded-full"><div class="w-14 h-2 bg-primary rounded-full"></div></div>
                                <span class="font-roboto text-primary text-sm font-medium">85%</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="font-roboto text-gray-600 text-sm">Note moyenne</span>
                            <div class="flex items-center space-x-1">
                                <div class="flex space-x-1">
                                    <i class="ri-star-fill text-yellow-400 text-sm"></i><i class="ri-star-fill text-yellow-400 text-sm"></i><i class="ri-star-fill text-yellow-400 text-sm"></i><i class="ri-star-fill text-yellow-400 text-sm"></i><i class="ri-star-fill text-yellow-400 text-sm"></i>
                                </div>
                                <span class="font-roboto text-gray-600 text-sm">4.8</span>
                            </div>
                        </div>
                        <div class="flex items-center justify-between">
                            <span class="font-roboto text-gray-600 text-sm">Transactions</span>
                            <span class="font-roboto text-gray-900 text-sm font-medium">156 total</span>
                        </div>
                    </div>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <h3 class="text-lg font-inter font-semibold text-gray-900 mb-6">Paramètres de Sécurité</h3>
                    <div class="space-y-6">
                        <div class="flex items-center justify-between">
                            <div>
                                <div class="font-roboto text-gray-900 text-sm font-medium">Authentification à deux facteurs</div>
                                <div class="font-roboto text-gray-500 text-xs">Protection supplémentaire pour votre compte</div>
                            </div>
                            <label class="relative inline-flex items-center cursor-pointer">
                                <input type="checkbox" class="sr-only peer" checked>
                                <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
                            </label>
                        </div>
                        <div class="flex items-center justify-between">
                            <div>
                                <div class="font-roboto text-gray-900 text-sm font-medium">Notifications par email</div>
                                <div class="font-roboto text-gray-500 text-xs">Recevoir les alertes importantes par email</div>
                            </div>
                            <label class="relative inline-flex items-center cursor-pointer">
                                <input type="checkbox" class="sr-only peer" checked>
                                <div class="w-11 h-6 bg-gray-200 peer-focus:outline-none rounded-full peer peer-checked:after:translate-x-full peer-checked:after:border-white after:content-[''] after:absolute after:top-[2px] after:left-[2px] after:bg-white after:border-gray-300 after:border after:rounded-full after:h-5 after:w-5 after:transition-all peer-checked:bg-primary"></div>
                            </label>
                        </div>
                        <button class="w-full px-4 py-3 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">Changer le mot de passe</button>
                    </div>
                </div>
            </div>
        </div>
'@

$paymentsContent = @'
        <div class="space-y-8">
            <div class="grid md:grid-cols-4 gap-6">
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <div class="flex items-center justify-between mb-4"><div class="w-12 h-12 flex items-center justify-center bg-green-100 rounded-lg"><i class="ri-wallet-line text-green-600 text-xl"></i></div></div>
                    <div class="text-2xl font-poppins font-bold text-gray-900 mb-1">2,4M FCFA</div>
                    <div class="font-roboto text-gray-600 text-sm">Solde disponible</div>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <div class="flex items-center justify-between mb-4"><div class="w-12 h-12 flex items-center justify-center bg-blue-100 rounded-lg"><i class="ri-arrow-down-line text-blue-600 text-xl"></i></div></div>
                    <div class="text-2xl font-poppins font-bold text-gray-900 mb-1">890K FCFA</div>
                    <div class="font-roboto text-gray-600 text-sm">Revenus ce mois</div>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <div class="flex items-center justify-between mb-4"><div class="w-12 h-12 flex items-center justify-center bg-orange-100 rounded-lg"><i class="ri-arrow-up-line text-orange-600 text-xl"></i></div></div>
                    <div class="text-2xl font-poppins font-bold text-gray-900 mb-1">150K FCFA</div>
                    <div class="font-roboto text-gray-600 text-sm">Dépenses ce mois</div>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <div class="flex items-center justify-between mb-4"><div class="w-12 h-12 flex items-center justify-center bg-purple-100 rounded-lg"><i class="ri-file-list-line text-purple-600 text-xl"></i></div></div>
                    <div class="text-2xl font-poppins font-bold text-gray-900 mb-1">12</div>
                    <div class="font-roboto text-gray-600 text-sm">Factures en attente</div>
                </div>
            </div>
            <div class="grid md:grid-cols-3 gap-8">
                <div class="md:col-span-2 bg-white p-6 rounded-xl shadow-sm">
                    <div class="flex items-center justify-between mb-6">
                        <h3 class="text-lg font-inter font-semibold text-gray-900">Historique des Transactions</h3>
                        <div class="flex space-x-2">
                            <button class="px-4 py-2 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">Filtrer</button>
                            <button class="px-4 py-2 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap">Exporter</button>
                        </div>
                    </div>
                    <div class="space-y-4">
                        <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
                            <div class="flex items-center space-x-4">
                                <div class="w-10 h-10 flex items-center justify-center bg-green-100 rounded-lg"><i class="ri-arrow-down-line text-green-600"></i></div>
                                <div><div class="font-roboto text-gray-900 text-sm font-medium">Vente tomates - Marché Central</div><div class="font-roboto text-gray-500 text-xs">18 mars 2024 • 14:30</div></div>
                            </div>
                            <div class="text-right"><div class="font-roboto text-green-600 text-sm font-medium">+450,000 FCFA</div><span class="px-2 py-1 bg-green-100 text-green-700 text-xs font-medium rounded-full">Reçu</span></div>
                        </div>
                        <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
                            <div class="flex items-center space-x-4">
                                <div class="w-10 h-10 flex items-center justify-center bg-red-100 rounded-lg"><i class="ri-arrow-up-line text-red-600"></i></div>
                                <div><div class="font-roboto text-gray-900 text-sm font-medium">Achat engrais - Agro-Supply</div><div class="font-roboto text-gray-500 text-xs">16 mars 2024 • 09:15</div></div>
                            </div>
                            <div class="text-right"><div class="font-roboto text-red-600 text-sm font-medium">-85,000 FCFA</div><span class="px-2 py-1 bg-red-100 text-red-700 text-xs font-medium rounded-full">Payé</span></div>
                        </div>
                        <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
                            <div class="flex items-center space-x-4">
                                <div class="w-10 h-10 flex items-center justify-center bg-green-100 rounded-lg"><i class="ri-arrow-down-line text-green-600"></i></div>
                                <div><div class="font-roboto text-gray-900 text-sm font-medium">Vente oignons - Restaurant Teranga</div><div class="font-roboto text-gray-500 text-xs">14 mars 2024 • 16:45</div></div>
                            </div>
                            <div class="text-right"><div class="font-roboto text-green-600 text-sm font-medium">+320,000 FCFA</div><span class="px-2 py-1 bg-green-100 text-green-700 text-xs font-medium rounded-full">Reçu</span></div>
                        </div>
                        <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
                            <div class="flex items-center space-x-4">
                                <div class="w-10 h-10 flex items-center justify-center bg-orange-100 rounded-lg"><i class="ri-time-line text-orange-600"></i></div>
                                <div><div class="font-roboto text-gray-900 text-sm font-medium">Commission plateforme</div><div class="font-roboto text-gray-500 text-xs">14 mars 2024 • 17:00</div></div>
                            </div>
                            <div class="text-right"><div class="font-roboto text-orange-600 text-sm font-medium">-16,000 FCFA</div><span class="px-2 py-1 bg-orange-100 text-orange-700 text-xs font-medium rounded-full">En cours</span></div>
                        </div>
                    </div>
                </div>
                <div class="space-y-6">
                    <div class="bg-white p-6 rounded-xl shadow-sm">
                        <h3 class="text-lg font-inter font-semibold text-gray-900 mb-6">Moyens de Paiement</h3>
                        <div class="space-y-4">
                            <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg">
                                <div class="flex items-center space-x-3">
                                    <div class="w-10 h-10 flex items-center justify-center bg-blue-100 rounded-lg"><i class="ri-bank-card-line text-blue-600"></i></div>
                                    <div><div class="font-roboto text-gray-900 text-sm font-medium">Carte bancaire</div><div class="font-roboto text-gray-500 text-xs">**** 1234</div></div>
                                </div>
                                <span class="px-2 py-1 bg-green-100 text-green-700 text-xs font-medium rounded-full">Principal</span>
                            </div>
                            <div class="flex items-center justify-between p-4 border border-gray-200 rounded-lg">
                                <div class="flex items-center space-x-3">
                                    <div class="w-10 h-10 flex items-center justify-center bg-orange-100 rounded-lg"><i class="ri-smartphone-line text-orange-600"></i></div>
                                    <div><div class="font-roboto text-gray-900 text-sm font-medium">Orange Money</div><div class="font-roboto text-gray-500 text-xs">77 123 45 67</div></div>
                                </div>
                                <button class="text-primary hover:text-green-800 transition-colors text-sm">Modifier</button>
                            </div>
                            <button class="w-full px-4 py-3 border border-dashed border-gray-300 text-gray-600 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">+ Ajouter un moyen de paiement</button>
                        </div>
                    </div>
                    <div class="bg-white p-6 rounded-xl shadow-sm">
                        <h3 class="text-lg font-inter font-semibold text-gray-900 mb-6">Factures Récentes</h3>
                        <div class="space-y-3">
                            <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg"><div><div class="font-roboto text-gray-900 text-sm font-medium">#FAC-2024-089</div><div class="font-roboto text-gray-500 text-xs">450,000 FCFA</div></div><button class="text-primary hover:text-green-800 transition-colors"><i class="ri-download-line"></i></button></div>
                            <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg"><div><div class="font-roboto text-gray-900 text-sm font-medium">#FAC-2024-088</div><div class="font-roboto text-gray-500 text-xs">320,000 FCFA</div></div><button class="text-primary hover:text-green-800 transition-colors"><i class="ri-download-line"></i></button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
'@

$messagesContent = @'
        <div class="grid md:grid-cols-4 gap-8 h-auto md:h-96">
            <div class="bg-white rounded-xl shadow-sm">
                <div class="p-4 border-b border-gray-200"><h3 class="font-inter font-semibold text-gray-900">Messages</h3></div>
                <div class="overflow-y-auto h-80">
                    <div class="conversation-item p-4 border-b border-gray-100 hover:bg-gray-50 cursor-pointer active bg-primary text-white" onclick="selectConversation(this)">
                        <div class="flex items-center space-x-3">
                            <img src="https://readdy.ai/api/search-image?query=Professional%20African%20businesswoman%20portrait%2C%20confident%20female%20agricultural%20entrepreneur%2C%20smiling%20professional%20headshot&width=100&height=100&seq=contact001&orientation=squarish" alt="Contact" class="w-10 h-10 rounded-full object-cover object-top">
                            <div class="flex-1">
                                <div class="font-roboto text-sm font-medium">Fatou Diallo</div>
                                <div class="font-roboto text-xs truncate opacity-80">Intéressée par vos tomates...</div>
                            </div>
                            <div class="text-xs opacity-70">14:30</div>
                        </div>
                    </div>
                    <div class="conversation-item p-4 border-b border-gray-100 hover:bg-gray-50 cursor-pointer" onclick="selectConversation(this)">
                        <div class="flex items-center space-x-3">
                            <img src="https://readdy.ai/api/search-image?query=Professional%20African%20male%20entrepreneur%20portrait%2C%20confident%20businessman%20in%20agricultural%20sector%2C%20professional%20headshot&width=100&height=100&seq=contact002&orientation=squarish" alt="Contact" class="w-10 h-10 rounded-full object-cover object-top">
                            <div class="flex-1">
                                <div class="font-roboto text-gray-900 text-sm font-medium">Ibrahim Sarr</div>
                                <div class="font-roboto text-gray-500 text-xs truncate">Commande de 500kg...</div>
                            </div>
                            <div class="text-xs text-gray-400">12:15</div>
                        </div>
                    </div>
                    <div class="conversation-item p-4 border-b border-gray-100 hover:bg-gray-50 cursor-pointer" onclick="selectConversation(this)">
                        <div class="flex items-center space-x-3">
                            <img src="https://readdy.ai/api/search-image?query=Professional%20African%20female%20agricultural%20specialist%20portrait%2C%20confident%20woman%20in%20agriculture%2C%20professional%20headshot&width=100&height=100&seq=contact003&orientation=squarish" alt="Contact" class="w-10 h-10 rounded-full object-cover object-top">
                            <div class="flex-1">
                                <div class="font-roboto text-gray-900 text-sm font-medium">Aïssa Ndiaye</div>
                                <div class="font-roboto text-gray-500 text-xs truncate">Formation disponible...</div>
                            </div>
                            <div class="text-xs text-gray-400">Hier</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="md:col-span-3 bg-white rounded-xl shadow-sm flex flex-col mt-6 md:mt-0">
                <div class="p-4 border-b border-gray-200 flex items-center justify-between">
                    <div class="flex items-center space-x-3">
                        <img src="https://readdy.ai/api/search-image?query=Professional%20African%20businesswoman%20portrait%2C%20confident%20female%20agricultural%20entrepreneur%2C%20smiling%20professional%20headshot&width=100&height=100&seq=contact004&orientation=squarish" alt="Contact" class="w-10 h-10 rounded-full object-cover object-top">
                        <div><div class="font-inter font-semibold text-gray-900">Fatou Diallo</div><div class="font-roboto text-green-600 text-xs">En ligne</div></div>
                    </div>
                    <div class="flex items-center space-x-2">
                        <button class="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-primary transition-colors"><i class="ri-phone-line"></i></button>
                        <button class="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-primary transition-colors"><i class="ri-video-line"></i></button>
                    </div>
                </div>
                <div class="flex-1 p-4 overflow-y-auto" id="chat-messages">
                    <div class="space-y-4">
                        <div class="flex justify-start"><div class="max-w-xs bg-gray-100 rounded-lg px-4 py-2"><div class="font-roboto text-gray-900 text-sm">Bonjour Amadou, j'ai vu vos tomates sur la plateforme. Sont-elles encore disponibles ?</div><div class="font-roboto text-gray-500 text-xs mt-1">14:25</div></div></div>
                        <div class="flex justify-end"><div class="max-w-xs bg-primary text-white rounded-lg px-4 py-2"><div class="font-roboto text-white text-sm">Bonjour Fatou ! Oui, j'ai encore 500kg de tomates fraîches disponibles.</div><div class="font-roboto text-green-200 text-xs mt-1">14:27</div></div></div>
                        <div class="flex justify-start"><div class="max-w-xs bg-gray-100 rounded-lg px-4 py-2"><div class="font-roboto text-gray-900 text-sm">Parfait ! Quel est votre prix au kilo ? Et pouvez-vous livrer à Dakar ?</div><div class="font-roboto text-gray-500 text-xs mt-1">14:28</div></div></div>
                        <div class="flex justify-end"><div class="max-w-xs bg-primary text-white rounded-lg px-4 py-2"><div class="font-roboto text-white text-sm">Le prix est de 800 FCFA/kg. Pour la livraison à Dakar, c'est possible avec un supplément de 15,000 FCFA.</div><div class="font-roboto text-green-200 text-xs mt-1">14:30</div></div></div>
                    </div>
                </div>
                <div class="p-4 border-t border-gray-200">
                    <div class="flex items-center space-x-4">
                        <button class="w-10 h-10 flex items-center justify-center text-gray-400 hover:text-primary transition-colors"><i class="ri-attachment-line"></i></button>
                        <input type="text" placeholder="Tapez votre message..." class="flex-1 px-4 py-2 border border-gray-300 !rounded-button text-sm focus:outline-none focus:border-secondary">
                        <button class="px-4 py-2 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors whitespace-nowrap"><i class="ri-send-plane-line"></i></button>
                    </div>
                </div>
            </div>
        </div>
'@

$productsContent = @'
        <div class="space-y-8">
            <div class="flex items-center justify-between">
                <div>
                    <h2 class="text-2xl font-poppins font-semibold text-primary">Mes Produits</h2>
                    <p class="font-roboto text-gray-600 mt-1">Gérez vos produits et vos ventes</p>
                </div>
                <button class="px-4 py-2 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap" onclick="openProductModal()"><i class="ri-add-line mr-2"></i>Ajouter un produit</button>
            </div>
            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <img src="https://readdy.ai/api/search-image?query=Fresh%20red%20tomatoes%2C%20high%20quality%20organic%20tomatoes%2C%20bright%20red%20ripe%20tomatoes%20on%20white%20background%2C%20professional%20product%20photography&width=300&height=200&seq=product001&orientation=landscape" alt="Tomates" class="w-full h-32 object-cover object-top rounded-lg mb-4">
                    <div class="flex items-center justify-between mb-2"><h4 class="font-inter font-semibold text-gray-900">Tomates fraîches</h4><span class="px-2 py-1 bg-green-100 text-green-700 text-xs font-medium rounded-full">En stock</span></div>
                    <p class="font-roboto text-gray-600 text-sm mb-3">Tomates biologiques de qualité supérieure</p>
                    <div class="flex items-center justify-between mb-4"><div><div class="font-poppins font-bold text-primary">800 FCFA/kg</div><div class="font-roboto text-gray-500 text-sm">Stock: 500 kg</div></div></div>
                    <div class="flex space-x-2"><button class="flex-1 px-3 py-2 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">Modifier</button><button class="flex-1 px-3 py-2 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap">Voir détails</button></div>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <img src="https://readdy.ai/api/search-image?query=Fresh%20white%20onions%2C%20organic%20onions%20pile%2C%20quality%20onions%20on%20white%20background%2C%20professional%20vegetable%20photography&width=300&height=200&seq=product002&orientation=landscape" alt="Oignons" class="w-full h-32 object-cover object-top rounded-lg mb-4">
                    <div class="flex items-center justify-between mb-2"><h4 class="font-inter font-semibold text-gray-900">Oignons blancs</h4><span class="px-2 py-1 bg-orange-100 text-orange-700 text-xs font-medium rounded-full">Stock faible</span></div>
                    <p class="font-roboto text-gray-600 text-sm mb-3">Oignons de la vallée du fleuve Sénégal</p>
                    <div class="flex items-center justify-between mb-4"><div><div class="font-poppins font-bold text-primary">650 FCFA/kg</div><div class="font-roboto text-gray-500 text-sm">Stock: 80 kg</div></div></div>
                    <div class="flex space-x-2"><button class="flex-1 px-3 py-2 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">Modifier</button><button class="flex-1 px-3 py-2 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap">Voir détails</button></div>
                </div>
                <div class="bg-white p-6 rounded-xl shadow-sm">
                    <img src="https://readdy.ai/api/search-image?query=Fresh%20green%20lettuce%2C%20organic%20lettuce%20leaves%2C%20salad%20vegetables%20on%20white%20background%2C%20professional%20vegetable%20photography&width=300&height=200&seq=product003&orientation=landscape" alt="Salade" class="w-full h-32 object-cover object-top rounded-lg mb-4">
                    <div class="flex items-center justify-between mb-2"><h4 class="font-inter font-semibold text-gray-900">Salade verte</h4><span class="px-2 py-1 bg-red-100 text-red-700 text-xs font-medium rounded-full">Épuisé</span></div>
                    <p class="font-roboto text-gray-600 text-sm mb-3">Salade fraîche cultivée localement</p>
                    <div class="flex items-center justify-between mb-4"><div><div class="font-poppins font-bold text-gray-400">400 FCFA/kg</div><div class="font-roboto text-gray-500 text-sm">Stock: 0 kg</div></div></div>
                    <div class="flex space-x-2"><button class="flex-1 px-3 py-2 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">Modifier</button><button class="flex-1 px-3 py-2 bg-gray-300 text-gray-500 !rounded-button cursor-not-allowed font-inter text-sm whitespace-nowrap">Réapprovisionner</button></div>
                </div>
            </div>
            <div class="bg-white p-6 rounded-xl shadow-sm">
                <h3 class="text-lg font-inter font-semibold text-gray-900 mb-6">Commandes Récentes</h3>
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead>
                            <tr class="border-b border-gray-200">
                                <th class="text-left font-inter font-medium text-gray-700 pb-3">Commande</th>
                                <th class="text-left font-inter font-medium text-gray-700 pb-3">Client</th>
                                <th class="text-left font-inter font-medium text-gray-700 pb-3">Produits</th>
                                <th class="text-left font-inter font-medium text-gray-700 pb-3">Montant</th>
                                <th class="text-left font-inter font-medium text-gray-700 pb-3">Statut</th>
                                <th class="text-left font-inter font-medium text-gray-700 pb-3">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="border-b border-gray-100">
                                <td class="py-4"><div class="font-roboto text-gray-900 font-medium">#CMD-2024-156</div><div class="font-roboto text-gray-500 text-sm">18 mars 2024</div></td>
                                <td class="py-4"><div class="font-roboto text-gray-900">Fatou Diallo</div><div class="font-roboto text-gray-500 text-sm">Restaurant Teranga</div></td>
                                <td class="py-4"><div class="font-roboto text-gray-900">Tomates × 200kg</div><div class="font-roboto text-gray-500 text-sm">Oignons × 50kg</div></td>
                                <td class="py-4"><div class="font-roboto text-gray-900 font-medium">192,500 FCFA</div></td>
                                <td class="py-4"><span class="px-3 py-1 bg-green-100 text-green-700 text-sm font-medium rounded-full">Livrée</span></td>
                                <td class="py-4"><button class="text-primary hover:text-green-800 transition-colors font-inter text-sm">Voir détails</button></td>
                            </tr>
                            <tr class="border-b border-gray-100">
                                <td class="py-4"><div class="font-roboto text-gray-900 font-medium">#CMD-2024-155</div><div class="font-roboto text-gray-500 text-sm">16 mars 2024</div></td>
                                <td class="py-4"><div class="font-roboto text-gray-900">Ibrahim Sarr</div><div class="font-roboto text-gray-500 text-sm">Marché Sandaga</div></td>
                                <td class="py-4"><div class="font-roboto text-gray-900">Tomates × 300kg</div></td>
                                <td class="py-4"><div class="font-roboto text-gray-900 font-medium">240,000 FCFA</div></td>
                                <td class="py-4"><span class="px-3 py-1 bg-blue-100 text-blue-700 text-sm font-medium rounded-full">En cours</span></td>
                                <td class="py-4"><button class="text-primary hover:text-green-800 transition-colors font-inter text-sm">Suivre</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="product-modal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center p-4">
            <div class="bg-white rounded-xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
                <div class="p-6">
                    <div class="flex items-center justify-between mb-6">
                        <h3 class="text-xl font-inter font-semibold text-gray-900">Ajouter un Produit</h3>
                        <button onclick="closeProductModal()" class="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-gray-600 transition-colors"><i class="ri-close-line"></i></button>
                    </div>
                    <form class="space-y-6">
                        <div class="grid md:grid-cols-2 gap-6">
                            <div><label class="block font-inter font-medium text-gray-700 mb-2">Nom du produit</label><input type="text" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm"></div>
                            <div><label class="block font-inter font-medium text-gray-700 mb-2">Catégorie</label><select class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm pr-8"><option>Choisir une catégorie</option><option>Légumes</option><option>Fruits</option><option>Céréales</option><option>Tubercules</option></select></div>
                        </div>
                        <div><label class="block font-inter font-medium text-gray-700 mb-2">Description</label><textarea rows="4" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm resize-none"></textarea></div>
                        <div class="grid md:grid-cols-3 gap-4">
                            <div><label class="block font-inter font-medium text-gray-700 mb-2">Prix (FCFA/kg)</label><input type="number" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm"></div>
                            <div><label class="block font-inter font-medium text-gray-700 mb-2">Quantité (kg)</label><input type="number" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm"></div>
                            <div><label class="block font-inter font-medium text-gray-700 mb-2">Unité</label><select class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm pr-8"><option>kg</option><option>pièce</option><option>sac</option><option>caisse</option></select></div>
                        </div>
                        <div><label class="block font-inter font-medium text-gray-700 mb-2">Photos du produit</label><div class="border border-dashed border-gray-300 !rounded-button p-6 text-center"><i class="ri-image-add-line text-gray-400 text-3xl mb-2"></i><div class="font-roboto text-gray-600 text-sm mb-2">Glissez vos photos ici ou cliquez pour parcourir</div><button type="button" class="px-4 py-2 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">Choisir des fichiers</button></div></div>
                        <div class="flex items-center justify-end space-x-4 pt-6 border-t border-gray-200"><button type="button" onclick="closeProductModal()" class="px-6 py-3 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter whitespace-nowrap">Annuler</button><button type="submit" class="px-6 py-3 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter whitespace-nowrap">Ajouter le produit</button></div>
                    </form>
                </div>
            </div>
        </div>
'@

$formalitiesContent = @'
        <div class="space-y-8">
            <div class="flex items-center justify-between pb-2">
                <div>
                    <h2 class="text-2xl font-poppins font-semibold text-primary">Guichet Unique</h2>
                    <p class="font-roboto text-gray-600 mt-1 pt-1">Gérez toutes vos formalités administratives en un seul endroit</p>
                </div>
                <button class="px-4 py-2 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap" onclick="openNewApplicationModal()"><i class="ri-file-add-line mr-2"></i>Nouvelle demande</button>
            </div>
            <div class="grid md:grid-cols-4 gap-6">
                <div class="bg-white p-6 rounded-xl shadow-sm"><div class="flex items-center justify-between mb-4"><div class="w-12 h-12 flex items-center justify-center bg-blue-100 rounded-lg"><i class="ri-file-list-line text-blue-600 text-xl"></i></div></div><div class="text-2xl font-poppins font-bold text-gray-900 mb-1">8</div><div class="font-roboto text-gray-600 text-sm">Demandes en cours</div></div>
                <div class="bg-white p-6 rounded-xl shadow-sm"><div class="flex items-center justify-between mb-4"><div class="w-12 h-12 flex items-center justify-center bg-green-100 rounded-lg"><i class="ri-check-double-line text-green-600 text-xl"></i></div></div><div class="text-2xl font-poppins font-bold text-gray-900 mb-1">15</div><div class="font-roboto text-gray-600 text-sm">Demandes approuvées</div></div>
                <div class="bg-white p-6 rounded-xl shadow-sm"><div class="flex items-center justify-between mb-4"><div class="w-12 h-12 flex items-center justify-center bg-orange-100 rounded-lg"><i class="ri-time-line text-orange-600 text-xl"></i></div></div><div class="text-2xl font-poppins font-bold text-gray-900 mb-1">5j</div><div class="font-roboto text-gray-600 text-sm">Délai moyen</div></div>
                <div class="bg-white p-6 rounded-xl shadow-sm"><div class="flex items-center justify-between mb-4"><div class="w-12 h-12 flex items-center justify-center bg-purple-100 rounded-lg"><i class="ri-money-dollar-circle-line text-purple-600 text-xl"></i></div></div><div class="text-2xl font-poppins font-bold text-gray-900 mb-1">85K</div><div class="font-roboto text-gray-600 text-sm">Taxes payées (FCFA)</div></div>
            </div>
            <div class="bg-white rounded-xl shadow-sm overflow-hidden">
                <div class="p-6 border-b border-gray-200">
                    <div class="flex items-center justify-between">
                        <h3 class="text-lg font-inter font-semibold text-gray-900">Mes Demandes</h3>
                        <div class="flex space-x-2">
                            <select class="px-3 py-2 border border-gray-300 !rounded-button text-sm focus:outline-none focus:border-secondary pr-8"><option>Tous les statuts</option><option>En cours</option><option>Approuvé</option><option>Rejeté</option><option>En attente</option></select>
                            <button class="px-4 py-2 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap"><i class="ri-filter-line mr-2"></i>Filtrer</button>
                        </div>
                    </div>
                </div>
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="text-left font-inter font-medium text-gray-700 px-6 py-4">Référence</th>
                                <th class="text-left font-inter font-medium text-gray-700 px-6 py-4">Type de demande</th>
                                <th class="text-left font-inter font-medium text-gray-700 px-6 py-4">Date de dépôt</th>
                                <th class="text-left font-inter font-medium text-gray-700 px-6 py-4">Statut</th>
                                <th class="text-left font-inter font-medium text-gray-700 px-6 py-4">Délai restant</th>
                                <th class="text-left font-inter font-medium text-gray-700 px-6 py-4">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white">
                            <tr class="border-b border-gray-100"><td class="px-6 py-4"><div class="font-roboto text-gray-900 font-medium">#FRA-2024-089</div></td><td class="px-6 py-4"><div class="font-roboto text-gray-900">Certificat Phytosanitaire</div><div class="font-roboto text-gray-500 text-sm">Export tomates</div></td><td class="px-6 py-4"><div class="font-roboto text-gray-900">15 mars 2024</div></td><td class="px-6 py-4"><span class="px-3 py-1 bg-orange-100 text-orange-700 text-sm font-medium rounded-full">En cours d'examen</span></td><td class="px-6 py-4"><div class="font-roboto text-gray-900">2 jours</div></td><td class="px-6 py-4"><div class="flex space-x-2"><button class="text-primary hover:text-green-800 transition-colors font-inter text-sm" onclick="viewApplication('FRA-2024-089')">Voir</button><button class="text-blue-600 hover:text-blue-800 transition-colors font-inter text-sm">Suivre</button></div></td></tr>
                            <tr class="border-b border-gray-100"><td class="px-6 py-4"><div class="font-roboto text-gray-900 font-medium">#AGR-2024-045</div></td><td class="px-6 py-4"><div class="font-roboto text-gray-900">Agrément Transformation</div><div class="font-roboto text-gray-500 text-sm">Unité de conditionnement</div></td><td class="px-6 py-4"><div class="font-roboto text-gray-900">10 mars 2024</div></td><td class="px-6 py-4"><span class="px-3 py-1 bg-green-100 text-green-700 text-sm font-medium rounded-full">Approuvé</span></td><td class="px-6 py-4"><div class="font-roboto text-green-600">Terminé</div></td><td class="px-6 py-4"><div class="flex space-x-2"><button class="text-primary hover:text-green-800 transition-colors font-inter text-sm" onclick="viewApplication('AGR-2024-045')">Voir</button><button class="text-green-600 hover:text-green-800 transition-colors font-inter text-sm">Télécharger</button></div></td></tr>
                            <tr class="border-b border-gray-100"><td class="px-6 py-4"><div class="font-roboto text-gray-900 font-medium">#CER-2024-023</div></td><td class="px-6 py-4"><div class="font-roboto text-gray-900">Certificat Bio</div><div class="font-roboto text-gray-500 text-sm">Production maraîchère</div></td><td class="px-6 py-4"><div class="font-roboto text-gray-900">5 mars 2024</div></td><td class="px-6 py-4"><span class="px-3 py-1 bg-blue-100 text-blue-700 text-sm font-medium rounded-full">En attente de documents</span></td><td class="px-6 py-4"><div class="font-roboto text-orange-600">3 jours</div></td><td class="px-6 py-4"><div class="flex space-x-2"><button class="text-primary hover:text-green-800 transition-colors font-inter text-sm" onclick="viewApplication('CER-2024-023')">Voir</button><button class="text-orange-600 hover:text-orange-800 transition-colors font-inter text-sm">Compléter</button></div></td></tr>
                            <tr class="border-b border-gray-100"><td class="px-6 py-4"><div class="font-roboto text-gray-900 font-medium">#LIC-2024-012</div></td><td class="px-6 py-4"><div class="font-roboto text-gray-900">Licence d'exploitation</div><div class="font-roboto text-gray-500 text-sm">Périmètre irrigué</div></td><td class="px-6 py-4"><div class="font-roboto text-gray-900">1 mars 2024</div></td><td class="px-6 py-4"><span class="px-3 py-1 bg-red-100 text-red-700 text-sm font-medium rounded-full">Rejeté</span></td><td class="px-6 py-4"><div class="font-roboto text-red-600">Expiré</div></td><td class="px-6 py-4"><div class="flex space-x-2"><button class="text-primary hover:text-green-800 transition-colors font-inter text-sm" onclick="viewApplication('LIC-2024-012')">Voir</button><button class="text-blue-600 hover:text-blue-800 transition-colors font-inter text-sm">Renouveler</button></div></td></tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
                <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow"><div class="w-12 h-12 flex items-center justify-center bg-green-100 rounded-lg mb-4"><i class="ri-plant-line text-green-600 text-xl"></i></div><h4 class="font-inter font-semibold text-gray-900 mb-2">Certificat Phytosanitaire</h4><p class="font-roboto text-gray-600 text-sm mb-4">Pour l'exportation de produits végétaux</p><div class="flex items-center justify-between"><span class="font-roboto text-primary font-medium text-sm">15,000 FCFA</span><button class="px-3 py-1 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap" onclick="startApplication('phytosanitaire')">Demander</button></div></div>
                <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow"><div class="w-12 h-12 flex items-center justify-center bg-blue-100 rounded-lg mb-4"><i class="ri-building-line text-blue-600 text-xl"></i></div><h4 class="font-inter font-semibold text-gray-900 mb-2">Agrément Transformation</h4><p class="font-roboto text-gray-600 text-sm mb-4">Autorisation d'unité de transformation</p><div class="flex items-center justify-between"><span class="font-roboto text-primary font-medium text-sm">50,000 FCFA</span><button class="px-3 py-1 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap" onclick="startApplication('agrement')">Demander</button></div></div>
                <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow"><div class="w-12 h-12 flex items-center justify-center bg-purple-100 rounded-lg mb-4"><i class="ri-award-line text-purple-600 text-xl"></i></div><h4 class="font-inter font-semibold text-gray-900 mb-2">Certificat Bio</h4><p class="font-roboto text-gray-600 text-sm mb-4">Certification agriculture biologique</p><div class="flex items-center justify-between"><span class="font-roboto text-primary font-medium text-sm">25,000 FCFA</span><button class="px-3 py-1 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap" onclick="startApplication('bio')">Demander</button></div></div>
                <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow"><div class="w-12 h-12 flex items-center justify-center bg-orange-100 rounded-lg mb-4"><i class="ri-file-shield-line text-orange-600 text-xl"></i></div><h4 class="font-inter font-semibold text-gray-900 mb-2">Licence d'Exploitation</h4><p class="font-roboto text-gray-600 text-sm mb-4">Exploitation de périmètre agricole</p><div class="flex items-center justify-between"><span class="font-roboto text-primary font-medium text-sm">30,000 FCFA</span><button class="px-3 py-1 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap" onclick="startApplication('licence')">Demander</button></div></div>
                <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow"><div class="w-12 h-12 flex items-center justify-center bg-red-100 rounded-lg mb-4"><i class="ri-truck-line text-red-600 text-xl"></i></div><h4 class="font-inter font-semibold text-gray-900 mb-2">Autorisation Transport</h4><p class="font-roboto text-gray-600 text-sm mb-4">Transport de produits agricoles</p><div class="flex items-center justify-between"><span class="font-roboto text-primary font-medium text-sm">20,000 FCFA</span><button class="px-3 py-1 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap" onclick="startApplication('transport')">Demander</button></div></div>
                <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow"><div class="w-12 h-12 flex items-center justify-center bg-yellow-100 rounded-lg mb-4"><i class="ri-medicine-bottle-line text-yellow-600 text-xl"></i></div><h4 class="font-inter font-semibold text-gray-900 mb-2">Autorisation Pesticides</h4><p class="font-roboto text-gray-600 text-sm mb-4">Utilisation de produits phytosanitaires</p><div class="flex items-center justify-between"><span class="font-roboto text-primary font-medium text-sm">35,000 FCFA</span><button class="px-3 py-1 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter text-sm whitespace-nowrap" onclick="startApplication('pesticides')">Demander</button></div></div>
            </div>
        </div>
        <div id="new-application-modal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center p-4">
            <div class="bg-white rounded-xl max-w-4xl w-full max-h-[90vh] overflow-y-auto">
                <div class="p-6">
                    <div class="flex items-center justify-between mb-6"><h3 class="text-xl font-inter font-semibold text-gray-900">Nouvelle Demande Administrative</h3><button onclick="closeNewApplicationModal()" class="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-gray-600 transition-colors"><i class="ri-close-line"></i></button></div>
                    <form id="new-application-form" class="space-y-6">
                        <div class="grid md:grid-cols-2 gap-6">
                            <div><label class="block font-inter font-medium text-gray-700 mb-2">Type de demande *</label><select name="application_type" required class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm pr-8"><option value="">Sélectionnez un type</option><option value="phytosanitaire">Certificat Phytosanitaire</option><option value="agrement">Agrément Transformation</option><option value="bio">Certificat Bio</option><option value="licence">Licence d'Exploitation</option><option value="transport">Autorisation Transport</option><option value="pesticides">Autorisation Pesticides</option></select></div>
                            <div><label class="block font-inter font-medium text-gray-700 mb-2">Objet de la demande *</label><input type="text" name="subject" required class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm" placeholder="Décrivez brièvement votre demande"></div>
                        </div>
                        <div><label class="block font-inter font-medium text-gray-700 mb-2">Description détaillée *</label><textarea name="description" required rows="4" maxlength="500" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm resize-none" placeholder="Décrivez en détail votre demande et son contexte"></textarea><div class="text-right text-xs text-gray-500 mt-1"><span id="description-count">0</span>/500 caractères</div></div>
                        <div class="grid md:grid-cols-2 gap-6"><div><label class="block font-inter font-medium text-gray-700 mb-2">Produit concerné</label><input type="text" name="product" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm" placeholder="Type de produit agricole"></div><div><label class="block font-inter font-medium text-gray-700 mb-2">Quantité estimée</label><input type="text" name="quantity" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm" placeholder="Ex: 500 kg, 10 tonnes"></div></div>
                        <div class="grid md:grid-cols-2 gap-6"><div><label class="block font-inter font-medium text-gray-700 mb-2">Région d'activité *</label><select name="region" required class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm pr-8"><option value="">Choisissez votre région</option><option value="dakar">Dakar</option><option value="thies">Thiès</option><option value="saint-louis">Saint-Louis</option><option value="kolda">Kolda</option><option value="sedhiou">Sédhiou</option><option value="matam">Matam</option></select></div><div><label class="block font-inter font-medium text-gray-700 mb-2">Localité précise</label><input type="text" name="locality" class="w-full px-4 py-3 border border-gray-300 !rounded-button focus:outline-none focus:border-secondary text-sm" placeholder="Commune, village"></div></div>
                        <div><label class="block font-inter font-medium text-gray-700 mb-2">Documents justificatifs</label><div class="border border-dashed border-gray-300 !rounded-button p-6"><div class="text-center"><i class="ri-file-upload-line text-gray-400 text-3xl mb-2"></i><div class="font-roboto text-gray-600 text-sm mb-2">Glissez vos documents ici ou cliquez pour parcourir</div><button type="button" class="px-4 py-2 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">Choisir des fichiers</button></div><div class="mt-4 text-xs text-gray-500">Formats acceptés: PDF, JPG, PNG. Taille maximale: 5 Mo par fichier.</div></div></div>
                        <div class="bg-blue-50 p-4 rounded-lg"><div class="flex items-start space-x-3"><div class="w-6 h-6 flex items-center justify-center bg-blue-100 rounded-full mt-1"><i class="ri-information-line text-blue-600 text-sm"></i></div><div class="flex-1"><h4 class="font-inter font-medium text-blue-900 mb-1">Informations importantes</h4><ul class="font-roboto text-blue-800 text-sm space-y-1"><li>• Le traitement de votre demande peut prendre 5 à 15 jours ouvrables</li><li>• Vous recevrez des notifications par email à chaque étape</li><li>• Les documents manquants peuvent retarder le traitement</li><li>• Les frais de dossier sont payables après validation initiale</li></ul></div></div></div>
                        <div class="flex items-center justify-end space-x-4 pt-6 border-t border-gray-200"><button type="button" onclick="closeNewApplicationModal()" class="px-6 py-3 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter whitespace-nowrap">Annuler</button><button type="submit" class="px-6 py-3 bg-primary text-white !rounded-button hover:bg-green-800 transition-colors font-inter whitespace-nowrap">Soumettre la demande</button></div>
                    </form>
                </div>
            </div>
        </div>
        <div id="application-details-modal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center p-4">
            <div class="bg-white rounded-xl max-w-3xl w-full max-h-[90vh] overflow-y-auto">
                <div class="p-6">
                    <div class="flex items-center justify-between mb-6"><h3 class="text-xl font-inter font-semibold text-gray-900">Détail de la Demande</h3><button onclick="closeApplicationDetailsModal()" class="w-8 h-8 flex items-center justify-center text-gray-400 hover:text-gray-600 transition-colors"><i class="ri-close-line"></i></button></div>
                    <div class="bg-gray-50 p-6 rounded-lg mb-6">
                        <h4 class="font-inter font-semibold text-gray-900 mb-4">Informations de la demande</h4>
                        <div class="grid md:grid-cols-2 gap-4 text-sm">
                            <div><span class="font-roboto text-gray-600">Référence:</span><span id="app-reference" class="font-roboto text-gray-900 font-medium ml-2">#FRA-2024-089</span></div>
                            <div><span class="font-roboto text-gray-600">Type:</span><span id="app-type" class="font-roboto text-gray-900 font-medium ml-2">Certificat Phytosanitaire</span></div>
                            <div><span class="font-roboto text-gray-600">Date de dépôt:</span><span class="font-roboto text-gray-900 font-medium ml-2">15 mars 2024</span></div>
                            <div><span class="font-roboto text-gray-600">Statut:</span><span id="app-status" class="px-2 py-1 bg-orange-100 text-orange-700 text-xs font-medium rounded-full ml-2">En cours d'examen</span></div>
                        </div>
                    </div>
                    <div class="grid md:grid-cols-2 gap-6">
                        <div class="bg-white border border-gray-200 rounded-lg p-6">
                            <h4 class="font-inter font-semibold text-gray-900 mb-4">Suivi du dossier</h4>
                            <div class="space-y-4 text-sm text-gray-600"><div>Demande reçue</div><div>Vérification des documents</div><div class="text-orange-600 font-medium">Examen technique en cours</div><div>Validation finale</div></div>
                        </div>
                        <div class="bg-white border border-gray-200 rounded-lg p-6">
                            <h4 class="font-inter font-semibold text-gray-900 mb-4">Agent responsable</h4>
                            <div class="space-y-3 text-sm"><div class="font-roboto text-gray-900 font-medium">M. Ibrahima Dieng</div><div class="font-roboto text-gray-600">Inspecteur DPV</div><button class="w-full px-4 py-2 border border-gray-300 text-gray-700 !rounded-button hover:bg-gray-50 transition-colors font-inter text-sm whitespace-nowrap">Envoyer un message</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
'@

$chartScript = @'
<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.5.0/echarts.min.js"></script>
<script>
    function initCharts() {
        if (typeof echarts === 'undefined') return;
        const productionChartEl = document.getElementById('production-chart');
        const salesChartEl = document.getElementById('sales-chart');
        if (!productionChartEl || !salesChartEl) return;
        const productionChart = echarts.init(productionChartEl);
        const salesChart = echarts.init(salesChartEl);
        productionChart.setOption({
            animation: false,
            grid: { top: 20, right: 20, bottom: 40, left: 60 },
            xAxis: { type: 'category', data: ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Jun'] },
            yAxis: { type: 'value' },
            series: [{
                data: [1200, 1800, 2100, 2450, 2200, 2600],
                type: 'line',
                smooth: true,
                areaStyle: { color: { type: 'linear', x: 0, y: 0, x2: 0, y2: 1, colorStops: [{ offset: 0, color: 'rgba(46, 125, 50, 0.25)' }, { offset: 1, color: 'rgba(46, 125, 50, 0.04)' }] } },
                lineStyle: { color: '#2E7D32', width: 3 },
                itemStyle: { color: '#2E7D32' },
                showSymbol: false
            }]
        });
        salesChart.setOption({
            animation: false,
            series: [{
                type: 'pie',
                radius: ['40%', '70%'],
                data: [
                    { value: 45, name: 'Tomates', itemStyle: { color: '#57B5E7' } },
                    { value: 30, name: 'Oignons', itemStyle: { color: '#8DD3C7' } },
                    { value: 15, name: 'Salade', itemStyle: { color: '#FBBF72' } },
                    { value: 10, name: 'Autres', itemStyle: { color: '#FC8D62' } }
                ],
                label: { show: true, formatter: '{b}: {c}%' }
            }]
        });
        window.addEventListener('resize', () => {
            productionChart.resize();
            salesChart.resize();
        });
    }
    document.addEventListener('DOMContentLoaded', initCharts);
</script>
'@

$messageScript = @'
<script>
    function selectConversation(element) {
        document.querySelectorAll('.conversation-item').forEach(item => {
            item.classList.remove('active', 'bg-primary', 'text-white');
        });
        element.classList.add('active', 'bg-primary', 'text-white');
    }
</script>
'@

$productScript = @'
<script>
    function openProductModal() {
        document.getElementById('product-modal').classList.remove('hidden');
    }
    function closeProductModal() {
        document.getElementById('product-modal').classList.add('hidden');
    }
</script>
'@

$formalitiesScript = @'
<script>
    function openNewApplicationModal() {
        document.getElementById('new-application-modal').classList.remove('hidden');
    }
    function closeNewApplicationModal() {
        document.getElementById('new-application-modal').classList.add('hidden');
    }
    function viewApplication(reference) {
        document.getElementById('app-reference').textContent = '#' + reference.replace('#', '');
        document.getElementById('application-details-modal').classList.remove('hidden');
    }
    function closeApplicationDetailsModal() {
        document.getElementById('application-details-modal').classList.add('hidden');
    }
    function startApplication(type) {
        openNewApplicationModal();
        const select = document.querySelector('select[name="application_type"]');
        if (select) select.value = type;
    }
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('new-application-form');
        const description = form ? form.querySelector('textarea[name="description"]') : null;
        const counter = document.getElementById('description-count');
        if (description && counter) {
            description.addEventListener('input', function () {
                counter.textContent = this.value.length;
            });
        }
        if (form) {
            form.addEventListener('submit', function (e) {
                e.preventDefault();
                closeNewApplicationModal();
            });
        }
    });
</script>
'@

$end = @'
    </div>
</section>
</body>
</html>
'@

function Build-Page([string]$active, [string]$content, [string]$extraScripts = '') {
    return $commonHead + $header + (Get-Nav $active) + $content + $extraScripts + $end
}

Set-Content -Path 'tableauDeBord.html' -Value (Build-Page 'overview' $overviewContent $chartScript) -Encoding UTF8
Set-Content -Path 'profil.html' -Value (Build-Page 'profile' $profileContent) -Encoding UTF8
Set-Content -Path 'paiement.html' -Value (Build-Page 'payments' $paymentsContent) -Encoding UTF8
Set-Content -Path 'messages.html' -Value (Build-Page 'messages' $messagesContent $messageScript) -Encoding UTF8
Set-Content -Path 'produit.html' -Value (Build-Page 'marketplace' $productsContent $productScript) -Encoding UTF8
Set-Content -Path 'formalites.html' -Value (Build-Page 'formalities' $formalitiesContent $formalitiesScript) -Encoding UTF8



