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
	
	<c:url value="/category/add" var="addCategoryUrl"/>
	
	<spring:url value="/items/view" var="viewDatailsUrl"/>
	<spring:url value="/providers" var="homeUrl"/>
	
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
	
	<spring:message code="main_page_ph_enter_category" var="mainPagePhEnterCategory"/>
	
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

			<c:if test="${not empty categories}">
				<div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
					<div class="list-group">
						<c:forEach items="${categories}" var="category">
							<a href="<c:url value='/providers/${category.id}' />" class="list-group-item">${category.name}</a>
						</c:forEach>
					</div>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<!--<a href="<c:url value='#' />" class="list-group-item">${mainPageLabelAddCategory}</a>-->
						<div class="jumbotron" id="header">
							<div id="add">${mainPageLabelAddCategory}</div>
							<form:form action="${addCategoryUrl}" method="POST" modelAttribute="category">
								<input id="add_category" name="name" type="text" placeholder="${mainPagePhEnterCategory}"/>
								<div>
									<form:errors path="name" cssClass="alert-danger" />
								</div>
								<input id="add_category" class="btn btn-block btn-primary btn-default" type="submit" value="${mainPageLabelAdd}"/>
							</form:form>
						</div>
					</sec:authorize>
				</div>
			</c:if>

			<div class="col-xs-12 col-sm-9">
				
				<div class="jumbotron" id="header">
					<h1>${category.name}</h1>
					<p>This is an example to show the potential of an offcanvas
						layout pattern in Bootstrap. Try some responsive-range viewport
						sizes to see it in action.</p>
				</div>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="jumbotron" id="header">
					<h3>${mainPageLabelAddItem}</h3>
				</div>
				</sec:authorize>
				
				<c:if test="${not empty items}">
					<div class="row">
						<c:forEach items="${items}" var="item">
							<div class="col-xs-6 col-lg-4">
								<h5>${item.name}</h5>
								<h3>${item.price} ₽</h3>
								<p>
									<a class="btn btn-secondary" href="${viewDatailsUrl}/${item.id}" role="button">${mainPageLabelViewDetails} &raquo;</a>
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