<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri= "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="/css/styles.css">
	<title>Read Share</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center tituloShow">
			<h1 class="tituloCursiva"><c:out value="${libro.getTitle()}"/></h1>
			<a href="/books">back to the shelves</a>
		</div>
		<div>
			<c:choose>
				<c:when test="${libro.usuario.getId() == idusuario}">
					<h5>You read <span class="letraMorada"><c:out value="${libro.getTitle()}"/></span> by <span class="letraVerde">
					<c:out value="${libro.getAuthor()}"/></span></h5>
				</c:when>
				<c:otherwise>
					<h5><span class="letraRoja"><c:out value="${libro.usuario.getName()}"/></span> read <span class="letraMorada">
					<c:out value="${libro.getTitle()}"/></span> by <span class="letraVerde"><c:out value="${libro.getAuthor()}"/></span></h5>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${libro.usuario.getId() == idusuario}">
					<p>Here are your thoughts:</p>
				</c:when>
				<c:otherwise>
					<p>Here are <c:out value="${libro.usuario.getName()}"/>'s thoughts:</p>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="row">
			<div class="col-10 contenedorShow">
				<div class="contThoughts">
					<p class="text-break"><c:out value="${libro.getThoughts()}"/></p>
				</div>
				<div class="d-flex justify-content-end">
					<c:if test="${libro.usuario.getId() == idusuario}">
						<a href="/books/${libro.getId()}/edit" class="btn boton">edit</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>