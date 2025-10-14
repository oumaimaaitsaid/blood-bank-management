<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Liste des Receveurs</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4 text-center">Liste des Receveurs</h2>

    <a href="receveur" class="btn btn-primary mb-3">+ Nouveau Receveur</a>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Groupe</th>
            <th>Besoin</th>
            <th>Poches Requises</th>
            <th>Poches Reçues</th>
            <th>État</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="r" items="${receveurs}">
            <tr>
                <td>${r.nom}</td>
                <td>${r.prenom}</td>
                <td>${r.groupe}</td>
                <td>${r.besoin}</td>
                <td>${r.pochesRequises}</td>
                <td>${r.pochesRecues}</td>
                <td>
                    <c:choose>
                        <c:when test="${r.etat == 'SATISFAIT'}">
                            <span class="badge bg-success">Satisfait</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-warning text-dark">En attente</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="receveur?action=delete&id=${r.id}" class="btn btn-danger btn-sm">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
