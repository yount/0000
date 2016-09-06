<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects/>

<portlet:actionURL name="dispatchRequest" var="toInfoURL">
	<portlet:param name="destination" value="toInfo" />
</portlet:actionURL>
<portlet:actionURL name="dispatchRequest" var="toPasswordURL">
	<portlet:param name="destination" value="toPasswordPage" />
</portlet:actionURL>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge" /> -->
<title>jQuery手机图片触屏滑动轮播效果代码</title>

<link type="text/css" href="<%=basePath %>css/style.css" rel="stylesheet"/>

<script type="text/javascript" src="<%=basePath %>js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.event.drag-1.5.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.touchSlider.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	$(".main_visual").hover(function(){
		$("#btn_prev,#btn_next").fadeOut()
	},function(){
		$("#btn_prev,#btn_next").fadeOut()
	});
	
	$dragBln = false;
	
	$(".main_image").touchSlider({
		flexible : true,
		speed : 200,
		btn_prev : $("#btn_prev"),
		btn_next : $("#btn_next"),
		paging : $(".flicking_con a"),
		counter : function (e){
			$(".flicking_con a").removeClass("on").eq(e.current-1).addClass("on");
		}
	});
	
	$(".main_image").bind("mousedown", function() {
		$dragBln = false;
	});
	
	$(".main_image").bind("dragstart", function() {
		$dragBln = true;
	});
	
	$(".main_image a").click(function(){
		if($dragBln) {
			return false;
		}
	});
	
	timer = setInterval(function(){
		$("#btn_next").click();
	},3000);
	
	$(".main_visual").hover(function(){
		clearInterval(timer);
	},function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		},3000);
	});
	
	$(".main_image").bind("touchstart",function(){
		clearInterval(timer);
	}).bind("touchend", function(){
		timer = setInterval(function(){
			$("#btn_next").click();
		},3000);
	});
	
});
function toResetPassword(){
	window.location.href="${toPasswordURL}";
}
</script>
</head>

<body>
<div class="form-group">
	<div class="main_visual">
		<div class="main_image">
			<ul>    
				<li><span class="img_1"></span></li>
				<li><span class="img_2"></span></li>	
	            <li><span class="img_3"></span></li>
				<li><span class="img_4"></span></li>
			</ul>
			<a href="javascript:;" id="btn_prev"></a>
			<a href="javascript:;" id="btn_next"></a>
		</div>
		<div class="flicking_con">
			<a href="#">1</a>
			<a href="#">2</a>
			<a href="#">3</a>
			<a href="#">4</a>
		</div>
	</div>		
</div>

<div class="form-group">
		<div class="col-xs-12">
			<img src="<%=basePath%>images/eventIcon.png" style="width:60px;height:50px">
		</div>
		<div class="col-xs-12" style="line-height:20px;">
			<a href="${toInfoURL }" >
				<font size="4px" style="vertical-align: middle;"><b>Event</b></font>
			</a>
	    </div>	
</div>
<%@ include file="/jsp/foot_info.jsp"%>
<%-- <jsp:include page='foot.jsp' flush='true' /> --%>
</body>
</html>