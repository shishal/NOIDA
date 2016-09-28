<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<nav class="navbar navbar-inverse sidebar" role="navigation" style="width:100%">
    <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- <a class="navbar-brand" href="#">Home</a> -->
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<sec:authorize access="hasRole('USER')">
				<li class="active"><a href="${pageContext.request.contextPath}/user/home">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('APPROVER','ADMIN')">
				<li class="active"><a href="${pageContext.request.contextPath}/approver/home">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ISSUER')">
				<li class="active"><a href="${pageContext.request.contextPath}/issuer/home">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('APPROVER','ADMIN','USER','ISSUER')">
				<li ><a href="${pageContext.request.contextPath}/user/raiseRequest">Raise Request<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('APPROVER','ADMIN','USER','ISSUER')">
				<li ><a href="${pageContext.request.contextPath}/user/myAsset">My Assets<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				</sec:authorize>
				
				<sec:authorize access="hasAnyRole('APPROVER','ADMIN')">
				<li ><a href="${pageContext.request.contextPath}/approver/requests">Requests<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-envelope"></span></a></li>
				</sec:authorize>
			 	<sec:authorize access="hasRole('ADMIN')">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-cog"></span></a>
					<ul class="dropdown-menu forAnimate" role="menu">
						<li><a href="${pageContext.request.contextPath}/admin/po">Purchase Order</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/amc">AMC</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/asset">Asset</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/assetType">Asset Type</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/user">User</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/department">Department</a></li>
						<!-- <li class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li class="divider"></li>
						<li><a href="#">One more separated link</a></li> -->
					</ul>
				</li>
				</sec:authorize> 
			</ul>
		</div>
	</div>
</nav>


<%-- <nav>
    <ul id="menu">
    <sec:authorize access="hasRole('USER')">
       <li><a href="${pageContext.request.contextPath}/user/home">Home</a></li>
       <li><a href="${pageContext.request.contextPath}/user/myRequest">My Request</a></li>
    </sec:authorize>
    <sec:authorize access="hasRole('APPROVER')">
       <li><a href="${pageContext.request.contextPath}/approver/home">Home</a></li>
       <li><a href="${pageContext.request.contextPath}/approver/pendingRequest">Pending Request</a></li>
       </sec:authorize>
        <sec:authorize access="hasRole('ISSUER')">
       <li><a href="${pageContext.request.contextPath}/issuer/home">Home</a></li>
       <li><a href="${pageContext.request.contextPath}/issuer/approvedRequest">Approved Request</a></li>
      </sec:authorize>
       <sec:authorize access="hasRole('ADMIN')">
       <li><a href="${pageContext.request.contextPath}/admin/home">Home</a></li>
       <li><a href="${pageContext.request.contextPath}/admin/setUp">Setup</a></li>
       </sec:authorize>
    </ul>
</nav> --%>