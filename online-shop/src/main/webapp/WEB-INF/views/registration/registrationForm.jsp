<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@page session="true"%>
<html>
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">

		<!-- Website CSS style -->
		<link href="<c:url value='/static/css/bootstrap.css' />"  rel="stylesheet"></link>
		<!-- <spring:theme code="styleSheet" var="app_css"/> -->
		<spring:url value="/static/css/registration.css" var="standard_css_url"/>
		<link rel="stylesheet" type="text/css" media="screen" href="${standard_css_url}" />
		

		<!-- Website Font style -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
		
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>
		
		<spring:message code="label_ru_RU" var="labelRuRu"/>
		<spring:message code="label_en_US" var="labelEnUs"/>
		
		<spring:message code="reg_label_company_name" var="labelCompanyName"/>
		<spring:message code="reg_label_your_name" var="labelYourName"/>
		<spring:message code="reg_label_email" var="labelEmail"/>
		<spring:message code="reg_label_login" var="labelLogin"/>
		<spring:message code="reg_label_password" var="labelPassword"/>
		<spring:message code="reg_label_confirm" var="labelConfirm"/>
		
		<spring:message code="reg_ph_your_name" var="placeHolderName"/>
		<spring:message code="reg_ph_email" var="placeHolderEmail"/>
		<spring:message code="reg_ph_login" var="placeHolderLogin"/>
		<spring:message code="reg_ph_password" var="placeHolderPassword"/>
		<spring:message code="reg_ph_confirm" var="placeHolderConfirm"/>
		
		<spring:message code="reg_button_registration" var="buttonRegistration"/>
		<spring:message code="reg_label_back" var="buttonBack"/>
		
		<c:url var="registrationUrl" value='/registration'/>
		<c:url var="loginPage" value="/" />

		<title>${labelCompanyName}</title>
	</head>
	<body>
		<div id="lang">
    		<a href="${homeUrl}?lang=ru_RU">${labelRuRu}</a> | 
    		<a href="${homeUrl}?lang=en_US">${labelEnUs}</a>
    	</div>
		<div class="container">
			<div class="row main">
				<div class="panel-heading">
	               <div class="panel-title text-center">
	               		<h1 class="title">${labelCompanyName}</h1>
	               		<hr />
	               	</div>
	            </div> 
				<div class="main-login main-center">
					<c:if test="${not empty message}">
            			<div id="message" class="${message.type}">${message.message}</div>
        			</c:if>
					<form:form class="form-horizontal" id="loginForm" method="post" action="${registrationUrl}" modelAttribute="user">
						
						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">${labelLogin}</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<form:input path="login" type="text" id="login" class="form-control" placeholder="${placeHolderLogin}"/>
								</div>
								<div>
									<form:errors path="login" cssClass="alert-danger" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">${labelPassword}</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="${placeHolderPassword}"/>
								</div>
								<div>
									<form:errors path="password" cssClass="alert-danger" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">${labelConfirm}</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="${placeHolderConfirm}"/>
								</div>
								<div>
									<form:errors path="confirm" cssClass="alert-danger" />
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label  for="name" class="cols-sm-2 control-label">${labelYourName}</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<form:input path="name" type="text" class="form-control" name="name" id="name"  placeholder="${placeHolderName}"/>
								</div>
								<div>
									<form:errors path="name" cssClass="alert-danger" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">${labelEmail}</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<form:input path="email" type="text" class="form-control" name="email" id="email"  placeholder="${placeHolderEmail}"/>
								</div>
								<div>
									<form:errors path="email" cssClass="alert-danger" />
								</div>
							</div>							
						</div>

						<div class="form-group ">
							<input type="submit" id="registration_btn" class="btn btn-primary btn-lg btn-block login-button" value="${buttonRegistration}"/>
						</div>
						
						<div class="form-group ">
							<button type="button" id="registration_btn" onclick="window.open('${loginPage}', '_self')" class="btn btn-primary btn-lg btn-block login-button">${buttonBack}</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	</body>
</html>