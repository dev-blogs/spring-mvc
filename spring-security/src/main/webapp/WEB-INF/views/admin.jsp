<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
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

	Message : <b>${message}</b></br></br>
	
	<c:if test="${not empty users}">
	    	<table>
	    		<thead>
	    			<tr>
	    				<th>ID</th>
	    				<th>Login</th>
	    				<th>Password</th>
	    				<th>Date</th>
	    				<th>Description</th>
	    			</tr>
	    		</thead>
	    		<tbody>
	    			<c:forEach items="${users}" var="user">
	    				<tr>
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