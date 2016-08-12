<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h3>
			User : ${pageContext.request.userPrincipal.name} |
			<a href="${logoutUrl}">Logout</a>
		</h3>
	</c:if>

	<h3>HTTP Status 403 - Access is denied</h3>	

	<c:choose>
		<c:when test="${empty username}">
		  <h3>You have no permission to access this page!</h3>
		</c:when>
		<c:otherwise>
		  User <b>${username}</b> has no permission to access this page!
		</c:otherwise>
	</c:choose>

</body>
</html>