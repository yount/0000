<%@include file="/jsp/init/init.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />
<portlet:resourceURL id="addInfoURL" var="addInfoURL">
</portlet:resourceURL>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate"> 
	<meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="expires" content="-10">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<script>
	function snedData(){
		// alert("click  ${addInfoURL }");
		$.post("${addInfoURL }",
		  {
			data:"=data="
		  },
		  function(data,status){
			  // console.log(data);
		    // alert("data="+data);
		    // alert("status="+status);
		  });
	}
</script>
</head>
<body>
	<h1>setInfo</h1>
	<input type="button" value="ajax" onclick="snedData();" />
</body>
</html>