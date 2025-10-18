<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Receveurs - Banque de Sang Maroc</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
            <a href="donneur?action=list" class="text-red-100 hover:text-white transition">Donneurs</a>
            <a href="receveur?action=list" class="text-white border-b-2 border-white">Receveurs</a>
            <a href="matching" class="text-red-100 hover:text-white transition">Matching</a>
        </nav>
    </div>
</header>

<!-- Main Content -->
<div class="container mx-auto px-4 py-8">
    <!-- En-tête de page -->
    <div class="flex flex-col lg:flex-row justify-between items-start lg:items-center mb-8 gap-4">
        <div>
            <h1 class="text-3xl font-bold text-gray-900 mb-2">Liste des Receveurs</h1>
            <p class="text-gray-600">Gestion des patients nécessitant une transfusion</p>
        </div>

        <a href="receveur?action=form"
           class="bg-red-600 text-white px-6 py-3 rounded-lg hover:bg-red-700 transition font-semibold shadow-lg">
            <i class="fas fa-user-plus mr-2"></i>Nouveau Receveur
        </a>
    </div>

    <!-- Tableau des receveurs -->
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-red-600 text-white">
                    <tr>
                        <th class="px-6 py-4 text-left font-semibold">Nom</th>
                        <th class="px-6 py-4 text-left font-semibold">Prénom</th>
                        <th class="px-6 py-4 text-left font-semibold">Groupe</th>
                        <th class="px-6 py-4 text-left font-semibold">Besoin</th>
                        <th class="px-6 py-4 text-left font-semibold">Poches Requises</th>
                        <th class="px-6 py-4 text-left font-semibold">Poches Reçues</th>
                        <th class="px-6 py-4 text-left font-semibold">État</th>
                        <th class="px-6 py-4 text-left font-semibold">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <c:forEach var="r" items="${receveurs}">
                        <tr class="hover:bg-gray-50 transition">
                            <!-- Nom -->
                            <td class="px-6 py-4">
                                <p class="font-semibold text-gray-900">${r.nom}</p>
                            </td>

                            <!-- Prénom -->
                            <td class="px-6 py-4">
                                <p class="text-gray-900">${r.prenom}</p>
                            </td>

                            <!-- Groupe sanguin -->
                            <td class="px-6 py-4">
                                <div class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                    <i class="fas fa-tint mr-1"></i>${r.groupe}
                                </div>
                            </td>

                            <!-- Besoin -->
                            <td class="px-6 py-4">
                                <c:choose>
                                    <c:when test="${r.besoin == 'CRITIQUE'}">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                                            <i class="fas fa-exclamation-triangle mr-1"></i>CRITIQUE
                                        </span>
                                    </c:when>
                                    <c:when test="${r.besoin == 'URGENT'}">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-orange-100 text-orange-800">
                                            <i class="fas fa-clock mr-1"></i>URGENT
                                        </span>
                                    </c:when>
                                    <c:when test="${r.besoin == 'NORMAL'}">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                            <i class="fas fa-check mr-1"></i>NORMAL
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-500">${r.besoin}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <!-- Poches Requises -->
                            <td class="px-6 py-4">
                                <div class="flex items-center space-x-2">
                                    <span class="text-gray-900 font-semibold">${r.pochesRequises}</span>
                                    <span class="text-gray-500 text-sm">poche(s)</span>
                                </div>
                            </td>

                            <!-- Poches Reçues -->
                            <td class="px-6 py-4">
                                <div class="flex items-center space-x-2">
                                    <span class="text-gray-900 font-semibold">${r.pochesRecues}</span>
                                    <span class="text-gray-500 text-sm">poche(s)</span>
                                </div>
                            </td>

                            <!-- État -->
                            <td class="px-6 py-4">
                                <c:choose>
                                    <c:when test="${r.etat == 'SATISFAIT'}">
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                                            <i class="fas fa-check-circle mr-1"></i>Satisfait
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-yellow-100 text-yellow-800">
                                            <i class="fas fa-clock mr-1"></i>En attente
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <!-- Actions -->
                            <td class="px-6 py-4">
                                <div class="flex space-x-2">
                                    <a href="receveur?action=edit&id=${r.id}"
                                       class="w-8 h-8 bg-blue-100 text-blue-600 rounded flex items-center justify-center hover:bg-blue-200 transition"
                                       title="Modifier">
                                        <i class="fas fa-edit text-sm"></i>
                                    </a>
                                    <a href="receveur?action=delete&id=${r.id}"
                                       class="w-8 h-8 bg-red-100 text-red-600 rounded flex items-center justify-center hover:bg-red-200 transition"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce receveur ?')"
                                       title="Supprimer">
                                        <i class="fas fa-trash text-sm"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty receveurs}">
                        <tr>
                            <td colspan="8" class="px-6 py-12 text-center">
                                <div class="flex flex-col items-center justify-center text-gray-500">
                                    <i class="fas fa-user-injured text-4xl mb-4 text-gray-300"></i>
                                    <p class="text-lg font-semibold">Aucun receveur enregistré</p>
                                    <p class="text-sm mt-2">Commencez par ajouter un nouveau receveur</p>
                                    <a href="receveur?action=form" class="mt-4 bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition">
                                        <i class="fas fa-user-plus mr-2"></i>Ajouter le premier receveur
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>

        <!-- Pagination et informations -->
        <div class="px-6 py-4 border-t border-gray-200 bg-gray-50">
            <div class="flex flex-col sm:flex-row justify-between items-center gap-4">
                <p class="text-sm text-gray-700">
                    Total: <span class="font-semibold">${receveurs.size()}</span> receveur(s)
                </p>

                <!-- Pagination simple -->
                <div class="flex items-center space-x-2">
                    <button class="px-3 py-1 border border-gray-300 rounded text-sm hover:bg-gray-50 disabled:opacity-50" disabled>
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <span class="px-3 py-1 bg-red-600 text-white rounded text-sm">1</span>
                    <button class="px-3 py-1 border border-gray-300 rounded text-sm hover:bg-gray-50 disabled:opacity-50" disabled>
                        <i class="fas fa-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Légende des statuts -->
    <div class="mt-6 bg-white rounded-lg p-4 shadow-sm">
        <h3 class="font-semibold text-gray-900 mb-3 flex items-center">
            <i class="fas fa-info-circle text-red-600 mr-2"></i>Légende des statuts
        </h3>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4 text-sm">
            <div class="flex items-center space-x-2">
                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                    CRITIQUE
                </span>
                <span class="text-gray-600">4 poches nécessaires</span>
            </div>
            <div class="flex items-center space-x-2">
                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-orange-100 text-orange-800">
                    URGENT
                </span>
                <span class="text-gray-600">3 poches nécessaires</span>
            </div>
            <div class="flex items-center space-x-2">
                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                    NORMAL
                </span>
                <span class="text-gray-600">1 poche nécessaire</span>
            </div>
            <div class="flex items-center space-x-2">
                <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                    Satisfait
                </span>
                <span class="text-gray-600">Besoins comblés</span>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="bg-red-600 text-white py-6 mt-12">
    <div class="container mx-auto text-center">
        <p class="text-sm">© 2025 Banque de Sang Maroc - Système de Gestion JEE</p>
        <p class="text-red-100 text-xs mt-1">Architecture MVC - Couche Présentation</p>
    </div>
</footer>

</body>

