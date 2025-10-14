<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Banque de Sang - Accueil</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="text-center mb-4">
        <h1 class="text-danger fw-bold">🩸 Système de Gestion de Banque de Sang</h1>
        <p class="text-muted">Bienvenue dans l’application de gestion des donneurs et receveurs</p>
    </div>

    <div class="card shadow p-4 mx-auto" style="max-width: 600px;">
        <h4 class="mb-3 text-center text-primary">Navigation</h4>
        <div class="d-grid gap-3">
            <a href="donneur" class="btn btn-outline-danger btn-lg">👤 Liste des Donneurs</a>
            <a href="receveur" class="btn btn-outline-primary btn-lg">🧍 Liste des Receveurs</a>
            <a href="donneur-form.jsp" class="btn btn-success btn-lg">➕ Ajouter un Donneur</a>
            <a href="receveur-form.jsp" class="btn btn-success btn-lg">➕ Ajouter un Receveur</a>
        </div>
    </div>
</div>

</body>
</html>
