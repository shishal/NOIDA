<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>IT Inventory Management System</title>
</head>
<body>

	<div class="pane-content bg-alt">

		<!--  <div class="bs-example" > -->
		<form action="/login" method="post"
			style="font-size: 20px; width: 40%; padding-left: 15%; padding-top: 10%">
			<div class="form-group">
				<label for="inputUsername">UserName</label> <input type="text"
					class="form-control" id="inputUsername" name="username"
					placeholder="UserName">
			</div>
			<div class="form-group">
				<label for="inputPassword">Password</label> <input type="password"
					class="form-control" id="inputPassword" name="password"
					placeholder="Password">
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
			<c:if test="${param.error ne null}">
				<div class="alert-danger">Invalid username and password.</div>
			</c:if>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>

</body>
</html>
