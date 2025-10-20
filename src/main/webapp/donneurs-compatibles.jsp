<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Donneurs Compatibles</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
<div class="container mx-auto py-8">
    <h1 class="text-2xl font-bold text-center text-red-600 mb-6">
        Donneurs compatibles avec ${receveur.nom} ${receveur.prenom} (${receveur.groupe})
    </h1>

    <c:if test="${empty donneursCompatibles}">
        <div class="text-center text-gray-600">Aucun donneur compatible trouvé </div>
    </c:if>

    <c:forEach var="d" items="${donneursCompatibles}">
        <div class="bg-white p-4 rounded-lg shadow mb-4 flex justify-between items-center">
            <div>
                <p class="font-semibold text-gray-800">${d.nom} ${d.prenom}</p>
                <p class="text-sm text-gray-500">Groupe : ${d.groupe} | Poids : ${d.poids} kg</p>
            </div>
            <a href="association?action=create&donneurId=${d.id}&receveurId=${receveur.id}"
               class="bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 transition">
               Associer
            </a>
        </div>
    </c:forEach>
</div>
</body>
</html>
