<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>TWIC</title>
</head>
<body>
<div class="jumbotron text-center">
  <h1>Projet TWIC</h1>
  <p>Samuel Bertin</p>
</div>

<div class="container">
  <div class="row">
    <div class="form-group col-md-6">
      <a href="<c:url value="/listeVille"/>"><button type="submit" class="btn btn-primary btn-block"><h3>Liste des Villes</h3></button></a>
    </div>
    <div class="form-group col-md-6">
      <a href="<c:url value="/distanceVille"/>"><button type="submit" class="btn btn-primary btn-block"><h3>Distance Ville</h3></button></a>
    </div>
  </div>
</div>

	
	
</body>
</html>