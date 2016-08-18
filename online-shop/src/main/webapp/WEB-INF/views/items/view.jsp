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
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	
	<link rel="icon" href="../../favicon.ico">
	
	<!-- Bootstrap core CSS -->
	<spring:url value="/static/css/bootstrap.min.css" var="bootstrap_min_css"/>
	<link href="${bootstrap_min_css}"  rel="stylesheet"></link>
	<!-- Custom styles for this template -->
	<spring:url value="/static/css/offcanvas.css" var="offcanvas_css"/>
	<link href="${offcanvas_css}"  rel="stylesheet"></link>
	
	<spring:url value="/static/css/view.css" var="view_css"/>
	<link href="${view_css}"  rel="stylesheet"></link>
	<!-- Custom styles for this template -->
	<!--<spring:url value="/static/css/carausel.css" var="carausel_css"/>
	<link href="${carausel_css}"  rel="stylesheet"></link>-->
	
	<c:url value="/category/add" var="addCategoryUrl"/>
	
	<spring:message code="label_ru_RU" var="labelRuRu"/>
	<spring:message code="label_en_US" var="labelEnUs"/>
	
	<spring:message code="main_page_label_projectName" var="mainPageLabelProjectName"/>
	<spring:message code="main_page_label_home" var="mainPageLabelHome"/>
	<spring:message code="main_page_label_add_item" var="mainPageLabelAddItem"/>
	<spring:message code="main_page_label_orders" var="mainPageLabelOrders"/>
	<spring:message code="main_page_label_users" var="mainPageLabelUsers"/>
	<spring:message code="main_page_label_logout" var="mainPageLabelLogout"/>
	<spring:message code="main_page_label_view_details" var="mainPageLabelViewDetails"/>
	<spring:message code="main_page_label_cart" var="mainPageLabelCart"/>
	<spring:message code="main_page_label_add_category" var="mainPageLabelAddCategory"/>
	<spring:message code="main_page_label_add" var="mainPageLabelAdd"/>
	
	<title>${mainPageLabelProjectName}</title>
</head>

<body>
	<div id="lang">
   		<a href="${homeUrl}?lang=ru_RU">${labelRuRu}</a> | 
   		<a href="${homeUrl}?lang=en_US">${labelEnUs}</a>
   	</div>

	<nav class="navbar navbar-fixed-top navbar-dark bg-inverse">
		<div class="container">
			<a class="navbar-brand" href="<c:url value='http://dev-blogs.com'/>">${mainPageLabelProjectName}</a>
			<ul class="nav navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="<c:url value='/providers'/>">${mainPageLabelHome}</a></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li class="nav-item"><a class="nav-link" href="#">${mainPageLabelOrders}</a></li>
					<li class="nav-item"><a class="nav-link" href="#">${mainPageLabelUsers}</a></li>
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_USER')">
					<li class="nav-item"><a class="nav-link" href="#">${mainPageLabelCart}</a></li>
				</sec:authorize>
				<li class="nav-item"><a class="nav-link" href="${logoutUrl}">${mainPageLabelLogout}</a></li>
			</ul>
		</div>
		<!-- /.container -->
	</nav>
	<!-- /.navbar -->

	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">
		
		<div class="row featurette">
	        <div class="col-md-7">
	          <h2 class="featurette-heading">Table woodoo</h2>
	          <h3><span class="text-muted">Price 200.0 ₽</span></h3>
	          <p class="lead">Table woodoo.</p>
	        </div>
	        <div class="col-md-5">
	          <img class="featurette-image img-responsive center-block" style="width:500px;height:500px;" src="http://pngimg.com/upload/table_PNG7005.png" alt="Generic placeholder image">
	        </div>
      	</div>

		<footer>
			<p>&copy; ${mainPageLabelProjectName} 2016</p>
		</footer>

	</div>
	<!--/.container-->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"
		integrity="sha384-THPy051/pYDQGanwU6poAc/hOdQxjnOEXzbT+OuUAFqNqFjL+4IGLBgCJC3ZOShY"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"
		integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB"
		crossorigin="anonymous"></script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
	<script src="offcanvas.js"></script>
</body>
</html>