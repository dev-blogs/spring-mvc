<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login page</title>
        
        <spring:message code="button_submit" var="buttonSubmit"/>
        <spring:message code="placeholder_login" var="placeholderLogin"/>
        <spring:message code="placeholder_password" var="placeholderPassword"/>
        <spring:message code="label_registration" var="labelRegistration"/>
        <spring:message code="label_ru_RU" var="labelRuRu"/>
		<spring:message code="label_en_US" var="labelEnUs"/>
		
        <link href="<c:url value='/static/css/bootstrap.css' />"  rel="stylesheet"></link>
        <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
        <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
        
        <c:url var="registration" value="/registration" />
    </head>
 
    <body>
    	<div id="lang">
    		<a href="${homeUrl}?lang=ru_RU">${labelRuRu}</a> | 
    		<a href="${homeUrl}?lang=en_US">${labelEnUs}</a>
    	</div>
        <div id="mainWrapper">
            <div class="login-container">
                <div class="login-card">
                    <div class="login-form">
                        <c:url var="loginUrl" value="/j_spring_security_check" />
                        <form action="${loginUrl}" method="post" class="form-horizontal">
                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger">
                                    <p>Invalid username and password.</p>
                                </div>
                            </c:if>
                            <c:if test="${param.logout != null}">
                                <div class="alert alert-success">
                                    <p>You have been logged out successfully.</p>
                                </div>
                            </c:if>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="username"><i class="fa fa-user"></i></label>
                                <input type="text" class="form-control" name="j_username" placeholder="${placeholderLogin}" required>
                            </div>
                            <div class="input-group input-sm input-ps">
                                <label class="input-group-addon" for="password"><i class="fa fa-lock"></i></label> 
                                <input type="password" class="form-control" name="j_password" placeholder="${placeholderPassword}" required>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
                            <div class="form-actions">
                            	<input type="submit" class="btn btn-block btn-primary btn-default" value="${buttonSubmit}">
                            </div>
                        </form>
						<div class="form-actions">
							<input type="submit" onclick="window.open('${registration}', '_self')" class="btn btn-block btn-primary btn-default" value="${labelRegistration}">
						</div>
                    </div>
                </div>
            </div>
        </div>
 
    </body>
</html>