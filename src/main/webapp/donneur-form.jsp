<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ajouter un Donneur</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4 text-center">Nouveau Donneur</h2>
    <form action="donneur" method="post" class="card p-4 shadow">

        <div class="row mb-3">
            <div class="col">
                <label>Nom</label>
                <input type="text" name="nom" class="form-control" required>
            </div>
            <div class="col">
                <label>Prénom</label>
                <input type="text" name="prenom" class="form-control" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col">
                <label>CIN</label>
                <input type="text" name="cin" class="form-control" required>
            </div>
            <div class="col">
                <label>Téléphone</label>
                <input type="text" name="telephone" class="form-control" required>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col">
                <label>Date de naissance</label>
                <input type="date" name="dateNaissance" class="form-control" required>
            </div>
            <div class="col">
                <label>Sexe</label>
                <select name="sexe" class="form-select">
                    <option value="H">Homme</option>
                    <option value="F">Femme</option>
                </select>
            </div>
        </div>

        <div class="row mb-3">
            <div class="col">
                <label>Poids (kg)</label>
                <input type="number" name="poids" class="form-control" required>
            </div>
            <div class="col">
                <label>Groupe sanguin</label>
                <select name="groupeSanguin" class="form-select">
                    <c:forEach var="g" items="${groupes}">
                        <option value="${g}">${g}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="mb-3">
            <label>Conditions médicales :</label><br>
            <c:forEach var="c" items="${conditions}">
                <div class="form-check form-check-inline">
                    <input type="checkbox" name="conditions" value="${c.id}" class="form-check-input">
                    <label class="form-check-label">${c.name}</label>
                </div>
            </c:forEach>
        </div>

        <button type="submit" class="btn btn-danger w-100">Enregistrer</button>
    </form>
</div>
</body>
</html>
