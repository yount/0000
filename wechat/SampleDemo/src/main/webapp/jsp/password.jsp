<%@include file="/jsp/init/init.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  import="com.liferay.portal.model.User"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />


<portlet:actionURL name="dispatchRequest" var="toHomeURL">
	<portlet:param name="destination" value="toHomePage" />
</portlet:actionURL>
<portlet:actionURL name="dispatchRequest" var="toAdminHomeURL">
	<portlet:param name="destination" value="toAdminHome" />
</portlet:actionURL>

<portlet:defineObjects />
	<portlet:resourceURL id="ResetPassword" var="ResetPasswordURL">
</portlet:resourceURL>
      
       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport"
		content="width=device-width,initial-scale=1,maximum-scale=1.0" />
	<meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate"> 
	<meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="expires" content="-10">
	<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<title>Insert title here</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script src="<%=basePath%>js/main.js"></script>
<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>

<script type="text/javascript">

function trim(str){ //删除左右两端的空格
	return str.replace(/(^s*)|(s*$)/g, "");
}

var flagPassword = false;
function CheckPassword(){
	var pattern =  /^[0-9]{6,}$/;
	if(pattern.test($("#password").val())){
		$("#checkPassword").hide();
		flagPassword = false;
	}else{
		$("#checkPassword").show();
		flagPassword = true;		
	}
};
var flagEnter = false;
function EnterCheck(){
	if (trim($("#password").val()) !==  trim($("#repassword").val()) ) {
		$("#EnterCheck").show();
		flagEnter = true;
	}else{
		$("#EnterCheck").hide();
		flagEnter= false;
	}
}

function ResetPassword(){
	if(flagPassword || flagEnter){
		alert("please enter again!");
	}else{
		$.post("${ResetPasswordURL}",
		  {
			password:$('#password').val(),
		  },
		  function(data,status){
			  if(data.result==1){
				  var ua = window.navigator.userAgent.toLowerCase();
				  if(ua.match(/MicroMessenger/i) == 'micromessenger'){
					  window.location.href="${toHomeURL}";
				  }else{
					  window.location.href="${toAdminHomeURL}";
				  }
			  } else {
				 alert('Failed to reset password,please try again!');
			  }	  
		  },"json");
	}
	
}

</script>

</head>
<body>

<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1>
					<small>Reset Password</small>
				</h1>
			</div>
			<div class="register-content ">
				<div class="form">
					<form action=""  method="post" id="myform">
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group" style="text-align:center">
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-user"></span>
									</span>
									<input type="password" id="password" name="password" class="form-control"
										  placeholder="Password(at least six figures)" onblur="CheckPassword();" onclick="clearInput(this.id,'checkPassword');setDisplayNone('checkPassword');">
									<span class="input-group-addon" id="checkPassword"style="display: none; color: red">
										Please input a correct password!
									</span>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group" style="text-align:center">
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-lock"></span>
									</span>
									<input type="password"
										id="repassword" name="repassword" class="form-control" onblur="EnterCheck();"
										placeholder="Enter again">
									<span class="input-group-addon" id="EnterCheck"
										style="display: none; color: red">
										Please input the same password!
									</span>
								</div>
							</div>
						</div>
						
						<div class="form-group form-actions">
							<div class="col-xs-4 col-xs-offset-4 ">
								<button type="button" class="btn btn-sm btn-info" onclick="ResetPassword();">
									<span class="glyphicon glyphicon-off"></span>Save
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
