<%@ page isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><tiles:getAsString name="title" /></title>
<%-- <link href="<c:url value='/static/css/bootstrap.css' />"
	rel="stylesheet"></link> --%>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
	<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
	
<script   src="https://code.jquery.com/jquery-3.1.1.min.js"   
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="   
	crossorigin="anonymous"></script>
<script   src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<script   src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js" crossorigin="anonymous"></script>

<script type="text/javascript" src="/static/js/app.js"></script>

</head>

<body>

	<!-- <div class="container"> -->
	<div class="panel panel-default " style="margin: 0%;">
		<div class="panel-heading title-header" >
			<tiles:insertAttribute name="header" />
		</div>
		<div class="panel-body">
			<!--Row with two columns divided in 1:3 ratio-->
			<div class="row">
				<div class="col-xs-3 pane-content">
					<!-- <div class="pane-content"> -->
						<tiles:insertAttribute name="menu" />
					<!-- </div> -->

				</div>
				<div class="col-xs-9 pane-content bg-alt">
					<!-- <div class="pane-content bg-alt"> -->
						<!-- <div class="bs-example"> -->
							<tiles:insertAttribute name="body" />
						<!-- </div>
					</div> -->
				</div>
			</div>
		</div>
		<div class="panel-footer" style="background-color: #343434; color: white;">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>