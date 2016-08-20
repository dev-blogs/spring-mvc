<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Carousel Template for Bootstrap</title>
    
    <!-- Bootstrap core CSS -->
	<spring:url value="/static/css/view/bs.min.css" var="bootstrap_min_css"/>
	<spring:url value="/static/css/view/carousel.css" var="carousel_css"/>
	<spring:url value="/static/css/view/ie10-viewport-bug-workaround.css" var="ie10-viewport-bug-workaround-css"/>

    <!-- Bootstrap core CSS -->
    <link href="${bootstrap_min_css}" rel="stylesheet">
    <link href="${carousel_css}" rel="stylesheet">
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="${ie10-viewport-bug-workaround-css}" rel="stylesheet">
    
    <spring:url value="/resources/js/jquery-1.7.1.js" var="jquery_url" />
    <script src="${jquery_url}" type="text/javascript"><jsp:text/></script>

    <spring:message code="main_page_label_projectName" var="mainPageLabelProjectName"/>
	<spring:message code="main_page_label_home" var="mainPageLabelHome"/>
	<spring:message code="main_page_label_add_item" var="mainPageLabelAddItem"/>
	<spring:message code="main_page_label_orders" var="mainPageLabelOrders"/>
	<spring:message code="main_page_label_users" var="mainPageLabelUsers"/>
	<spring:message code="main_page_label_cart" var="mainPageLabelCart"/>
	<spring:message code="main_page_label_logout" var="mainPageLabelLogout"/>
	<spring:message code="main_page_label_logout" var="mainPageLabelLogout"/>
	<spring:message code="view_page_buy_button" var="viewPageBuyButton"/>
	<spring:message code="view_page_edit_button" var="viewPageEditButton"/>
	<spring:message code="view_page_lebel_price" var="viewPageLebelPrice"/>
	
	<spring:url value="/providers" var="homeUrl"/>
	<spring:url value="/items/view" var="viewDatailsUrl"/>
	<spring:url value="/items/add" var="addOrderUrl"/>
	<spring:url value="/items/cart" var="cartUrl"/>
	<spring:url value="/j_spring_security_logout" var="logoutUrl" />
	<spring:url value="/items/view" var="currentViewUrl" />
	
	<spring:message code="label_ru_RU" var="labelRuRu"/>
	<spring:message code="label_en_US" var="labelEnUs"/>
	
	<script type="text/javascript">
		$("#buy").click(function() {
  			alert( "Handler for .click() called." );
		});
	</script>
	
  </head>
<!-- NAVBAR
================================================== -->
  <body>
  	<div id="lang">
   		<a href="${currentViewUrl}/${item.id}?lang=ru_RU">${labelRuRu}</a> | 
   		<a href="${currentViewUrl}/${item.id}?lang=en_US">${labelEnUs}</a>
   	</div>
    <div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="http://${mainPageLabelProjectName}">${mainPageLabelProjectName}</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="${homeUrl}">${mainPageLabelHome}</a></li>
                <sec:authorize access="hasRole('ROLE_ADMIN')">
	                <li><a href="#">${mainPageLabelOrders}</a></li>
	                <li><a href="#">${mainPageLabelUsers}</a></li>
	            </sec:authorize>
	            <sec:authorize access="hasRole('ROLE_USER')">
            	<li>
	            	<a href="${cartUrl}">${mainPageLabelCart}</a>
	            	<c:if test="${not empty message}">
            			<div id="message" class="${message.type}">${message.message}</div>
        			</c:if>
        			<!-- http://bootsnipp.com/snippets/featured/responsive-shopping-cart -->
       			</li>
	            </sec:authorize>
	            <li><a href="${logoutUrl}">${mainPageLabelLogout}</a></li>
              </ul>
            </div>
          </div>
        </nav>

      </div>
    </div>

    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

      <!-- START THE FEATURETTES -->
      <hr class="featurette-divider">

      <div class="row featurette">
        <div class="col-md-7">
          <h3 class="featurette-heading">${item.name}</h3>
          <h2><span class="text-muted">${viewPageLebelPrice} ${item.price} ₽</span></h2>
          <p class="lead">${item.description}</p>
        </div>
        <div class="col-md-5">
          <img class="featurette-image img-responsive center-block" width="400px" height="400px" src="http://pngimg.com/upload/table_PNG7005.png" alt="Generic placeholder image">
        </div>
      </div>

      <hr class="featurette-bottom-divider">
      <sec:authorize access="hasRole('ROLE_ADMIN')">
	      <form method="POST" action="#">
	      	<input type="submit" name="Buy" class="btn btn-send btn-primary btn-default" value="${viewPageEditButton}"/>
	      </form>
	  </sec:authorize>
	  <sec:authorize access="hasRole('ROLE_USER')">
	  	<form method="POST" action="${addOrderUrl}/${item.id}">
	  		<!--<input type="hidden" name="userId" value="<sec:authentication property="name"/>"/>-->
	  		<!--<input type="hidden" name="itemId" value="${item.id}"/>-->
	      	<input type="submit" name="Buy" class="btn btn-send btn-primary btn-default" value="${viewPageBuyButton}"/>
	      </form>
	      <!--<button name="buy" id="buy" class="btn btn-send btn-primary btn-default">
	      	${viewPageBuyButton}
	      </buton>-->
	  </sec:authorize>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>