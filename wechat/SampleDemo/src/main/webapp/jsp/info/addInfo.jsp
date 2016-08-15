<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />
	<portlet:resourceURL id="changeUserInfoStatus" var="changeUserInfoStatusURL">
</portlet:resourceURL>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript" >

</script>
</head>
<body>
	<div class="login-title text-center">
		<h3>
		<font>Add Event </font>	
		</h3>
	</div>
	<form action=""  method="post" id="myform"  >
			<div class="form-group">
				<div class="col-xs-12  ">
				 	<div class="input-group">
					<table class = "detailtable" width="100%">
						<tr>
							<td class="tdt">Event Title
							</td>
						</tr>
						<tr>
							<td class="tdp">
					 			<input id="" type="text" />
							</td>
						</tr>
						<tr>
							<td class="tdt">Event Location
							</td>
						</tr>
						<tr>
							<td class="tdp">
					 			<textarea rows="3" cols="" style="margin:0;padding:0;width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="tdt">Start Time</td>
						</tr>
						<tr>
							<td class="tdp">
								<input id="" type="text" />
							</td>
						</tr>
						<tr>
							<td class="tdt">End Time
							</td>
						</tr>
						<tr>
							<td class="tdp">
								<input id="" type="text" />
							</td>
						</tr>
						<tr>
							<td class="tdt">Targeted Audience
							</td>
						</tr>
						<tr>
							<td class="tdp">
								<textarea rows="3" cols="" style="margin:0;padding:0;width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="tdt">Description
							</td>
						</tr>
						<tr>
							<td  class="tdp">
								<textarea rows="3" cols="" style="margin:0;padding:0;width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="tdt">Image
							</td>
						</tr>
						<tr>
							<td  class="tdp">
								
								<input name="file" type="file" size="20" accept=".jpg">
							</td>
						</tr>
					</table>
					</div>
				</div>
			</div>
		</form>
	
	
	
	
	
	
</body>
</html>