<%@include file="/jsp/init/init.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.liferay.portal.model.User"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />
<portlet:actionURL name="dispatchRequest" var="registerURL">
	<portlet:param name="destination" value="register" />
</portlet:actionURL>

<portlet:actionURL name="dispatchRequest" var="toLoginURL">
	<portlet:param name="destination" value="toLogin" />
</portlet:actionURL>

<portlet:actionURL name="dispatchRequest" var="toInfoURL">
	<portlet:param name="destination" value="toInfo" />
</portlet:actionURL>

<portlet:defineObjects />
	<portlet:resourceURL id="activate" var="activateURL">
</portlet:resourceURL>


<%!String openId = ""; %>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i = 0; i < cookies.length; i++){
			if("openId".equals(cookies[i].getName())){
				openId = cookies[i].getValue();
				break ;
			}
		}
	}
%>

<%
	User user = (User)request.getAttribute("user");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1.0" />
<title></title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<script type="text/javascript">



</script>
</head>
<body>
	<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1>
					<small>Activate Your Account</small>
				</h1>
			</div>
			<div class="register-content ">
				<div class="form">
					<form action=""  method="post" id="myform">
						<input type="hidden" name="openId" id="openId" value="<%=openId %>"></input>
						<span class="input-group-addon" id="showmsg" style="color: red">${msg }</span>
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-user"></span>
									</span> 
									<input type="text"
									  id="email" name="email" class="form-control" required autofocus autocomplete="off" 
									placeholder="Email Address" onblur="EmailCheck(this.value)" onclick="clearInput(this.id,'checkEmail');setDisplayNone('checkEmail');">
									<br/>
									<span class="input-group-addon" id="checkEmail"
										style="display: none; color: red">Please input a real
										Email Address!</span>

								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon">
										<span class="glyphicon glyphicon-user"></span>
									</span> 
									<input type="text"
									id="empId" name="empId" class="form-control"
									placeholder="Employee ID" onblur="EmpIdCheck(this.value)" onclick="clearInput(this.id,'checkEmpId');setDisplayNone('checkEmpId');">
									<br/>
									<span class="input-group-addon" id="checkEmpId"
										style="display: none; color: red">Please input your
										Employee ID!</span>
								</div>
							</div>
						</div>
<!-- 						<div class="form-group">
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
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-lock"></span></span> <input type="password"
										id="repassword" name="repassword" class="form-control"
										placeholder="Confirm Password" onblur="Submit();" onclick="clearInput(this.id,'checkPassword');setDisplayNone('checkPassword');">
									<span class="input-group-addon" id="checkInfo"
										style="display: none; color: red">Please input the same
										password again!</span>
								</div>
							</div>
						</div> -->
						<span id="showopenid">${errorInfo}</span>
						<div class="form-group form-actions">
							<div class="col-xs-4 col-xs-offset-4 ">
								<span class="input-group-addon" id="checkInfo"
									style="display: none; color: red" >Please complete your
									information!</span>
								
								<button type="button" class="btn btn-sm btn-info" onclick="submit_form()">
									<span class="glyphicon glyphicon-off"></span> Activate
								</button>
								<button type="button" class="btn btn-sm btn-info" onclick="">
									<a href="${toLoginURL }">
										<span class="glyphicon glyphicon-off" id="toLogin"></span> Login
									</a>
								</button>
								
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<div style="text-align: center;"></div>
<script src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
<script src="<%=basePath%>js/jquery.mailAutoComplete-3.1.js"></script>
<script src="<%=basePath%>js/main.js"></script>
</body>
</html>
<script>
	$("#email").mailAutoComplete(); 
	function check() {
	    if($("#email").val().trim()==""||$("#email").val().trim()==null) {
	  	  $("#checkEmail").show();
		      return false;
	    }
	    if($("#empId").val().trim()==""||$("#empId").val().trim()==null) {
		       $("#checkEmpId").show();
		       return false;
	    }
	    /* if($("#password").val().trim()==""||$("#password").val().trim()==null) {
			   $("#checkPassword").show();
		       return false;
	    }
	    if($("#repassword").val().trim()==""||$("#repassword").val().trim()==null) {
				$("#checkInfo").show();
		       return false;
	    } */
	    return true;
	}
	
	function submit_form(){
		if(check()){
			$.post("${activateURL }",
				  {
					empId:$('#empId').val(),
					password:$('#password').val(),
					email:$('#email').val(),
					openId:$('#openId').val()
				  },
				  function(data,status){
					  var msg = data.msg;
					  if(data.result==1){
						  $.post("http://121.43.175.85:8888/c/portal/login",
								  {
									parameterAutoLoginLogin:msg.email,
									parameterAutoLoginPassword:msg.password
								  },
								  function(data,status){
									  if('success' == status){
										  window.location.href="${toInfoURL }";
									  } else {
										  alert('emailaddress or password incorrect');
									  }
									
								  }
							);
				  		  // window.location.href="http://121.43.175.85:8888/c/portal/login?parameterAutoLoginLogin="+msg.email+"&parameterAutoLoginPassword="+msg.password;
					  } else if(data.result==0){
						  alert(msg.error);
					  } 
				  },"json");
		} else {
			return false;
		}
	}

	function hider(){
       $("#showmsg").hide(); 
 	}
	
	var openId = null; 
	window.onload=function(){
		
        if($("#showmsg").val().trim()!=null){
        	$("#showmsg").show();
        }

 		if($.cookie('openId')){
			openId = $.cookie('openId');
		} 
		
 		if(openId==null || openId==""){
	 		openId = $('#openId').val();
		}
		
		
		if(openId!=null && ""!=openId){
			$('#openId').val(openId);
		}
//		alert('openId='+$('#openId').val());
		// alert("openId="+$('#openId').val());
		
//		if(openId=="" || openId==null){
//			$('#toLogin').click();
//			return;
//		} 
		
/* 		var jump = "${jump }";
		if(!jump){
			window.location.href="${toInfoURL }";
		} */
			
	}
	// window.reload();
</script>
