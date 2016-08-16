<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page session="true"%>
<html>
<head>
	<title>Login Page</title>
	<spring:theme code="styleSheet" var="app_css"/>
	
	<spring:message code="reg_label_registration" var="regLabelRegistration"/>
	<spring:message code="reg_label_login" var="regLabelLogin"/>
	<spring:message code="reg_label_password" var="regLabelPassword"/>
	<spring:message code="reg_label_passwrod_confirm" var="regLabelPasswrodConfirm"/>
	<spring:message code="reg_label_date_of_registration" var="regLabelDateOfRegistration"/>
	<spring:message code="reg_label_description" var="regLabelDescription"/>
	<spring:message code="reg_button_registration" var="regButtonRegistration"/>
	<spring:message code="label_back" var="labelBack"/>
	
    <spring:message code="label_ru_RU" var="labelRuRu"/>
	<spring:message code="label_en_US" var="labelEnUs"/>
    
    <spring:url value="/registration" var="registrationPageUrl"/>
	<spring:url value="/${app_css}" var="standard_css_url"/>
	<spring:url value="/" var="url_home"/>
	<link rel="stylesheet" type="text/css" media="screen" href="${standard_css_url}" />
</head>
<body onload='document.loginForm.username.focus();'>
	<a href="${registrationPageUrl}?lang=ru_RU">${labelRuRu}</a> | 
    <a href="${registrationPageUrl}?lang=en_US">${labelEnUs}</a>
	<div id="registration-box">

		<h3>${regLabelRegistration}</h3>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name='loginForm' action="<c:url value='/registration' />" method='POST'>

		<table>
			<tr>
				<td>${regLabelLogin}:</td>
				<td><input type='text' id='login' name='login'></td>
			</tr>
			<tr>
				<td>${regLabelPassword}:</td>
				<td><input type='password' id='password' name='password' /></td>
			</tr>
			<tr>
				<td>${regLabelPasswrodConfirm}:</td>
				<td><input type='password' id='passwordConfirm' name='passwordConfirm' /></td>
			</tr>
			<%-- <tr>
				<td>${regLabelDateOfRegistration}:</td>
				<td><input type='text' id='registrationDate' path='registrationDate' name='registrationDate'/></td>
			</tr> --%>
			<tr>
				<td>${regLabelDescription}:</td>
				<td><textarea id='description' name='description' cols='60' rows='8'></textarea></td>
			</tr>
			<tr>
				<td colspan='2'><input id='login-button' name="submit" type="submit" value="${regButtonRegistration}" /></td>				
			</tr>
		  </table>
		</form>
	</div>
	<a href="${url_home}">${labelBack}</a>
</body>
</html>