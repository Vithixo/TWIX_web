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
		<h1 class="h3 text-gray-800">Distance entre deux Villes</h1>
		La distance entre : 
		<select id="ville1" name="ville1" required>
			<c:forEach var="ville" items="${listeVille}" varStatus="loop1">
				<option value="${loop1.index}"> <c:out value="${ville}"/> </option>
			</c:forEach>
		</select>
		 et 
		<select id="ville2" name="ville2" required>
			<c:forEach var="ville" items="${listeVille}" varStatus="loop2">
				<option value="${loop2.index}"> <c:out value="${ville}"/> </option>
			</c:forEach>
		</select>
		 = <input type="text" readonly name="distance" id="distance" value="">
		<br>
		
		<c:forEach var="latitude" items="${listeLatitude}" varStatus="loop3">
			<input type="text" name="latitude${loop3.index}" id="latitude${loop3.index}" value="${latitude}" hidden>
		</c:forEach>
		<c:forEach var="longitude" items="${listeLongitude}" varStatus="loop3">
			<input type="text" name="longitude${loop3.index}" id="longitude${loop3.index}" value="${longitude}" hidden>
		</c:forEach>
			
			
	
		
		<button onclick=calculer() class = btn>Calculer</button>
	
		<br>
		<br>
		
		<a href="<c:url value="/listeVille"/>"><button type="submit" class="btn btn-primary" >Liste des Villes</button></a>
	</div>

	<script>
	
		function calculer(){
			var $ville1 = document.getElementById("ville1").value
			var $ville2 = document.getElementById("ville2").value
			var $latitude1 = Number(document.getElementById("latitude"+$ville1).value);
			var $latitude2 = Number(document.getElementById("latitude"+$ville2).value);
			var $longitude1 = Number(document.getElementById("longitude"+$ville1).value);
			var $longitude2 = Number(document.getElementById("longitude"+$ville2).value);
			var $x = Number(($longitude1 - $longitude2)*Math.cos(($latitude1 + $latitude2)/2));
			var $y = Number($latitude1 - $latitude2);
			var $distance = Math.sqrt($y*$y+$x*$x)*1.852*60;
			$distance= Number.parseInt($distance);
			document.getElementById("distance").value=$distance + " km";
		}
		
	</script>
	
	
</body>
</html>