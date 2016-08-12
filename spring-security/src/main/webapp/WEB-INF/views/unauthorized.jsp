<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<c:url value="/login" var="loginPage" />
	
	<h3>HTTP Status 401 - Unauthorized</h3>
	<a href="${loginPage}">Login page</a>
</body>
</html>