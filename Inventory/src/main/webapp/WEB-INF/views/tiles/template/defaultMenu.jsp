<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav>
    <a href="${pageContext.request.contextPath}/"><img class="logo" src="${pageContext.request.contextPath}/static/img/noida.jpg"></a>
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
</nav>