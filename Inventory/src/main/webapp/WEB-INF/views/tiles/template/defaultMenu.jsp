<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<nav class="navbar navbar-inverse sidebar" role="navigation"
	style="width: 100%">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<sec:authorize access="hasRole('USER')">
					<li class="active">
						<a href="${pageContext.request.contextPath}/user/home">Home<span style="font-size: 20px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('APPROVER','ADMIN')">
					<li class="active">
					<a id="pendingRequestMenuLink" href="${pageContext.request.contextPath}/approver/home">Home<span style="font-size: 20px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasRole('ISSUER')">
					<li class="active">
						<a id="approvedRequestMenuLink" href="${pageContext.request.contextPath}/issuer/home">Home<span style="font-size: 20px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('APPROVER','ADMIN','USER','ISSUER')">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Raise Request <span class="caret"></span><span style="font-size: 20px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
							<li>
								<a href="${pageContext.request.contextPath}/user/raiseRequest">New Request<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span> </a>
							</li>
							<li>
								<a href="#">Repair Request<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-edit"></span> </a>
							</li>
						</ul>
					</li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('APPROVER','ADMIN','ISSUER')">
					<li>
						<a href="${pageContext.request.contextPath}/user/myRequest">My Requests<span style="font-size: 20px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-inbox"></span> </a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('APPROVER','ADMIN','USER','ISSUER')">
					<li>
						<a href="${pageContext.request.contextPath}/user/myAsset">My Assets<span style="font-size: 20px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-hdd"></span> </a>
					</li>
				</sec:authorize>

				<sec:authorize access="hasAnyRole('APPROVER','ADMIN')">
					<li>
						<a id="requestMenuLink" href="${pageContext.request.contextPath}/approver/requests">Requests<span style="font-size: 20px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasRole('ADMIN')">
					<li class="dropdown"> 
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Admin <span class="caret"></span><span style="font-size: 20px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-cog"></span></a>
						<ul class="dropdown-menu forAnimate" role="menu">
							<li>
								<a id="poMenuLink" href="${pageContext.request.contextPath}/admin/po">Purchase Order<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-file"></span> </a>
							</li>
							<li>
								<a id="amcMenuLink" href="${pageContext.request.contextPath}/admin/amc">AMC<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-file"></span></a>
							</li>
							<li>
								<a id="assetMenuLink" href="${pageContext.request.contextPath}/admin/asset">Asset<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-hdd"></span></a>
							</li>
							<li>
								<a id="assetTypeMenuLink" href="${pageContext.request.contextPath}/admin/assetType">Asset Type<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-modal-window"></span> </a>
							</li>
							<li>
								<a id="assetSubTypeMenuLink" href="${pageContext.request.contextPath}/admin/assetSubType">Asset SubType<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-modal-window"></span> </a>
							</li>
							<li>
								<a id="userMenuLink" href="${pageContext.request.contextPath}/admin/user">User<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
							</li>
							<li>
								<a id="deptMenuLink" href="${pageContext.request.contextPath}/admin/department">Department<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a>
							</li>
							<li>
								<a id="resetUserPwdMenuLink" href="${pageContext.request.contextPath}/admin/resetUserPassword">Reset User Password<span style="font-size: 16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-lock"></span></a>
							</li>
						</ul>
					</li>
				</sec:authorize>
				<sec:authorize
					access="hasAnyRole('APPROVER','ADMIN','USER','ISSUER')">
					<li><a href="${pageContext.request.contextPath}/user/changePassword">Change Password
						<span style="font-size: 20px;"
							class="pull-right hidden-xs showopacity glyphicon glyphicon-lock"></span>
					</a></li>
				</sec:authorize>
				<li>
					<a href="#" onclick="appLogout();">Logout<span style="font-size: 20px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-log-out"></span></a>
				</li>
			</ul>
		</div>
	</div>
</nav>

<form action="/logout" class="hidden" method="post">
	<input type="submit" id="applicationlogout" value="Logout" /> <input
		type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>