<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page session="true"%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<spring:message code="label_login" var="labelLoginPage"/>	
	<spring:message code="user_save_success" var="userSaveSuccess"/>
	
	<spring:url var="homeUrl" value="registration/success"/>
	<spring:url var="loginUrl" value="/"/>
	
	<spring:theme code="styleSheet" var="app_css"/>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="assets/css/app.css">
	<!-- Website Font style -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
</head>
<body>
	<h3>${userSaveSuccess}</h3>
	<a href="${loginUrl}">${labelLoginPage}</a>
</body>
</html>