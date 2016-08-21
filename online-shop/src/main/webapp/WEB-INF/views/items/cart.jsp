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
	
	<!-- Bootstrap core CSS -->
	<spring:url value="/static/css/bootstrap.min.css" var="bootstrap_min_css"/>
	<!-- Custom styles for this template -->
	<spring:url value="/static/css/offcanvas.css" var="offcanvas_css"/>
	<!-- Custom styles for cart template -->
	<spring:url value="/static/css/cart/cart.css" var="cart_css"/>
	
	<link href="${bootstrap_min_css}"  rel="stylesheet"></link>
	<link href="${offcanvas_css}"  rel="stylesheet"></link>
	<link href="${cart_css}"  rel="stylesheet"></link>
	
	<c:url value="/category/add" var="addCategoryUrl"/>
	
	<spring:url value="/items/view" var="viewDatailsUrl"/>
	<spring:url value="/providers" var="homeUrl"/>
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<spring:url value="/items/cart" var="cartUrl"/>
	<spring:url value="/items/removeFromCart" var="removeUrl"/>
	
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
	
	<spring:message code="cart_page_label_empty" var="cartPageLabelEmpty"/>
	<spring:message code="cart_page_label_item" var="cartPageLabelItem"/>
	<spring:message code="cart_page_label_price" var="cartPageLabelPrice"/>
	<spring:message code="cart_page_label_quantity" var="cartPageLabelQuantity"/>
	<spring:message code="cart_page_label_subtotal" var="cartPageLabelSubtotal"/>
	<spring:message code="cart_page_label_description" var="cartPageLabelDescription"/>
	<spring:message code="cart_page_label_total" var="cartPageLabelTotal"/>
	<spring:message code="cart_page_btn_remove" var="cartPageBtnRemove"/>
	<spring:message code="cart_page_btn_continue" var="cartPageBtnContinue"/>
	<spring:message code="cart_page_btn_checkout" var="cartPageBtnCheckout"/>
	
	<spring:message code="main_page_ph_enter_category" var="mainPagePhEnterCategory"/>
	
	<title>${mainPageLabelProjectName}</title>
	
	<script type="text/javascript">
		function httpGet(theUrl)
		{
		    var xmlHttp = new XMLHttpRequest();
		    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
		    xmlHttp.send( null );
		    return xmlHttp.responseText;
		}
		
		//var td1 = document.getElementById("total_value_for_row");
		var td1 = $('#total_value_for_row').text;
		alert(td1);
	</script>
</head>

<body>
	<div id="lang">
   		<a href="${cartUrl}?lang=ru_RU">${labelRuRu}</a> | 
   		<a href="${cartUrl}?lang=en_US">${labelEnUs}</a>
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
		<c:if test="${not empty orders}">
			<table id="cart" class="table table-hover table-condensed">
	    				<thead>
							<tr>
								<th style="width:50%">${cartPageLabelItem}</th>
								<th style="width:10%">${cartPageLabelPrice}</th>
								<th style="width:8%">${cartPageLabelQuantity}</th>
								<th style="width:22%" class="text-center">${cartPageLabelSubtotal}</th>
								<th style="width:10%"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${orders}" var="order">
								<tr>
									<td data-th="Product">
										<div class="row">
											<div class="col-sm-2 hidden-xs"><img src="http://pngimg.com/upload/table_PNG7005.png" width="100px" height="100px" alt="..." class="img-responsive"/></div>
											<div id="second_td" class="col-sm-10">
												<h4 class="nomargin">${order.item.name}</h4>
												<p>${cartPageLabelDescription}: ${order.item.description}</p>
											</div>
										</div>
									</td>
									<td data-th="Price">${order.item.price} ₽</td>
									<td data-th="Quantity">
										<input type="number" class="form-control text-center" value="1">
									</td>
									<td id="total_value_for_row" data-th="Subtotal" class="text-center">1.99 ₽</td>
									<td class="col-sm-1 col-md-1">
										<form action="${removeUrl}/${order.id}" method="GET">
											<input type="submit" class="btn btn-danger" value="${cartPageBtnRemove}">
		                           				<span class="glyphicon glyphicon-remove"></span>
		                           			</input>
										</form>
		                       		</td>
								</tr>
							</c:forEach>
							
						</tbody>
						<tfoot>
							<tr>
								<td><a href="${homeUrl}" class="btn btn-warning"><i class="fa fa-angle-left"></i>${cartPageBtnContinue}</a></td>								
								<td colspan="2" class="hidden-xs"></td>
								<td class="hidden-xs text-center"><strong>${cartPageLabelTotal} 1.99 ₽</strong></td>
								<td><a href="#" class="btn btn-success btn-block">${cartPageBtnCheckout}<i class="fa fa-angle-right"></i></a></td>
							</tr>
						</tfoot>
					</table>
				</c:if>
				<c:if test="${empty orders}">
					<p>${cartPageLabelEmpty}</p>
				</c:if>

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