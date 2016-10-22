<%@ page isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><tiles:getAsString name="title" /></title>

<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<link href="<c:url value='/static/css/font-awesome.min.css' />" rel="stylesheet">
<link href="<c:url value='/static/css/bootstrap-datepicker.css' />" rel="stylesheet">
<link href="<c:url value='/static/css/bootstrap.min.css' />" rel="stylesheet">
<link href="<c:url value='/static/css/bootstrap-theme.min.css' />" rel="stylesheet">
<link href="<c:url value='/static/css/jquery.dataTables.min.css' />" rel="stylesheet" >
<link href="<c:url value='/static/css/buttons.dataTables.min.css' />" rel="stylesheet">
	
<script   src="/static/js/jquery-3.1.1.min.js"></script>
<script   src="/static/js/jquery.dataTables.min.js"></script>
<script   src="/static/js/dataTables.buttons.min.js"></script>
<script   src="/static/js/buttons.print.min.js"></script>
<script   src="/static/js/buttons.html5.min.js"></script> 	
<script   src="/static/js/buttons.flash.min.js"></script> 	
<script   src="/static/js/jszip.min.js"></script> 	
<script   src="/static/js/bootstrap.min.js"></script>
<script   src="/static/js//bootstrap-datepicker.js"></script>

<script type="text/javascript" src="/static/js/app.js"></script>
<script type="text/javascript" src="/static/js/JsBarcode.all.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.blockUI/2.70/jquery.blockUI.js"></script>
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
