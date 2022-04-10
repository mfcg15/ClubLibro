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
		<div class="row">
			<h1 class="tituloIndex">Book Club</h1>
			<p>A place for friends to share thoughts on books.</p>
			<div class="col-6">
				<h2 class="subtituloIndex">Register</h2>
				<form:form method="post" action="/register" modelAttribute="nuevoUsuario">
					<div class="mb-4 row">
	    				<form:label path="name" cssClass="col-sm-3 col-form-label">Name:</form:label>
							<div class="col-sm-9">
								<form:input path="name" cssClass="form-control"/>
							</div>
						<form:errors path="name" cssClass="text-danger"/>
  					</div>
  					<div class="mb-4 row">
	    				<form:label path="email" cssClass="col-sm-3 col-form-label">Email:</form:label>
							<div class="col-sm-9">
								<form:input type="email" path="email" cssClass="form-control"/>
							</div>
						<form:errors path="email" cssClass="text-danger"/>
  					</div>
  					<div class="mb-4 row">
	    				<form:label path="password" cssClass="col-sm-3 col-form-label">Password:</form:label>
							<div class="col-sm-9">
								<form:password path="password" cssClass="form-control"/>
							</div>
						<form:errors path="password" cssClass="text-danger"/>
  					</div>
  					<div class="mb-4 row">
	    				<form:label path="confirmacion" cssClass="col-sm-3 col-form-label">Confirm PW:</form:label>
							<div class="col-sm-9">
								<form:password path="confirmacion" cssClass="form-control"/>
							</div>
						<form:errors path="confirmacion" cssClass="text-danger"/>
  					</div>
  					<div class="mb-4 d-flex justify-content-end">
  						<button type="submit">Submit</button>
  					</div>
				</form:form>
			</div>
			<div class="col-6">
				<h2 class="subtituloIndex">Log in</h2>
				<form:form method="post" action="/login" modelAttribute="nuevoLogin">
					<div class="mb-4 row">
	    				<form:label path="email" cssClass="col-sm-3 col-form-label">Email:</form:label>
							<div class="col-sm-9">
								<form:input type="email" path="email" cssClass="form-control"/>
							</div>
						<form:errors path="email" cssClass="text-danger"/>
  					</div>
  					<div class="mb-4 row">
	    				<form:label path="password" cssClass="col-sm-3 col-form-label">Password:</form:label>
							<div class="col-sm-9">
								<form:password path="password" cssClass="form-control"/>
							</div>
						<form:errors path="password" cssClass="text-danger"/>
  					</div>
					<div class="mb-4 d-flex justify-content-end">
  						<button type="submit">Submit</button>
  					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>