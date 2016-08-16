<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page session="true"%>
<html>
<head>
	<title>Login Page</title>
	<spring:theme code="styleSheet" var="app_css"/>
	
	<spring:message code="label_enter_user_credentials" var="labelEnterUserCredentials"/>
	<spring:message code="label_user_login" var="labelUserLogin"/>
	<spring:message code="label_user_password" var="labelUserPassword"/>
	<spring:message code="label_registration" var="labelRegistration"/>
	<spring:message code="button_submit" var="buttonSubmit"/>
    <spring:message code="label_ru_RU" var="labelRuRu"/>
	<spring:message code="label_en_US" var="labelEnUs"/>
    
    <spring:url value="/" var="homeUrl"/>
	<spring:url value="/${app_css}" var="standard_css_url"/>
	<spring:url value="/registration" var="registration_url"/>
	<link rel="stylesheet" type="text/css" media="screen" href="${standard_css_url}" />
</head>
<body onload='document.loginForm.username.focus();'>
	<a href="${homeUrl}?lang=ru_RU">${labelRuRu}</a> | 
    <a href="${homeUrl}?lang=en_US">${labelEnUs}</a>
	<div id="login-box">

		<h3>${labelEnterUserCredentials}</h3>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm' action="<c:url value='/j_spring_security_check' />" method='POST'>

		<table>
			<tr>
				<td>${labelUserLogin}:</td>
				<td><input type='text' name='j_username'></td>
			</tr>
			<tr>
				<td>${labelUserPassword}:</td>
				<td><input type='password' name='j_password' /></td>
			</tr>
			<tr>
				<td colspan='2'><input id='login-button' name="submit" type="submit" value="${buttonSubmit}" /></td>				
			</tr>
			<tr>
				<td><a href="${registration_url}">${labelRegistration}</a></td>
			</tr>
		  </table>

		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		</form>
	</div>

</body>
</html>