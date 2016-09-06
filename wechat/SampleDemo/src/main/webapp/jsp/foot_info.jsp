<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:actionURL name="dispatchRequest" var="toHomeURL">
	<portlet:param name="destination" value="toHomePage" />
</portlet:actionURL>

<portlet:actionURL name="dispatchRequest" var="toHelpURL">
	<portlet:param name="destination" value="toHelpPage" />
</portlet:actionURL>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#foot_nav { width:100%; height: 35px; border: 0px solid #D4CD49; position:fixed;left:0px;bottom:0px;margin:0;padding:0;}
	.btn-info:hover, .btn-info:focus, .btn-info:active, .btn-info.active, .btn-info.disabled, .btn-info[disabled] {
	    color: #ea0404;
	    background-color: #00beeb;
    }
</style>
</head>
<body>
	<div id="foot_nav">
	  <table class="menutable" style="width:100%;margin:0px;padding:0px;border:0px;" >
			<tr>
				<td class="tdt" style="text-align:center;height:35px;line-height:35px;width:50%;padding:0px;" >
				   <button type="button" class="btn btn-sm btn-info td-button" style="color:#ADADAD;background-image: linear-gradient(to bottom,#F0F0F0,#F0F0F0);background-color: #F0F0F0;border-Radius:0px;font-size: 15px;" onclick="window.location.href='${toHelpURL}'" style="align:center">Help</button>
				</td>
				<td class="tdt" style="text-align:center;height:35px;line-height:35px;width:50%;padding:0px;"> 	
				   <button type="button" class="btn btn-sm btn-info td-button" style="color:#ADADAD;background-image: linear-gradient(to bottom,#F0F0F0,#F0F0F0);background-color: #F0F0F0;border-Radius:0px;font-size: 15px;" onclick="window.location.href='${toHomeURL}'">Home</button>
				</td>
			</tr>
	  </table>
	</div>
	<div style="height:100px;"></div>
	<script type="text/javascript">
	window.onload=function(){
		var width = $('.portlet').width();
		$('#foot_nav').attr('style','width:'+width+'px;');
		console.log(width);
	};
	function orientationChange() {
		
		// flag=0或者不存在，当前为水平状态
		// flag=1,当前为旋转状态
		var flag;
		var h;
		if(location.href.indexOf('flag=')>0){
			flag = location.href.substring(location.href.indexOf('flag=')+5);
			h = location.href.substring(0,location.href.indexOf('flag='));
		} else {
			flag = 0;
			h = location.href;
		}
		
		if((flag==0 || !flag) && window.orientation>=30||window.orientation<=-30){
			var href = (h.indexOf('?'))>0 ? h+'&flag=1' : h+'?flag=1';
			location.replace(href);
		} else if(flag==1 && window.orientation>-30 && window.orientation<30) {
			var href = (h.indexOf('?'))>0 ? h+'&flag=0' : h+'?flag=0';
			location.replace(href);
		}
	    
	};

	// 添加事件监听
	addEventListener('load', function(){
	    orientationChange();
	    window.onorientationchange = orientationChange;
	});
	</script>
</body>
</html>