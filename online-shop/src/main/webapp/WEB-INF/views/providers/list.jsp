<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	
	<link rel="icon" href="../../favicon.ico">
	
	<title>dev-blogs.com</title>
	
	<!-- Bootstrap core CSS -->
	<link href="static/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="static/css/offcanvas.css" rel="stylesheet">
	
	<spring:message code="label_ru_RU" var="labelRuRu"/>
	<spring:message code="label_en_US" var="labelEnUs"/>
	
	<spring:message code="main_page_label_projectName" var="mainPageLabelProjectName"/>
	<spring:message code="main_page_label_home" var="mainPageLabelHome"/>
	<spring:message code="main_page_label_orders" var="mainPageLabelOrders"/>
	<spring:message code="main_page_label_users" var="mainPageLabelUsers"/>
	<spring:message code="main_page_label_logout" var="mainPageLabelLogout"/>
</head>

<body>
	<div id="lang">
   		<a href="${homeUrl}?lang=ru_RU">${labelRuRu}</a> | 
   		<a href="${homeUrl}?lang=en_US">${labelEnUs}</a>
   	</div>

	<nav class="navbar navbar-fixed-top navbar-dark bg-inverse">
		<div class="container">
			<a class="navbar-brand" href="#">${mainPageLabelProjectName}</a>
			<ul class="nav navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="#">${mainPageLabelHome}</a></li>
				<li class="nav-item"><a class="nav-link" href="#about">${mainPageLabelOrders}</a></li>
				<li class="nav-item"><a class="nav-link" href="#contact">${mainPageLabelUsers}</a></li>
				<li class="nav-item"><a class="nav-link" href="${logoutUrl}">${mainPageLabelLogout}</a></li>
			</ul>
		</div>
		<!-- /.container -->
	</nav>
	<!-- /.navbar -->

	<div class="container">

		<div class="row row-offcanvas row-offcanvas-right">

			<c:if test="${not empty categories}">
				<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
					<div class="list-group">
						<c:forEach items="${categories}" var="category">
							<a href="#" class="list-group-item">${category.name}</a>
						</c:forEach>
					</div>
				</div>
				<!--/span-->
			</c:if>

			<div class="col-xs-12 col-sm-9">
				<p class="pull-xs-right hidden-sm-up">
					<button type="button" class="btn btn-primary btn-sm"
						data-toggle="offcanvas">Toggle nav</button>
				</p>
				<div class="jumbotron">
					<h1>${mainPageLabelProjectName}</h1>
					<p>This is an example to show the potential of an offcanvas
						layout pattern in Bootstrap. Try some responsive-range viewport
						sizes to see it in action.</p>
				</div>
				
				<c:if test="${not empty items}">
					<div class="row">
						<c:forEach items="${items}" var="item">
							<div class="col-xs-6 col-lg-4">
								<h2>${item.name}</h2>
								<p>${item.price}</p>
								<p>
									<a class="btn btn-secondary" href="#" role="button">View
										details &raquo;</a>
								</p>
							</div>							
						</c:forEach>
						<!--/span-->
					</div>
				</c:if>
				<!--/row-->
			</div>
			<!--/span-->


		</div>
		<!--/row-->

		<hr>

		<footer>
			<p>&copy; Company 2014</p>
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