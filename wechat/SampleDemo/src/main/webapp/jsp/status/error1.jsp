<%@ page import="com.liferay.portal.util.PortalUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.liferay.portal.model.User"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />
<%
	User user = (User)request.getAttribute("user");
%>
<div>
	<h2>${errorInfo}</h2>
	<h1>${user.emailAddress }</h1>
	<h1>${user.password }</h1>
</div>
<%-- <portlet:renderURL var="redirectToHomePageUrl"></portlet:renderURL> --%>
<div>
	<h1>login failed</h1>
	<%-- <a href="${redirectToHomePageUrl}">home</a> --%>
</div>