<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Donneurs - Banque de Sang Maroc</title>
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
            <a href="donneur?action=list" class="text-white border-b-2 border-white">Donneurs</a>
            <a href="receveur?action=list" class="text-red-100 hover:text-white transition">Receveurs</a>
            <a href="matching" class="text-red-100 hover:text-white transition">Matching</a>
        </nav>
    </div>
</header>

<!-- Main Content -->
<div class="container mx-auto px-4 py-8">
    <!-- En-tête de page -->
    <div class="flex flex-col lg:flex-row justify-between items-start lg:items-center mb-8 gap-4">
        <div>
            <h1 class="text-3xl font-bold text-gray-900 mb-2">Liste des Donneurs</h1>
            <p class="text-gray-600">Gestion des donneurs de sang enregistrés</p>
        </div>

        <a href="donneur?action=form"
           class="bg-red-600 text-white px-6 py-3 rounded-lg hover:bg-red-700 transition font-semibold shadow-lg">
            <i class="fas fa-user-plus mr-2"></i>Nouveau Donneur
        </a>
    </div>

    <!-- Tableau des donneurs -->
    <div class="bg-white rounded-xl shadow-lg overflow-hidden">
        <div class="overflow-x-auto">
            <table class="w-full">
                <thead class="bg-red-600 text-white">
                    <tr>
                        <th class="px-6 py-4 text-left font-semibold">ID</th>
                        <th class="px-6 py-4 text-left font-semibold">Nom</th>
                        <th class="px-6 py-4 text-left font-semibold">Prénom</th>
                        <th class="px-6 py-4 text-left font-semibold">CIN</th>
                        <th class="px-6 py-4 text-left font-semibold">Téléphone</th>
                        <th class="px-6 py-4 text-left font-semibold">Sexe</th>
                        <th class="px-6 py-4 text-left font-semibold">Poids</th>
                        <th class="px-6 py-4 text-left font-semibold">Actions</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <c:forEach var="d" items="${donneurs}">
                        <tr class="hover:bg-gray-50 transition">
                            <td class="px-6 py-4">
                                <span class="font-mono text-sm text-gray-600">${d.id}</span>
                            </td>

                            <td class="px-6 py-4">
                                <p class="font-semibold text-gray-900">${d.nom}</p>
                            </td>

                            <td class="px-6 py-4">
                                <p class="text-gray-900">${d.prenom}</p>
                            </td>

                            <td class="px-6 py-4">
                                <code class="text-sm bg-gray-100 px-2 py-1 rounded">${d.cin}</code>
                            </td>

                            <td class="px-6 py-4">
                                <p class="text-gray-900">${d.telephone}</p>
                            </td>

                            <td class="px-6 py-4">
                                <c:choose>
                                    <c:when test="${d.sexe == 'H'}">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                            <i class="fas fa-mars mr-1"></i>Homme
                                        </span>
                                    </c:when>
                                    <c:when test="${d.sexe == 'F'}">
                                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-pink-100 text-pink-800">
                                            <i class="fas fa-venus mr-1"></i>Femme
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-500">-</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td class="px-6 py-4">
                                <div class="flex items-center space-x-2">
                                    <span class="text-gray-900">${d.poids}</span>
                                    <span class="text-gray-500 text-sm">kg</span>
                                </div>
                            </td>

                            <td class="px-6 py-4">
                                <div class="flex space-x-2">
                                    <a href="donneur?action=edit&id=${d.id}"
                                       class="w-8 h-8 bg-blue-100 text-blue-600 rounded flex items-center justify-center hover:bg-blue-200 transition"
                                       title="Modifier">
                                        <i class="fas fa-edit text-sm"></i>
                                    </a>
                                    <a href="donneur?action=delete&id=${d.id}"
                                       class="w-8 h-8 bg-red-100 text-red-600 rounded flex items-center justify-center hover:bg-red-200 transition"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce donneur ?')"
                                       title="Supprimer">
                                        <i class="fas fa-trash text-sm"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>

                    <c:if test="${empty donneurs}">
                        <tr>
                            <td colspan="8" class="px-6 py-12 text-center">
                                <div class="flex flex-col items-center justify-center text-gray-500">
                                    <i class="fas fa-users text-4xl mb-4 text-gray-300"></i>
                                    <p class="text-lg font-semibold">Aucun donneur enregistré</p>
                                    <p class="text-sm mt-2">Commencez par ajouter un nouveau donneur</p>
                                    <a href="donneur?action=form" class="mt-4 bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition">
                                        <i class="fas fa-user-plus mr-2"></i>Ajouter le premier donneur
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
                    Total: <span class="font-semibold">${donneurs.size()}</span> donneur(s)
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

    <!-- Informations supplémentaires -->
    <div class="mt-6 grid grid-cols-1 md:grid-cols-3 gap-4 text-sm text-gray-600">
        <div class="text-center">
            <i class="fas fa-info-circle text-red-600 mr-2"></i>
            <span>Cliquez sur les icônes pour modifier ou supprimer</span>
        </div>
        <div class="text-center">
            <i class="fas fa-database text-red-600 mr-2"></i>
            <span>Données actualisées en temps réel</span>
        </div>
        <div class="text-center">
            <i class="fas fa-shield-alt text-red-600 mr-2"></i>
            <span>Système sécurisé MVC</span>
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
</html>