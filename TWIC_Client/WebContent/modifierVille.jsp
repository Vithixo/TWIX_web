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

	<div class="container-fluid">
		
		<h1 class="h3 text-gray-800">Modifier une ville</h1>
		
		<c:if test="${not empty success}">
			<div class="alert alert-success text-center" role="alert">
				<c:forEach var="success" items="${success}">
					<c:out value="${success}"/>
				</c:forEach>
			</div>
		</c:if>
		
		<form role="form" method="post" action="<c:url value="/ModifierVille"/>">
			<c:forEach var="ville" items="${listeVille}" varStatus="loop">
				<input type="hidden" name="code" class="form-control" id="code"  value="<c:out value="${ville.code}"/>"  required />
				<div class="form-group">
					<label for="titre" class="required">Nom</label>
					<input type="text" name="nom" class="form-control" id="nom"  value="<c:out value="${ville.nom}"/>"  required />
				</div>
				<div class="form-group">
					<label for="titre" class="required">CodePostal</label>
					<input type="text" name="codePostal" class="form-control" id="codePostal"  value="<c:out value="${ville.codePostale}"/>"  required />
				</div>
				<div class="form-group">
					<label for="titre" class="required">Libelle</label>
					<input type="text" name="libelle" class="form-control" id="libelle"  value="<c:out value="${ville.libelle}"/>"  required />
				</div>
				<div class="form-group">
					<label for="titre" class="required">Ligne5</label>
					<input type="text" name="ligne5" class="form-control" id="ligne5"  value="<c:out value="${ville.ligne5}"/>" />
				</div>
					<div class="form-group">
						<div class="form-group col-md-6">
							<label for="titre" class="required">Latitude</label>
							<input type="text" name="latitude" class="form-control" id="latitude"  value="<c:out value="${ville.latitude}"/>" required />
						</div>
						<div class="form-group col-md-6">
							<label for="titre" class="required">Longitude</label>
							<input type="text" name="longitude" class="form-control" id="longitude"  value="<c:out value="${ville.longitude}"/>"  required />
						</div>
					</div>
			</c:forEach>
			
			<div class="btn-group btn-group-justified">
				<div class="btn-group">
			      <button type="submit" onclick="modifier()" class="btn btn-primary" >Modifier</button>
				</div>
				<div class="btn-group">
			      <a href="<c:url value="/listeVille"/>"><button type="button" class="btn btn-info">Liste des Villes</button></a>
				</div>
			</div>
		</form>
		
	</div>
	
	


	

	
	
</body>
</html>