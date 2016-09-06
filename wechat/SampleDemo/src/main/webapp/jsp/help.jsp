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
	<portlet:resourceURL id="sendMail" var="sendMail">
</portlet:resourceURL>

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
var flag = false;
function CheckContent() {
	if(trim($("#helpText").val())!="") {
		$("#checkContent").hide();
		flag = true;
	}else{
		$("#checkContent").show();
		flag = false;		
	}
};
function sendEmail(){
	var helpText=trim($('#helpText').val());
	if(flag){
		$.post("${sendMail }",
				  {
					content:helpText,
				  },
				  function(data,status){
					if(data.result==1){
						var msg = data.msg;
						alert(msg.success);
					} else {
						var msg = data.msg;
						alert(msg.error);
					}
				  var ua = window.navigator.userAgent.toLowerCase();
			  	  if(ua.match(/MicroMessenger/i) == 'micromessenger'){
			  		  window.location.href="${toHomeURL}";
			  	  }else{
			  		  window.location.href="${toAdminHomeURL}";
			  	  }
				  },"json");
	}else{
		alert("please input the help information!");
	}
	
}

function trim(str){ //删除左右两端的空格
	return str.replace(/(^s*)|(s*$)/g, "");
}

</script>

</head>
<body>

<div class="box">
		<div class="login-box">
			<div class="login-title text-center">
				<h1>
					<small>Send Help Email</small>
				</h1>
			</div>
			<div class="register-content ">
				<div class="form">
					<form action=""  method="post" id="myform">
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group ">
									<textarea class="form-control" rows="6" cols="33" id="helpText" onblur="CheckContent();"
									onclick="clearInput(this.id,'checkContent');setDisplayNone('checkContent');">
									</textarea>
									<span class="input-group-addon" id="checkContent"style="display: none; color: red">
										Please input help information!
									</span>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-xs-12  ">
								<div class="input-group">
									
								</div>
							</div>
						</div>
						
						<div class="form-group form-actions">
							<div class="col-xs-4 col-xs-offset-4 ">
								<button type="button" class="btn btn-sm btn-info" onclick="sendEmail();">
									<span class="glyphicon glyphicon-off"></span>Send Email
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