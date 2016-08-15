<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<style>
h1,h2,h3,#fontstyle {
	font-family: Helvetica, sans-serif;
	font-size: 14px;
}
#head {
	background: #E6E5E5;
}
</style>
<body>
	<c:url value="/login" var="loginPage" />
	
	<h3>HTTP Status 401 - Unauthorized</h3>
	<div id="fontstyle"><a href="${loginPage}">Login page</a></div>
</body>
</html>