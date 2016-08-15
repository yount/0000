<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.liferay.portal.model.User"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
	User user = (User)request.getAttribute("user");
%>

</head>
<body>
	
	<div>
		<h2>${successInfo}</h2>
	</div>
	<%-- <portlet:renderURL var="redirectToHomePageUrl"></portlet:renderURL> --%>
	<div>
		<h1>login successfully</h1>
		<h1>${user.emailAddress }</h1>
		<h1>${user.password }</h1>
	<%-- 	<a href="${redirectToHomePageUrl }">back</a> --%>
	</div>
	<script>
		window.location.href="http://121.43.175.85/c/portal/login?parameterAutoLoginLogin=${user.emailAddress }&parameterAutoLoginPassword=${user.password }";
	</script>

</body>
</html>