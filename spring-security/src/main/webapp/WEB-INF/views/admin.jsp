<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<style>
table {
	width: 800px;
	font-family: Helvetica, sans-serif;
	font-size: 14px;
}
h1,h2,h3,#fontstyle {
	font-family: Helvetica, sans-serif;
	font-size: 14px;
}
#box {
	border: 1px solid #000;
}
#head {
	background: #E6E5E5;
}
</style>
<body>
	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<c:url value="/providers" var="providerListPage" />
    <c:if test="${pageContext.request.userPrincipal.name != null}">
		<h3>
			User : ${pageContext.request.userPrincipal.name} |
			<a href="${providerListPage}">Provider list page</a> | 
			<a href="${logoutUrl}">Logout</a>
		</h3>
	</c:if>

	<div id="fontstyle">Message : <b>${message}</b></div>
	<h3>List of users</h3>
	
	<c:if test="${not empty users}">
	    	<table id="box">
	    		<thead id="head">
	    			<tr>
	    				<th>ID</th>
	    				<th>Login</th>
	    				<th>Password</th>
	    				<th>Date of registration</th>
	    				<th>Description</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<c:forEach items="${users}" var="user">
	    				<tr align="center">
	    					<td>${user.id}</td>
	    					<td>${user.login}</td>
	    					<td>${user.password}</td>
	    					<td>${user.dateOfRegistration}</td>
	    					<td>${user.description}</td>
	    				</tr>
	    			</c:forEach>
	    		</tbody>
	    	</table>
	    </c:if>
</body>
</html>