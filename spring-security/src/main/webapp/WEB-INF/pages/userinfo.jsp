<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>

	<sec:authorize access="hasRole('ROLE_USER')">
		<!-- For login user -->
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		
		<sec:authentication property="principal.username" />
        <br/>
        <a href="${logoutUrl}">Logout</a>

		Hello ${pageContext.request.userPrincipal.name}
	</sec:authorize>
</body>
</html>