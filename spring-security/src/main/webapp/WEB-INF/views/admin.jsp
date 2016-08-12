<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<c:url value="/providers" var="providerListPage" />
    <c:if test="${pageContext.request.userPrincipal.name != null}">
		<h3>
			User : ${pageContext.request.userPrincipal.name} |
			<a href="${providerListPage}">Provider list page</a> | 
			<a href="${logoutUrl}">Logout</a>
		</h3>
	</c:if>

	Message : <b>${message}</b>
</body>
</html>