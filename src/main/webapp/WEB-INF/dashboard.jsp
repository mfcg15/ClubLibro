<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
		<div class="d-flex justify-content-between align-items-center tituloDash">
			<h1>Welcome, <c:out value="${user_session.getName()}"/></h1>
			<a href="/logout">logout</a>
		</div>
		<div class="d-flex justify-content-between align-items-center textoDash">
			<p>Books from everyone's shelves:</p>
			<a href="/books/new">+ Add a to my shelf!</a>
		</div>
		<table class="table table-striped table-bordered">
			<thead class="table-secondary">
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Author Name</th>
					<th>Posted By</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="libro" items="${libros}">
					<tr>
						<td><c:out value="${libro.getId()}"/></td>
						<td><a href="/books/${libro.getId()}"><c:out value="${libro.getTitle()}"/></a></td>
						<td><c:out value="${libro.getAuthor()}"/></td>
						<td><c:out value="${libro.usuario.getName()}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>