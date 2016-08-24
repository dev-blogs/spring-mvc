<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<meta name="description" content="">
	<meta name="author" content="">
	
	<!-- Bootstrap core CSS -->
	<spring:url value="/static/css/bootstrap.min.css" var="bootstrap_min_css" />
	<!-- Custom styles for this template -->
	<spring:url value="/static/css/offcanvas.css" var="offcanvas_css" />
	<!-- Custom styles for font-awesome template -->
	<spring:url value="/static/css/item/font-awesome.min.css" var="font_awesome_min_css" />
	
	<link href="${bootstrap_min_css}" rel="stylesheet"></link>
	<link href="${offcanvas_css}" rel="stylesheet"></link>
	<link href="${font_awesome_min_css}" rel="stylesheet"></link>
	
	<c:url value="/category/add" var="addCategoryUrl" />
	
	<spring:url value="/items/view" var="viewDatailsUrl" />
	<spring:url value="/providers" var="homeUrl" />
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<spring:url value="/items/save" var="saveUrl" />
	<spring:url value="/items/cart" var="cartUrl" />
	<spring:url value="/items/edit" var="editUrl" />
	<spring:url value="/items/removeFromCart" var="removeUrl" />
	
	<spring:message code="label_ru_RU" var="labelRuRu" />
	<spring:message code="label_en_US" var="labelEnUs" />
	
	<spring:message code="main_page_label_projectName" var="mainPageLabelProjectName" />
	<spring:message code="main_page_label_home" var="mainPageLabelHome" />
	<spring:message code="main_page_label_add_item" var="mainPageLabelAddItem" />
	<spring:message code="main_page_label_orders" var="mainPageLabelOrders" />
	<spring:message code="main_page_label_users" var="mainPageLabelUsers" />
	<spring:message code="main_page_label_logout" var="mainPageLabelLogout" />
	<spring:message code="main_page_label_view_details"	var="mainPageLabelViewDetails" />
	<spring:message code="main_page_label_cart" var="mainPageLabelCart" />
	<spring:message code="main_page_label_add_category"	var="mainPageLabelAddCategory" />
	
	<spring:message code="main_page_label_add" var="mainPageLabelAdd" />
	
	<spring:message code="edit_page_label_name" var="editPageLabelName" />
	<spring:message code="edit_page_ph_name" var="editPagePlaceHolderName" />
	<spring:message code="edit_page_label_price" var="editPageLabelPrice" />
	<spring:message code="edit_page_ph_price" var="editPagePlaceHolderPrice" />
	<spring:message code="edit_page_label_description"	var="editPageLabelDescription" />
	<spring:message code="edit_page_ph_description"	var="editPagePlaceHolderDescription" />
	<spring:message code="edit_page_label_provider" var="editPageLabelProvider" />
	<spring:message code="edit_page_label_warehouse" var="editPageLabelWarehouse" />
	
	<spring:message code="main_page_ph_enter_category"
		var="mainPagePhEnterCategory" />
	
	<title>${mainPageLabelProjectName}</title>
	
	<script type="text/javascript">
		function httpGet(theUrl) {
			var xmlHttp = new XMLHttpRequest();
			xmlHttp.open("GET", theUrl, false); // false for synchronous request
			xmlHttp.send(null);
			return xmlHttp.responseText;
		}
	
		//var td1 = document.getElementById("total_value_for_row");
		var td1 = $('#total_value_for_row').text;
		alert(td1);
	</script>
</head>

<body>
	<div id="lang">
		<a href="${editUrl}/${item.id}?lang=ru_RU">${labelRuRu}</a> | <a
			href="${editUrl}/${item.id}?lang=en_US">${labelEnUs}</a>
	</div>

	<nav class="navbar navbar-fixed-top navbar-dark bg-inverse">
		<div class="container">
			<a class="navbar-brand" href="<c:url value='http://dev-blogs.com'/>">${mainPageLabelProjectName}</a>
			<ul class="nav navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value='/providers'/>">${mainPageLabelHome}</a></li>
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
		<div class="row_edit">
			<div class="col-md-12">
				<small><i></i>Add alerts if form ok... success, else error.</i></small>
				<div class="alert alert-success">
					<strong><span class="glyphicon glyphicon-send"></span>
						Success! Message sent. (If form ok!)</strong>
				</div>
				<div class="alert alert-danger">
					<span class="glyphicon glyphicon-alert"></span><strong>
						Error! Please check the inputs. (If form error!)</strong>
				</div>
			</div>
			<form role="form" action="${saveUrl}/${item.id}" method="post" modelAttribute="item">
				<input type="hidden" id="categoryId" name="categoryId" value="${categoryId}"/>
				<div class="col-lg-6">
					<div class="well well-sm">
						<strong><i
							class="glyphicon glyphicon-ok form-control-feedback"></i>
							Required Field</strong>
					</div>
					<div class="form-group">
						<label for="InputName">${editPageLabelName}</label>
						<div class="input-group">
							<input type="text" class="form-control" name="name" id="name" placeholder="${editPagePlaceHolderName}" value="${item.name}" required> <span
								class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
						</div>
					</div>
					<div class="form-group">
						<label for="InputPrice">${editPageLabelPrice}</label>
						<div class="input-group">
							<input type="text" class="form-control" id="price" name="price" placeholder="${editPagePlaceHolderPrice}" value="${item.price}" required>
							<span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
						</div>
					</div>
					<div class="form-group">
						<label for="InputDescription">${editPageLabelDescription}</label>
						<div class="input-group">
							<textarea name="description" id="description" class="form-control" rows="5" value="${item.description}" required></textarea>
							<span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
						</div>
					</div>
					<input type="submit" name="submit" id="submit" value="Submit"
						class="btn btn-info pull-right">
				</div>
			</form>
		</div>
	</div>
	<hr>
	<footer>
		<p>&copy; ${mainPageLabelProjectName} 2016</p>
	</footer>
	
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