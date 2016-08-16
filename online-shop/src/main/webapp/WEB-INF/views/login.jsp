<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@page session="true"%>
<html>
<head>
	<title>Login Page</title>
	<spring:theme code="styleSheet" var="app_css"/>
	<spring:url value="/${app_css}" var="standard_css_url"/>
	<link rel="stylesheet" type="text/css" media="screen" href="${standard_css_url}" />
</head>
<body onload='document.loginForm.username.focus();'>

	<div id="login-box">

		<h3>Enter user credentionals</h3>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm'
		  action="<c:url value='/j_spring_security_check' />" method='POST'>

		<table>
			<tr>
				<td>User:</td>
				<td><input type='text' name='j_username'></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='j_password' /></td>
			</tr>
			<tr>
				<td colspan='2'><input id='login-button' name="submit" type="submit" value="Login" /></td>
			</tr>
		  </table>

		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		</form>
	</div>

</body>
</html>