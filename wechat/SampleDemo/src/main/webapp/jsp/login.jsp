<%@include file="/jsp/init/init.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  import="com.liferay.portal.model.User"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />


<portlet:actionURL name="dispatchRequest" var="registerURL">
	<portlet:param name="destination" value="register" />
</portlet:actionURL>

<portlet:actionURL name="dispatchRequest" var="loginSuccessURL">
	<portlet:param name="destination" value="loginSuccess" />
</portlet:actionURL>


<portlet:actionURL name="dispatchRequest" var="toInfoURL">
	<portlet:param name="destination" value="toInfo" />
</portlet:actionURL>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport"
		content="width=device-width,initial-scale=1,maximum-scale=1.0" />
	<meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate"> 
	<meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="expires" content="-10">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title></title>
<%
	String path = request.getContextPath();
	String serverPortPath=request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()+"/";
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%
	User user = (User)request.getAttribute("user");
%>
<script type="text/javascript">


</script>
</head>
<body>
	<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1>
					<small>Member Login</small>
				</h1>
			</div>
			<div class="register-content " style="text-align:center">
				<div class="form">
					<form action=""  method="post" id="myform">
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-user"></span></span> 
										<input type="text" 
										  id="email" name="email" class="form-control" required  autocomplete="off" 
										placeholder="Email Address" onblur="EmailCheck(this.value)" onclick="clearInput(this.id,'checkEmail');setDisplayNone('checkEmail');">
									<span class="input-group-addon" id="checkEmail"
										style="display: none; color: red">Please input a real
										Email Address!</span>

								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input type="password"
										id="password" name="password" class="form-control" onblur="PasswordCheck();"
										placeholder="Password">
									<span class="input-group-addon" id="checkPassword"
										style="display: none; color: red">Please input the right
										password!</span>
								</div>
							</div>
						</div>
						
						<div class="form-group form-actions">
							<div class="col-xs-4 col-xs-offset-4 ">
								<span class="input-group-addon" id="checkInfo"
									style="display: none; color: red" >Please complete your
									information!</span>
								<button type="button" class="btn btn-sm btn-info" onclick="Login();">
									<span class="glyphicon glyphicon-off"></span> Login
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div style="text-align: center;"></div>
	<input type="hidden" id="serverPortPath" value="<%=serverPortPath%>"/>
<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
<script src="<%=basePath%>js/jquery.mailAutoComplete-3.1.js"></script>
<script src="<%=basePath%>js/main.js"></script> 
<script>
$("#email").mailAutoComplete(); 
function Login(){
	var email = $('#email').val();
	var password = $('#password').val();
	var serverPortPath=$('#serverPortPath').val();
	$.post(serverPortPath+"c/portal/login?"+new Date(),
	// $.post("http://employee.perficientgdc.com.cn:8888/c/portal/login?"+new Date(),
		  {
			parameterAutoLoginLogin:email,
			parameterAutoLoginPassword:password
		  },
		  function(data,status){
			  if('success' == status){
				  console.log("${loginSuccessURL }");
				  window.location.href="${loginSuccessURL }";
			  } else {
				  alert('emailaddress or password incorrect');
			  }
			
		  }
	);
}
window.onload=function(){
	 var isActive = "${user.active }";
	 if(isActive){
		 window.location.href="${toInfoURL }";
	 }
}
</script>
</body>
</html>
