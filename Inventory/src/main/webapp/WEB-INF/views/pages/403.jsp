<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/app.css"rel="stylesheet"
	type="text/css"></link>
<title>Access Denied</title>
</head>
<body class="security-app">
	<h2>Authentication Failed</h2>
	<div class="lc-block">		
		<div class="alert-danger">
			<h3>You do not have permission to access this page!</h3>	
		</div>
		<form action="/logout" method="post">
			<input type="submit" class="btn btn-primary" value="Logout" /> <input
				type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>		
	</div>	
</body>
</html>