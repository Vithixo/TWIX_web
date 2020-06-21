<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>TWIC</title>
<style>
table,th,td {
  border: 1px solid black;
}
</style>
</head>
<body>
	<div class="container">
  		<div class="row">
			<table class="table table-bordered" >
				<thead>
					<tr>
						<th>Code</th>
						<th>Nom</th>
						<th>Code Postal</th>
						<th>Libelle</th>
						<th>Ligne5</th>
						<th>Longitude</th>
						<th>Latitude</th>
						<th>Modifier</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ville" items="${listeVille}" varStatus="loop">
						<c:if test="${loop.index lt 50 }">
							<tr name="ville" id="${loop.index}" >
								<th><c:out value="${ville.code}"/></th>
								<th><c:out value="${ville.nom}"/></th>
								<th><c:out value="${ville.codePostale}"/></th>
								<th><c:out value="${ville.libelle}"/></th>
								<th><c:out value="${ville.ligne5}"/></th>
								<th><c:out value="${ville.longitude}"/></th>
								<th><c:out value="${ville.latitude}"/></th>
								<th>
									<form role="form" method="get" action="<c:url value="/ModifierVille"/>">
										<input type="text" hidden="hide" id="code" name="code" value="${ville.code}"> 
										<button type="submit" class="btn btn-primary" >Modifier</button>
									</form>
								</th>
							</tr>
						</c:if>
						<c:if test="${loop.index gt 49 }">
							<tr name="ville" id="${loop.index}" hidden="hide" >
								<th><c:out value="${ville.code}"/></th>
								<th><c:out value="${ville.nom}"/></th>
								<th><c:out value="${ville.codePostale}"/></th>
								<th><c:out value="${ville.libelle}"/></th>
								<th><c:out value="${ville.ligne5}"/></th>
								<th><c:out value="${ville.longitude}"/></th>
								<th><c:out value="${ville.latitude}"/></th>
								<th>
									<form role="form" method="get" action="<c:url value="/ModifierVille"/>">
										<input type="text" hidden="hide" id="code" name="code" value="${ville.code}"> 
										<button type="submit" class="btn btn-primary" >Modifier</button>
									</form>
								</th>
							</tr>
						</c:if>
						<div class="modal fade" id="#modal-ville-${loop.index}" role="dialog">
							<div class="modal-dialog modal-xl">
								<div class="modal-content">
									<div class="modal-content">
								        <div class="modal-header">
								        	<button type="button" class="close" data-dismiss="modal">&times;</button>
								          	<h4 class="modal-title">Modal Header</h4>
								        </div>
								        <div class="modal-body">
								        	<p>Some text in the modal.</p>
								        </div>
								        <div class="modal-footer">
								        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								        </div>
							        </div>
								</div>
							</div>
						</div>
					</c:forEach>
				</tbody>
			</table>
			<div class="btn-group btn-group-justified">
				<button type="button" onclick="selectPage(1)" id="precedent" disabled="disabled">Précedent</button>
				<c:forEach var="ville" items="${listeVille}" varStatus="loop2">
					<c:if test="${(loop2.index mod 50) eq 0 }">	
							<c:if test="${loop2.index lt 150 }">		
								<button type="button" onclick="selectPage(${(loop2.index div 50)+1})" id="button-${(loop2.index div 50)+1}"><fmt:formatNumber value = "${(loop2.index div 50)+1}" type = "number"/></button>
							</c:if>
							<c:if test="${loop2.index gt 149 }">
								<button type="button" onclick="selectPage(${(loop2.index div 50)+1})" id="button-${(loop2.index div 50)+1}" hidden="hidden"><fmt:formatNumber value = "${(loop2.index div 50)+1}" type = "number"/></button>	
							</c:if>
						
					</c:if>
				</c:forEach>
				<button type="button" onclick="selectPage(2)" id="suivant">Suivant</button>
			<div class="btn-group">
	 	</div>
	 	</br>
	 	</br>
	 	
	</div>
	<div class="btn-group btn-group-justified">
		<div class="btn-group">
	      <a href="<c:url value="/distanceVille"/>"><button type="submit" class="btn btn-primary">Distance Ville</button></a>
		</div>
	</div>
	

	<script language="javascript">
	
	function selectPage(index) {
		var $indexVille = (index-1)*50;
		for(var i=1;i<(index-2);i++){
			document.getElementById("button-"+i+".0").setAttribute("hidden", "hide");
		}
		for(var i=(index+3);i<=(index+5);i++){
			document.getElementById("button-"+i+".0").setAttribute("hidden", "hide");
			
		}
		for(var i=(index-2);i<(index+3);i++){
			if(i>0){
				document.getElementById("button-"+i+".0").removeAttribute("hidden");
				document.getElementById("button-"+i+".0").removeAttribute("disabled");
			}
		}
		for(var i=0;i<$indexVille;i++){
			document.getElementById(i).setAttribute("hidden", "hide");
		}
		for(var i=($indexVille+50);i<($indexVille+200);i++){
			document.getElementById(i).setAttribute("hidden", "hide");
		}
		for(var i=$indexVille;i<($indexVille+50);i++){
			document.getElementById(i).removeAttribute("hidden");
		}
		if(index==1){
			document.getElementById("precedent").setAttribute("disabled","disabled");
		}else{
			document.getElementById("precedent").removeAttribute("disabled");
		}
		
		document.getElementById("button-"+index+".0").setAttribute("disabled","disabled");
		document.getElementById("precedent").setAttribute("onclick","selectPage("+(index-1)+")");
		document.getElementById("suivant").setAttribute("onclick","selectPage("+(index+1)+")");
	}
	
	
	</script>
	

</body>
</html>