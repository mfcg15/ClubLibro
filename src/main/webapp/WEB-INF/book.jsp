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
	<title>Book Share</title>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center tituloBook">
			<h1>Add a Book to Your Shelf!</h1>
			<a href="/books">back to the shelves</a>
		</div>
		<div class="row">
			<div class="col-10">
				<form:form action="/books/create" method="post" modelAttribute="libro">
					<div class="mb-3 row">
    					<form:label path="title" cssClass="col-sm-2 col-form-label">Title</form:label>
						<div class="col-sm-10">
							<form:input path="title" cssClass="form-control"/>
						</div>
						<form:errors path="title" cssClass="text-danger"/>
  					</div>
  					<div class="mb-3 row">
	    				<form:label path="author" cssClass="col-sm-2 col-form-label">Author</form:label>
							<div class="col-sm-10">
								<form:input path="author" cssClass="form-control"/>
							</div>
						<form:errors path="author" cssClass="text-danger"/>
  					</div>
	  				<div class="mb-3 row">
	    				<form:label path="thoughts" cssClass="col-sm-2 col-form-label">My thoughts</form:label>
						<div class="col-sm-10">
							<form:textarea path="thoughts" cssClass="form-control" rows="4"/>
						</div>
						<form:errors path="thoughts" cssClass="text-danger"/>
	  				</div>
	  				<input name="idusuario" type="hidden" value="${idusuario}"/>
	  				<div class="mb-3 d-flex justify-content-end">
	  					<button type="submit">Submit</button>
	  				</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>