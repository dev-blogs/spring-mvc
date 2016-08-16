<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<spring:theme code="styleSheet" var="app_css"/>
	<spring:url value="/${app_css}" var="standard_css_url"/>
	<link rel="stylesheet" type="text/css" media="screen" href="${standard_css_url}" />
</head>
<body>
	<c:url value="/login" var="loginPage" />
	
	<h3>HTTP Status 401 - Unauthorized</h3>
	<div id="fontstyle"><a href="${loginPage}">Login page</a></div>
</body>
</html>