<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouveau Donneur - Banque de Sang Maroc</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .card-hover {
            transition: all 0.3s ease;
        }
        .card-hover:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body class="bg-gray-50 min-h-screen">

<!-- Header -->
<header class="bg-red-600 text-white shadow-lg">
    <div class="container mx-auto flex justify-between items-center p-4">
        <div class="flex items-center space-x-3">
            <div class="w-10 h-10 bg-white rounded-full flex items-center justify-center">
                <i class="fas fa-tint text-red-600 text-xl"></i>
            </div>
            <div>
                <h1 class="text-xl font-bold">Banque de Sang Maroc</h1>
                <p class="text-red-100 text-sm">Système de Gestion</p>
            </div>
        </div>

        <nav class="hidden md:flex space-x-6">
            <a href="index.jsp" class="text-red-100 hover:text-white transition">Accueil</a>
            <a href="donneur?action=list" class="text-white border-b-2 border-white">Donneurs</a>
            <a href="receveur" class="text-red-100 hover:text-white transition">Receveurs</a>
            <a href="matching" class="text-red-100 hover:text-white transition">Matching</a>
        </nav>
    </div>
</header>

<!-- Main Content -->
<div class="container mx-auto px-4 py-8 max-w-4xl">
    <!-- En-tête de page -->
    <div class="text-center mb-8">
        <h1 class="text-3xl font-bold text-gray-900 mb-2">Nouveau Donneur</h1>
        <p class="text-gray-600">Enregistrez un nouveau donneur dans le système</p>
    </div>

    <!-- Carte du formulaire -->
    <div class="bg-white rounded-2xl shadow-lg card-hover overflow-hidden">
        <!-- En-tête de la carte -->
        <div class="bg-red-600 text-white px-6 py-4">
            <div class="flex items-center space-x-3">
                <div class="w-10 h-10 bg-white bg-opacity-20 rounded-full flex items-center justify-center">
                    <i class="fas fa-user-plus text-xl"></i>
                </div>
                <div>
                    <h2 class="text-xl font-bold">Informations Personnelles</h2>
                    <p class="text-red-100 text-sm">Tous les champs sont obligatoires</p>
                </div>
            </div>
        </div>

        <!-- Formulaire -->
        <form action="donneur" method="post" class="p-6 space-y-6">
            <!-- Section Informations de base -->
            <div class="grid md:grid-cols-2 gap-6">
                <!-- Nom -->
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">
                        <i class="fas fa-user mr-2 text-red-600"></i>Nom
                    </label>
                    <input type="text" name="nom" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition"
                           placeholder="Entrez le nom">
                </div>

                <!-- Prénom -->
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">
                        <i class="fas fa-user mr-2 text-red-600"></i>Prénom
                    </label>
                    <input type="text" name="prenom" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition"
                           placeholder="Entrez le prénom">
                </div>
            </div>

            <!-- Section Identification -->
            <div class="grid md:grid-cols-2 gap-6">
                <!-- CIN -->
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">
                        <i class="fas fa-id-card mr-2 text-red-600"></i>CIN
                    </label>
                    <input type="text" name="cin" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition"
                           placeholder="Ex: AB123456">
                </div>

                <!-- Téléphone -->
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">
                        <i class="fas fa-phone mr-2 text-red-600"></i>Téléphone
                    </label>
                    <input type="text" name="telephone" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition"
                           placeholder="Ex: 0612345678">
                </div>
            </div>

            <!-- Section Démographique -->
            <div class="grid md:grid-cols-2 gap-6">
                <!-- Date de naissance -->
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">
                        <i class="fas fa-calendar-alt mr-2 text-red-600"></i>Date de naissance
                    </label>
                    <input type="date" name="dateNaissance" required
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition">
                </div>

                <!-- Sexe -->
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">
                        <i class="fas fa-venus-mars mr-2 text-red-600"></i>Sexe
                    </label>
                    <select name="sexe" required
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition">
                        <option value="">Sélectionnez le sexe</option>
                        <option value="H">Homme</option>
                        <option value="F">Femme</option>
                    </select>
                </div>
            </div>

            <!-- Section Médicale -->
            <div class="grid md:grid-cols-2 gap-6">
                <!-- Poids -->
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">
                        <i class="fas fa-weight mr-2 text-red-600"></i>Poids (kg)
                    </label>
                    <input type="number" name="poids" required min="40" max="150"
                           class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition"
                           placeholder="Ex: 65">
                    <p class="text-xs text-gray-500 mt-1">Minimum requis: 50 kg</p>
                </div>

                <!-- Groupe sanguin -->
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">
                        <i class="fas fa-tint mr-2 text-red-600"></i>Groupe sanguin
                    </label>
                    <select name="groupeSanguin" required
                            class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition">
                        <option value="">Sélectionnez le groupe</option>
                        <c:forEach var="g" items="${groupes}">
                            <option value="${g}">${g}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <!-- Section Conditions Médicales -->
            <div class="border-t pt-6">
                <label class="block text-sm font-semibold text-gray-700 mb-4">
                    <i class="fas fa-file-medical mr-2 text-red-600"></i>
                    Conditions médicales (contre-indications)
                </label>
                <p class="text-sm text-gray-600 mb-4">Cochez les conditions médicales présentes :</p>

                <div class="grid md:grid-cols-2 gap-4">
                    <c:forEach var="c" items="${conditions}">
                        <div class="flex items-center space-x-3 p-3 border border-gray-200 rounded-lg hover:bg-gray-50 transition">
                            <input type="checkbox" name="conditions" value="${c.id}"
                                   class="w-4 h-4 text-red-600 border-gray-300 rounded focus:ring-red-500">
                            <label class="text-sm text-gray-700">${c.name}</label>
                        </div>
                    </c:forEach>
                </div>

                <div class="mt-4 p-4 bg-yellow-50 border border-yellow-200 rounded-lg">
                    <div class="flex items-start space-x-3">
                        <i class="fas fa-exclamation-triangle text-yellow-600 mt-1"></i>
                        <div>
                            <p class="text-sm font-semibold text-yellow-800">Critères d'éligibilité</p>
                            <p class="text-xs text-yellow-700 mt-1">
                                Le donneur sera automatiquement marqué comme NON_ELIGIBLE s'il a moins de 18 ans,
                                plus de 65 ans, pèse moins de 50kg ou présente des contre-indications médicales.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Boutons d'action -->
            <div class="flex flex-col sm:flex-row gap-4 pt-6 border-t">
                <button type="submit"
                        class="flex-1 bg-red-600 text-white py-4 px-6 rounded-lg hover:bg-red-700 transition font-semibold text-lg shadow-lg hover:shadow-xl">
                    <i class="fas fa-save mr-2"></i>Enregistrer le Donneur
                </button>
                <a href="donneur?action=list"
                   class="flex-1 bg-gray-500 text-white py-4 px-6 rounded-lg hover:bg-gray-600 transition font-semibold text-lg text-center">
                    <i class="fas fa-times mr-2"></i>Annuler
                </a>
            </div>
        </form>
    </div>

    <!-- Indicateurs d'éligibilité -->
    <div class="grid md:grid-cols-3 gap-6 mt-8">
        <div class="bg-white p-4 rounded-lg shadow text-center">
            <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-2">
                <i class="fas fa-check text-green-600"></i>
            </div>
            <p class="font-semibold text-gray-700">Âge: 18-65 ans</p>
        </div>
        <div class="bg-white p-4 rounded-lg shadow text-center">
            <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-2">
                <i class="fas fa-weight text-green-600"></i>
            </div>
            <p class="font-semibold text-gray-700">Poids: ≥50 kg</p>
        </div>
        <div class="bg-white p-4 rounded-lg shadow text-center">
            <div class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-2">
                <i class="fas fa-heart text-green-600"></i>
            </div>
            <p class="font-semibold text-gray-700">Bon état de santé</p>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-red-600 text-white py-6 mt-12">
    <div class="container mx-auto text-center">
        <p class="text-sm">© 2025 Banque de Sang Maroc - Système de Gestion</p>
        <p class="text-red-100 text-xs mt-1">Formulaire d'enregistrement des donneurs</p>
    </div>
</footer>

</body>
</html>