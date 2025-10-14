<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Liste des Donneurs</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="p-4">

<h2>Liste des Donneurs</h2>

<a href="donneur?action=form" class="btn btn-primary mb-3">+ Ajouter un Donneur</a>

<table class="table table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>CIN</th>
            <th>Téléphone</th>
            <th>Sexe</th>
            <th>Poids</th>

            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="d" items="${donneurs}">
            <tr>
                <td>${d.id}</td>
                <td>${d.nom}</td>
                <td>${d.prenom}</td>
                <td>${d.cin}</td>
                <td>${d.telephone}</td>
                <td>${d.sexe}</td>
                <td>${d.poids}</td>

                <td>
                    <a href="donneur?action=delete&id=${d.id}" class="btn btn-danger btn-sm">Supprimer</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
