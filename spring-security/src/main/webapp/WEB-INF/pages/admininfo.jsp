<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
	<h1>Title : ${title}</h1>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<h1>Message : This is admin's page</h1>
	
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		
		<sec:authentication property="principal.username" />
		<br/>
		<a href="${logoutUrl}">Logout</a>
	
		Hello ${pageContext.request.userPrincipal.name}
	</sec:authorize>

</body>
</html>