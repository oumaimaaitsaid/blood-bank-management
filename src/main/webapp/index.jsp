<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banque de Sang Maroc - Système de Gestion</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .hero-gradient {
            background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
        }
        .card-hover {
            transition: all 0.3s ease;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
        .pulse-urgent {
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.7; }
        }
    </style>
</head>
<body class="bg-gray-50 text-gray-800 font-sans">

<!-- 🔴 Header Amélioré -->
<header class="hero-gradient shadow-lg sticky top-0 z-50">
    <div class="container mx-auto flex justify-between items-center p-4">
        <div class="flex items-center space-x-3">
            <div class="w-10 h-10 bg-white rounded-full flex items-center justify-center">
                <i class="fas fa-tint text-red-600 text-xl"></i>
            </div>
            <div>
                <h1 class="text-2xl font-bold text-white">Banque de Sang Maroc</h1>
                <p class="text-red-100 text-sm">Système de Gestion National</p>
            </div>
        </div>

        <nav class="hidden md:flex space-x-6">
            <a href="#" class="text-white font-semibold border-b-2 border-white pb-1">Accueil</a>
            <a href="donneur" class="text-red-100 hover:text-white transition-colors">Donneurs</a>
            <a href="receveur" class="text-red-100 hover:text-white transition-colors">Receveurs</a>
            <a href="matching" class="text-red-100 hover:text-white transition-colors">Matching</a>
            <a href="analytics" class="text-red-100 hover:text-white transition-colors">Statistiques</a>
        </nav>

        <div class="flex items-center space-x-4">
            <div class="hidden md:flex items-center space-x-2 bg-red-700 px-3 py-1 rounded-full">
                <div class="w-2 h-2 bg-green-400 rounded-full animate-pulse"></div>
                <span class="text-white text-sm">En ligne</span>
            </div>
            <button class="bg-white text-red-600 px-4 py-2 rounded-lg font-semibold hover:bg-gray-100 transition">
                <i class="fas fa-sign-in-alt mr-2"></i>Connexion
            </button>
        </div>
    </div>
</header>

<!-- 🚨 Bannière Urgence -->
<div class="bg-red-500 text-white py-3">
    <div class="container mx-auto text-center">
        <div class="flex items-center justify-center space-x-3">
            <i class="fas fa-exclamation-triangle pulse-urgent"></i>
            <span class="font-semibold">URGENT : Besoin critique de sang O- et O+</span>
            <a href="#" class="bg-white text-red-600 px-3 py-1 rounded text-sm font-semibold hover:bg-gray-100 ml-4">
                Faire un don maintenant
            </a>
        </div>
    </div>
</div>

<!-- 🩸 Hero Section Améliorée -->
<section class="relative bg-white overflow-hidden">
    <div class="container mx-auto flex flex-col md:flex-row items-center py-16 px-6">
        <div class="md:w-1/2 mb-10 md:mb-0">
            <div class="bg-red-50 inline-block px-4 py-2 rounded-full mb-6">
                <span class="text-red-600 font-semibold text-sm">
                    <i class="fas fa-heart mr-2"></i>Votre sang, leur vie
                </span>
            </div>
            <h2 class="text-5xl font-extrabold text-gray-900 mb-6 leading-tight">
                Ce qui est en vous peut <span class="text-red-600">sauver des vies</span> ❤️
            </h2>
            <p class="text-xl text-gray-600 mb-8 leading-relaxed">
                Chaque don de sang peut sauver jusqu'à trois vies. Rejoignez notre communauté de héros
                anonymes et faites la différence dès aujourd'hui au Maroc.
            </p>
            <div class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4">
                <a href="donneurs.jsp" class="bg-red-600 text-white px-8 py-4 rounded-lg hover:bg-red-700 transition-all font-semibold text-lg shadow-lg hover:shadow-xl">
                    <i class="fas fa-hand-holding-heart mr-2"></i>Devenir donneur
                </a>
                <a href="#" class="border-2 border-red-600 text-red-600 px-8 py-4 rounded-lg hover:bg-red-600 hover:text-white transition-all font-semibold text-lg">
                    <i class="fas fa-play-circle mr-2"></i>Voir la vidéo
                </a>
            </div>

            <!-- Stats rapides -->
            <div class="grid grid-cols-3 gap-6 mt-12 pt-8 border-t border-gray-200">
                <div class="text-center">
                    <div class="text-2xl font-bold text-red-600">15K+</div>
                    <div class="text-sm text-gray-600">Donneurs actifs</div>
                </div>
                <div class="text-center">
                    <div class="text-2xl font-bold text-red-600">45K+</div>
                    <div class="text-sm text-gray-600">Vies sauvées</div>
                </div>
                <div class="text-center">
                    <div class="text-2xl font-bold text-red-600">98%</div>
                    <div class="text-sm text-gray-600">Satisfaction</div>
                </div>
            </div>
        </div>

        <div class="md:w-1/2 relative">
            <div class="relative">
                <img src="images/don-sang.jpg" alt="Don de sang" class="rounded-2xl shadow-2xl w-full">
                <div class="absolute -bottom-6 -left-6 bg-white p-6 rounded-2xl shadow-lg">
                    <div class="flex items-center space-x-3">
                        <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center">
                            <i class="fas fa-check text-green-600 text-xl"></i>
                        </div>
                        <div>
                            <div class="font-bold text-gray-900">Processus sûr</div>
                            <div class="text-sm text-gray-600">100% stérile</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 🧭 Liens rapides Améliorés -->
<section class="container mx-auto py-16 px-4">
    <div class="text-center mb-12">
        <h2 class="text-4xl font-bold text-gray-900 mb-4">Comment contribuer ?</h2>
        <p class="text-xl text-gray-600 max-w-2xl mx-auto">
            Plusieurs façons de participer à cette chaîne de solidarité nationale
        </p>
    </div>

    <div class="grid md:grid-cols-3 gap-8">
        <div class="bg-white p-8 rounded-2xl shadow-lg card-hover border-t-4 border-red-500">
            <div class="w-16 h-16 bg-red-100 rounded-2xl flex items-center justify-center mb-6">
                <i class="fas fa-stethoscope text-red-600 text-2xl"></i>
            </div>
            <h3 class="font-bold text-xl mb-4">Test d'éligibilité</h3>
            <p class="text-gray-600 mb-6">Vérifiez en 2 minutes si vous pouvez donner votre sang selon les critères médicaux en vigueur.</p>
            <a href="#" class="text-red-600 font-semibold hover:text-red-700 inline-flex items-center">
                Faire le test maintenant
                <i class="fas fa-arrow-right ml-2"></i>
            </a>
        </div>

        <div class="bg-white p-8 rounded-2xl shadow-lg card-hover border-t-4 border-blue-500">
            <div class="w-16 h-16 bg-blue-100 rounded-2xl flex items-center justify-center mb-6">
                <i class="fas fa-map-marker-alt text-blue-600 text-2xl"></i>
            </div>
            <h3 class="font-bold text-xl mb-4">Trouver un centre</h3>
            <p class="text-gray-600 mb-6">Localisez le centre de don le plus proche de chez vous parmi nos 50 centres au Maroc.</p>
            <a href="#" class="text-blue-600 font-semibold hover:text-blue-700 inline-flex items-center">
                Voir la carte interactive
                <i class="fas fa-arrow-right ml-2"></i>
            </a>
        </div>

        <div class="bg-white p-8 rounded-2xl shadow-lg card-hover border-t-4 border-green-500">
            <div class="w-16 h-16 bg-green-100 rounded-2xl flex items-center justify-center mb-6">
                <i class="fas fa-chart-line text-green-600 text-2xl"></i>
            </div>
            <h3 class="font-bold text-xl mb-4">Niveau des stocks</h3>
            <p class="text-gray-600 mb-6">Consultez en temps réel le niveau des stocks pour chaque groupe sanguin dans votre région.</p>
            <a href="#" class="text-green-600 font-semibold hover:text-green-700 inline-flex items-center">
                Voir les niveaux
                <i class="fas fa-arrow-right ml-2"></i>
            </a>
        </div>
    </div>
</section>

<!-- 📊 Section Statistiques -->
<section class="bg-gray-100 py-16">
    <div class="container mx-auto px-4">
        <div class="text-center mb-12">
            <h2 class="text-4xl font-bold text-gray-900 mb-4">Impact National</h2>
            <p class="text-xl text-gray-600">Notre contribution à la santé publique marocaine</p>
        </div>

        <div class="grid md:grid-cols-4 gap-8">
            <div class="bg-white p-6 rounded-xl text-center shadow-md">
                <div class="text-3xl font-bold text-red-600 mb-2">156</div>
                <div class="text-gray-600">Centres partenaires</div>
            </div>
            <div class="bg-white p-6 rounded-xl text-center shadow-md">
                <div class="text-3xl font-bold text-red-600 mb-2">24/7</div>
                <div class="text-gray-600">Disponibilité</div>
            </div>
            <div class="bg-white p-6 rounded-xl text-center shadow-md">
                <div class="text-3xl font-bold text-red-600 mb-2">85%</div>
                <div class="text-gray-600">Taux de satisfaction</div>
            </div>
            <div class="bg-white p-6 rounded-xl text-center shadow-md">
                <div class="text-3xl font-bold text-red-600 mb-2">50K+</div>
                <div class="text-gray-600">Dons cette année</div>
            </div>
        </div>
    </div>
</section>

<!-- 📰 Actualités Améliorées -->
<section class="bg-white py-16 px-6">
    <div class="container mx-auto">
        <div class="flex justify-between items-center mb-12">
            <div>
                <h2 class="text-4xl font-bold text-gray-900">Actualités & Campagnes</h2>
                <p class="text-gray-600 mt-2">Restez informé des dernières nouvelles et urgences</p>
            </div>
            <a href="#" class="hidden md:flex items-center text-red-600 font-semibold hover:text-red-700">
                Voir toutes les actualités
                <i class="fas fa-arrow-right ml-2"></i>
            </a>
        </div>

        <div class="grid md:grid-cols-3 gap-8">
            <div class="bg-gray-50 rounded-2xl overflow-hidden shadow-lg card-hover">
                <div class="h-48 bg-red-100 relative">
                    <div class="absolute top-4 left-4 bg-red-600 text-white px-3 py-1 rounded-full text-sm font-semibold">
                        URGENT
                    </div>
                </div>
                <div class="p-6">
                    <h3 class="font-bold text-xl mb-3">Besoin urgent de donneurs O+</h3>
                    <p class="text-gray-600 mb-4">Les stocks de sang O+ sont actuellement très bas dans la région de Casablanca. Faites un don aujourd'hui !</p>
                    <div class="flex items-center justify-between">
                        <span class="text-sm text-gray-500"><i class="far fa-clock mr-1"></i>Il y a 2 heures</span>
                        <a href="#" class="text-red-600 font-semibold text-sm">Lire plus</a>
                    </div>
                </div>
            </div>

            <div class="bg-gray-50 rounded-2xl overflow-hidden shadow-lg card-hover">
                <div class="h-48 bg-blue-100"></div>
                <div class="p-6">
                    <h3 class="font-bold text-xl mb-3">Journée mondiale du don</h3>
                    <p class="text-gray-600 mb-4">Participez à notre campagne spéciale le 14 juin pour célébrer les donneurs du monde entier.</p>
                    <div class="flex items-center justify-between">
                        <span class="text-sm text-gray-500"><i class="far fa-clock mr-1"></i>Il y a 1 jour</span>
                        <a href="#" class="text-red-600 font-semibold text-sm">Lire plus</a>
                    </div>
                </div>
            </div>

            <div class="bg-gray-50 rounded-2xl overflow-hidden shadow-lg card-hover">
                <div class="h-48 bg-green-100"></div>
                <div class="p-6">
                    <h3 class="font-bold text-xl mb-3">Nouveau centre à Casablanca</h3>
                    <p class="text-gray-600 mb-4">Découvrez notre nouveau centre de don ouvert cette semaine avec des équipements modernes.</p>
                    <div class="flex items-center justify-between">
                        <span class="text-sm text-gray-500"><i class="far fa-clock mr-1"></i>Il y a 3 jours</span>
                        <a href="#" class="text-red-600 font-semibold text-sm">Lire plus</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ⚪ Footer Amélioré -->
<footer class="hero-gradient text-white pt-12 pb-6">
    <div class="container mx-auto px-4">
        <div class="grid md:grid-cols-4 gap-8 mb-8">
            <div>
                <div class="flex items-center space-x-3 mb-4">
                    <div class="w-10 h-10 bg-white rounded-full flex items-center justify-center">
                        <i class="fas fa-tint text-red-600 text-xl"></i>
                    </div>
                    <span class="text-xl font-bold">Banque de Sang Maroc</span>
                </div>
                <p class="text-red-100 mb-4">
                    Système national de gestion des dons de sang sous la supervision du Ministère de la Santé.
                </p>
                <div class="flex space-x-3">
                    <a href="#" class="w-8 h-8 bg-red-700 rounded-full flex items-center justify-center hover:bg-red-600">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="w-8 h-8 bg-red-700 rounded-full flex items-center justify-center hover:bg-red-600">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="w-8 h-8 bg-red-700 rounded-full flex items-center justify-center hover:bg-red-600">
                        <i class="fab fa-instagram"></i>
                    </a>
                </div>
            </div>

            <div>
                <h4 class="font-bold text-lg mb-4">Liens rapides</h4>
                <ul class="space-y-2">
                    <li><a href="#" class="text-red-100 hover:text-white transition">Devenir donneur</a></li>
                    <li><a href="#" class="text-red-100 hover:text-white transition">Centres de don</a></li>
                    <li><a href="#" class="text-red-100 hover:text-white transition">Éligibilité</a></li>
                    <li><a href="#" class="text-red-100 hover:text-white transition">Actualités</a></li>
                </ul>
            </div>

            <div>
                <h4 class="font-bold text-lg mb-4">Contact</h4>
                <ul class="space-y-2">
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-phone text-red-200"></i>
                        <span class="text-red-100">0522 123 456</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-envelope text-red-200"></i>
                        <span class="text-red-100">contact@banquesang.ma</span>
                    </li>
                    <li class="flex items-center space-x-2">
                        <i class="fas fa-map-marker-alt text-red-200"></i>
                        <span class="text-red-100">Rabat, Maroc</span>
                    </li>
                </ul>
            </div>

            <div>
                <h4 class="font-bold text-lg mb-4">Urgences</h4>
                <div class="bg-red-700 p-4 rounded-lg">
                    <p class="text-sm mb-2">Besoin urgent de sang ?</p>
                    <a href="tel:141" class="bg-white text-red-600 px-4 py-2 rounded font-semibold text-sm hover:bg-gray-100 inline-block">
                        <i class="fas fa-phone mr-1"></i>Appeler le 141
                    </a>
                </div>
            </div>
        </div>

        <div class="border-t border-red-500 pt-6 text-center">
            <p class="text-red-100">
                © 2025 Banque de Sang Maroc - Système de Gestion JEE. Tous droits réservés.
            </p>
            <p class="text-red-200 text-sm mt-2">
                Développé avec ❤️ pour sauver des vies
            </p>
        </div>
    </div>
</footer>

</body>
</html>