<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@  taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<portlet:defineObjects />
	<portlet:resourceURL id="changeUserInfoStatus" var="changeUserInfoStatusURL">
</portlet:resourceURL>

<portlet:defineObjects />
	<portlet:resourceURL id="showImage" var="showImageURL">
</portlet:resourceURL>

<portlet:defineObjects />
	<portlet:resourceURL id="uploadImage" var="uploadImageURL">
</portlet:resourceURL>

<portlet:defineObjects />
	<portlet:resourceURL id="delImage" var="delImageURL">
</portlet:resourceURL>

<portlet:defineObjects />
	<portlet:resourceURL id="updateinfo" var="updateinfoURL">
</portlet:resourceURL>

<portlet:defineObjects />
	<portlet:resourceURL id="loadVideo" var="loadVideoURL">
</portlet:resourceURL>

<portlet:actionURL name="dispatchRequest" var="toAdminHomeURL">
	<portlet:param name="destination" value="toAdminHome" />
</portlet:actionURL>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate"> 
	<meta http-equiv="pragma" content="no-cache"> 
	<meta http-equiv="expires" content="-10">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<link type="text/css" href="<%=basePath%>css/jquery-ui-1.8.17.custom.css" rel="stylesheet" />
     <link type="text/css" href="<%=basePath%>css/jquery-ui-timepicker-addon.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/srdz.preview.2.0.css">
<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-ui-1.8.17.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ajaxfileupload.js"></script>



<script type="text/javascript" >
    var mediaFormat=info.info.mediaURL.substr(info.info.mediaURL.lastIndexOf('.')+1);
	function changeStatus(infoUUID, infoStatus){
		$('#'+infoUUID).attr("onclick","");
		$.post("${changeUserInfoStatusURL }",
		  {
			infoUUID:infoUUID,
			infoStatus:infoStatus
		  },
		  function(data,status){
		    if(data.result==1){
		    	var msg = data.msg;
		    	$('#'+infoUUID).val(msg.infoValue);
		    	$('#'+infoUUID).attr("onclick","changeStatus('"+infoUUID+"', '"+msg.infoStatus+"')");
		    	if(msg.infoStatus==1){
		    		$('#'+infoUUID+'_register').show();
		    	} else {
		    		$('#'+infoUUID+'_register').hide();
		    	}
		    } else {
		    	$('#'+infoUUID).attr("onclick","changeStatus('"+infoUUID+"', '"+infoStatus+"')");
		    }
		  },"json");
	}
	window.onload=function(){
		document.getElementById('portal_normal_dockbar').style="display:block";
		$('#portal_normal_dockbar').attr('style','display:block');
	};
</script>
</head>
<body>
	
	<div class="form-group" style="float:right">
	</div>
	
	<div class="login-title text-center">
		<h4>
		<font>${info.info.title }</font>	
		</h4>
	</div>
	<form action=""  method="post" id="myform"  >
			<div class="form-group">
				<div class="col-xs-12  ">
				 	<div class="input-group"><!-- detailtable -->
					<table class = "detailtable table table-bordered" width="100%">
						<thead>
						<tr>
							<th colspan="6" style="text-align: center;"><h4><b>Event Info</b></h4></th>
						</tr>
						</thead>
						<tbody class="table-striped" width="100%">
						<tr>
							<td class="td-title">Created People </td>
							<td class="td-content" colspan="2">
								<input id="createid" type="text" value="${infos.info.createId }" style="display:none"/>
								<input id="createUserName" type="text" value="${infos.info.createUserName }"/>
							</td>
							<td class="td-title">Status </td>
							<td class="td-content" colspan="2">
								${info.info.status==1?"Published":"Cancelled" }
							</td>
						</tr>
						<tr>
							<td class="td-title">Start Date Time</td>
							<td class="td-content" colspan="2">
								<input id="starttime"  type="text" value='<fmt:formatDate value="${infos.info.startTime}" pattern="MM/dd/yyyy HH:mm:ss"/>'/>
							</td>
							<script type="text/javascript"> 							
							$(function () {
								
							    $("#starttime").datetimepicker({
							        //showOn: "button",
							        //buttonImage: "./css/images/icon_calendar.gif",
							        //buttonImageOnly: true,
							        showSecond: true,
							        timeFormat: 'hh:mm:ss',
							        stepHour: 1,
							        stepMinute: 1,
							        stepSecond: 1
							    })
							   
							})
							</script>
							
							<td class="td-title">End Date Time</td>
							<td class="td-content" colspan="2">
								<input id="endtime" name="endtime" type="text" value='<fmt:formatDate value="${infos.info.endDate}" pattern="MM/dd/yyyy HH:mm:ss"/>'/>
							</td>
							<script type="text/javascript"> 							
							$(function () {
								
							    $("#endtime").datetimepicker({
							        //showOn: "button",
							        //buttonImage: "./css/images/icon_calendar.gif",
							        //buttonImageOnly: true,
							        showSecond: true,
							        timeFormat: 'hh:mm:ss',
							        stepHour: 1,
							        stepMinute: 1,
							        stepSecond: 1
							    })
							   
							})
							</script>						
						</tr>
						<tr>
							<td class="td-title">Title</td>
							<td class="td-content" colspan="2">
								<input id="uuid" type="text" value="${infos.info.uuid }" style="display:none"/>
								<input id="title" type="text" value="${infos.info.title }"/>
							</td>
							<td class="td-title">Created Date Time</td>
							<td class="td-content" colspan="2"><fmt:formatDate value="${info.info.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						</tr>
						<tr>
							<td class="td-title">Content</td>
							<td class="td-content" colspan="5">
								<textarea id="description" rows="3" cols="" style="margin:0;padding:0;width:100%;">${infos.info.content }</textarea>
							</td>
						</tr>
						<tr>
							<td class="td-title">Event Location</td>
							<td class="td-content" colspan="2">
								<textarea id="location" rows="3" cols="" style="margin:0;padding:0;width:100%;">${infos.info.location }</textarea>
							</td>
							<td class="td-title">Targeted Audience</td>
							<td class="td-content" colspan="2">
								<textarea  id="targetedaudience" rows="3" cols="" style="margin:0;padding:0;width:100%;">${infos.info.audience}</textarea>
							</td>
						</tr>
						<tr>
							<td class="td-title">Main Image</td>
							<td  class="td-content" id='main' colspan="5">
							 	<div style='display:inline-block;float:left; padding:0;width: 150px;'>
								 	<div id='' style="z-index:2;float: right;margin:0;padding:0; height:0px;">
									    <a class='btn-pic btn-pic-bg' style="top:0px;" href='javascript:void(0)'>
									      <span id='' onclick="del_mainImage('main');">delete</span>
									    </a>
									 </div>
								 	<img src="${showImageURL}&imgFile=${infos.info.mainImageURL}" style="margin:0; padding:0;top: 0;left: 0;width: 150px;"/>
								</div>
								<input id="mainimage" value="${infos.info.mainImageURL}" type="text" style='display:none;'/>
							</td>
							
							<%-- <td class="td-content" colspan="5">
								<img alt="can not found image" src="${showImageURL}&imgFile=${info.info.mainImageURL }" style="width:20%;">
							</td> --%>

						</tr>
						<tr>
							<td class="td-title">Detail Images</td>
							<td  class="td-content" style="text-align: left;" colspan="5">
							 	<!-- <span id="result"></span> -->
								<input id="img_add" type="button" value="add picture" />
								<input id="img_upload" type="button" value="upload" style='display:none;'/>
								<br/>
								<c:forEach items="${infos.info.imageURL.split(\";\")}" varStatus="status" var="imageUrl" >
								 <c:choose>
								<c:when test="${!imageUrl.equals('')}">  
									<div id="image_${status.index}" style='display:inline-block;float:left; padding:0;width: 150px; margin-right:10px;'>
									 	<div id='' style="z-index:2;float: right;margin:0;padding:0; height:0px;">
										    <a class='btn-pic btn-pic-bg' style="top:10px;" href='javascript:void(0)'>
										      <span id='' onclick="del_image('image_${status.index}','${imageUrl }');">delete</span>
										    </a>
										    
										 </div>
										  
										<img alt="can not found image" src="${showImageURL}&imgFile=${imageUrl}" style="margin-top:10px; width:150px;">
									</div>
								 </c:when> 
								  </c:choose> 
								</c:forEach>
								<div id="img_view" style='width:100%;'></div>
								<img id="loading" src="<%=basePath %>/js/img/loading.gif" style="display:none;width:20px;">
								<input id="result_image" value="${infos.info.imageURL}" type="text" style='display:none;'/>
							</td>   
							<%-- 
							<td  class="td-content" style="text-align: left;" colspan="5">
								<c:forEach items="${info.info.imageURL.split(\";\")}" varStatus="i" var="imageUrl" >
									<img alt="can not found image" src="${showImageURL}&imgFile=${imageUrl}" style="width:20%;">
								</c:forEach>
							</td>
							 --%>
						</tr>
						
						<c:forEach items="${info.info.mediaURL.split(\";\")}" varStatus="i" var="mediaURL" >
						<tr >
							<td>
								<c:if test="${fn:contains(mediaURL,'.')}">
									<div id="video_${status.index}" style='display:inline-block;float:left; padding:0;width: 150px; margin-right:10px;'>
									 	<div id='' style="z-index:2;float: right;margin:0;padding:0; height:0px;">
										    <a class='btn-pic btn-pic-bg' style="top:10px;" href='javascript:void(0)'>
										      <span id='' onclick="del_video('video_${status.index}','${mediaURL }');">deletevideo</span>
										    </a>
										 </div>
										<video width="50%"  controls="controls" style="text-align: center">
										  <%-- <source src="${loadVideoURL}&imgFile=/videos/1472699351331.mp4" type="video/mp4"  webkit-playsinline /> --%>  
										  <%-- <source src="<%=basePath %>/media/video2.mp4" type="video/mp4"  webkit-playsinline /> --%>
										  <source src="${loadVideoURL}&imgFile=${mediaURL}" type="video/mp4"  webkit-playsinline />
										  <source src="${loadVideoURL}&imgFile=${mediaURL}" type="video/ogg"  webkit-playsinline />
										  <source src="${loadVideoURL}&imgFile=${mediaURL}" type="video/webm"  webkit-playsinline />
										  <object data="${loadVideoURL}&imgFile=${mediaURL}" width="100%" >
										  	<embed src="${loadVideoURL}&imgFile=${mediaURL}" width="100%" /> 
										  </object>			
										</video>
									</div>
								</c:if>
								<c:if test="${!empty mediaURL} && ${fn:length(mediaURL)>0} && ${fn:indexOf(mediaURL, 'und')<0}">
									<p style="text-align: left">
										<iframe class="video_iframe" id="video1_iframe" style="z-index:1;" src="http://v.qq.com/iframe/player.html?vid=${mediaURL}&amp;width=400&amp;height=200&amp;auto=0"  width="400" height="200" scrolling="auto" allowfullscreen="false" frameborder="0" >
										</iframe>
									</p> 
								</c:if>
								
								
							</td>
						</tr>
						</c:forEach >
						<tr>
						<td > <input value="" type="file" name="uploadify" id="uploadify" />
						<input value="remove" type="button"  name="uploadify" id="uploadify" onclick="remove()" />
						<input type="hidden" name="hiloadify" id="hiloadify" value="${infos.info.mediaURL}" />
						</td>
						</tr>
						<tr>
							<td colspan="6" class="td-content">
								<button type="button" class="btn btn-sm btn-info" onclick="submitinfo()" >update</button>
							</td>
						</tr>
						</tbody>
						<thead>
							<tr>
								<th colspan="6" style="text-align: center;"><h4><b>Attend People</b></h4></th>
							</tr>
							<tr>
								<td class="td-title"><b>User Name</b></td>
								<td class="td-title"><b>Wechat Id</b></td>
								<td class="td-title"><b>Email Address</b></td>
								<td class="td-title"><b>Employee Id</b></td>
								<td class="td-title"><b>Register Time</b></td>
								<td class="td-title"><b>Status</b></td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${infoWithUsers}" varStatus="i" var="infoWithUser">
							<tr>
								<td class="td-content">${infoWithUser.firstName }.${infoWithUser.lastName }</td>
								<td class="td-content">${infoWithUser.openId }</td>
								<td class="td-content">${infoWithUser.emailAddress }</td>
								<td class="td-content">${infoWithUser.screenName }</td>
								<td class="td-content"><fmt:formatDate value="${infoWithUser.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td class="td-content">${infoWithUser.status }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>	
					</div>
				</div>
			</div>
		</form>
	
</body>

<script type="text/javascript">
function setHeight() {
    var videoWidth = document.body.clientWidth;
    var videoHeight=videoWidth * 9 / 16;
    //document.getElementsById("video1_iframe").src = document.getElementsByTagName("iframe")[ilength].src+"&amp;width="+videoWidth+"&amp;height="+videoHeight;//设定视频的宽高
    //循环所有的iframe个数,设置所有视频的高度和宽度
    for (var ilength = 0; ilength <= document.getElementsByTagName("iframe").length; ilength++) {
        document.getElementsByTagName("iframe")[ilength].height =videoHeight ;//设定iframe的高度
        
    }
}
setHeight();
</script>
<script type="text/javascript">
	var del = [];
	var main_image_upload = true;

	function del_mainImage(id){
		main_image_upload = false;
		del[del.length] = $('#mainimage').val();
		
		var html = ""+
		"<div  style='display:inline-block;width:150px;float:left;'>"+
		  "<div class='' style='float: left;'>"+
		    "<a style='display: inline-block;position: relative;overflow: hidden;' href='javascript:void(0);' >"+
		      "<span>添加图片</span>"+
		      "<input id='fileid' type='file' name='file' class='ipt-bg' />"+
		    "</a>"+
		    "<a style='display: inline-block;position: relative;overflow: hidden;' href='javascript:void(0);' >"+
		      "<span id='main_image' onclick='ajaxFileUpload_main(\"fileid\");'>upload</span>"+
		    "</a>"+
		  "</div>"+
		  "<div id='viewid' ></div>"+
		"</div>"+
		"<input id='mainimage' value='' type='text' style='display:none;'/>";
		$('#'+id).html(html);
		
		/**************
		 * 添加一个图片 
		 ****************/
		$("#fileid").bind("click",function(){
		    var $this =$(this);
		    var browser={
		      isIE:function(ver){
		        var b = document.createElement('b');
		        b.innerHTML = '<!--[if IE ' + ver + ']><i></i><![endif]-->';
		        return b.getElementsByTagName('i').length === 1;
		      }
		    };
		    $this.change(function(){
		      var regex=/(.*)\.(jpg|jpeg|png)$/;
		      var val = $this.val();
		      if(!regex.test(val)){
		        $("#viewid").html("<span class='spanc'>Please select the correct picture format（jpg、jpeg、png）!</span>");
		        // $("#" + xdelid).show();
		        $("#xdelid").attr('style','display:inline-block;');
		        return;
		      }
		      if(browser.isIE(6)){
		        HanderOther($this);
		      }else if(browser.isIE(7) || browser.isIE(8) || browser.isIE(9)){
		        HanderIE789($this);
		      }else if(window.FileReader){
		        HanderFileReader($this);
		      }else{
		        $("#viewid").html("<span class='spanc'>The browser does not support the preview picture!</span>");
		        // $("#" + xdelid).show();
		        $("#xdelid").attr('style','display:inline-block;');
		      }
		      function HanderFileReader($this){
		        var oFReader = new window.FileReader(),
		        rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;
		        oFReader.onload = function (oFREvent){
		          $("#viewid").html("<img src='"+oFREvent.target.result+"' style='width:100%;height:100%;'/>");
		          // $("#" + xdelid).show();
		          $("#xdelid").attr('style','display:inline-block;');
		        };
		        var aFiles = $this.get(0).files;
		        if (aFiles.length == 0) { return; }
		        if (!rFilter.test(aFiles[0].type)) { 
		          $("#viewid").html("<span class='spanc'>Please select the correct picture format（jpg、jpeg、png）!</span>"); 
		          // $("#" + xdelid).show();
		          $("#xdelid").attr('style','display:inline-block;');
		          return; 
		        }
		        oFReader.readAsDataURL(aFiles[0]);
		      }
		      function HanderIE789($this){
		        if(options.width != null && parseInt(options.width) > 0){
		          $("#viewid").css("width",options.width + "px");
		        }else{
		          $("#viewid").css("width","378px");
		        }
		        if(options.height != null && parseInt(options.height) > 0){
		          $("#viewid").css("height",options.height + "px");
		        }else{
		          $("#viewid").css("height","358px");
		        }
		        $("#viewid").css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src='"+GetImgSrc($this)+"')");
		        // $("#" + xdelid).show();
		        $("#xdelid").attr('style','display:inline-block;');
		      }
		      function HanderOther($this){
		        $("#viewid").html("<img src='"+$this.val()+"' style='width:100%;height:100%;'/>");
		        // $("#" + xdelid).show();
		        $("#xdelid").attr('style','display:inline-block;');
		      }
		      function GetImgSrc($this){
		        $this.select();
		        $this.blur();
		        var imgSrc =document.selection.createRange().text;
		        document.selection.empty();
		        return imgSrc;
		      }
		    });
		    
		  });
	}
	
	function del_image(id, imageUrl){
		del[del.length] = imageUrl;

		var images_src = $('#result_image').val();
		$('#result_image').val(images_src.replace(imageUrl, ''));
			
		$('#'+id).empty();
	}
	
	function del_video(id, mediaURL){
		del[del.length] = mediaURL;
		var video_src = $('#hiloadify').val();
		$('#hiloadify').val(video_src.replace(mediaURL, ''));
		$('#'+id).empty();
	}
	
	
	$(function(){
		/**************
		 * 添加多个图片 
		 ****************/

		// 添加图片
		$('#img_add').bind('click',function(){
			var time = new Date().getTime();
			var fileid = "file" + time;
			var xdelid = "xdel" + time;
			var delid = "del" + time;
			var viewid = "view" + time;
			var htm = "" +
			"<div  style='display:inline-block;width:150px;float:left;'>" +
			  "<div class='dft'>" +
			    "<a class='btn-pic btn-pic-bg' href='javascript:void(0);' >" +
			      "<span>上传图片</span>" +
			      "<input id='" + fileid + "' type='file' name='file' class='ipt-bg' />" +
			    "</a>" +
			  "</div>" +
			  "<div id='" + xdelid + "' class='drt'>" +
			    "<a class='btn-pic btn-pic-bg' href='javascript:void(0)'>" +
			      "<span id='" + delid + "'>delete</span>" +
			      "<input type='button'  class='ipt-bg'/>" +
			    "</a>" +
			  "</div>" +
			  "<div id='" + viewid + "' ></div>"+
			"</div>";
			$("#img_view").append(htm);
			
			$("#" + fileid).bind("click",function(){
			    var $this =$(this);
			    var browser={
			      isIE:function(ver){
			        var b = document.createElement('b');
			        b.innerHTML = '<!--[if IE ' + ver + ']><i></i><![endif]-->';
			        return b.getElementsByTagName('i').length === 1;
			      }
			    };
			    $this.change(function(){
			      var regex=/(.*)\.(jpg|jpeg|png)$/;
			      var val = $this.val();
			      if(!regex.test(val)){
			        $("#" + viewid).html("<span class='spanc'>Please select the correct picture format（jpg、jpeg、png）!</span>");
			        // $("#" + xdelid).show();
			        $("#" + xdelid).attr('style','display:inline-block;');
			        return;
			      }
			      if(browser.isIE(6)){
			        HanderOther($this);
			      }else if(browser.isIE(7) || browser.isIE(8) || browser.isIE(9)){
			        HanderIE789($this);
			      }else if(window.FileReader){
			        HanderFileReader($this);
			      }else{
			        $("#" + viewid).html("<span class='spanc'>The browser does not support the preview picture!</span>");
			        // $("#" + xdelid).show();
			        $("#" + xdelid).attr('style','display:inline-block;');
			      }
			      function HanderFileReader($this){
			        var oFReader = new window.FileReader(),
			        rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;
			        oFReader.onload = function (oFREvent){
			          $("#" + viewid).html("<img src='"+oFREvent.target.result+"' style='width:100%;height:100%;'/>");
			          // $("#" + xdelid).show();
			          $("#" + xdelid).attr('style','display:inline-block;');
			        };
			        var aFiles = $this.get(0).files;
			        if (aFiles.length == 0) { return; }
			        if (!rFilter.test(aFiles[0].type)) { 
			          $("#" + viewid).html("<span class='spanc'>Please select the correct picture format（jpg、jpeg、png）!</span>"); 
			          // $("#" + xdelid).show();
			          $("#" + xdelid).attr('style','display:inline-block;');
			          return; 
			        }
			        oFReader.readAsDataURL(aFiles[0]);
			      }
			      function HanderIE789($this){
			        if(options.width != null && parseInt(options.width) > 0){
			          $("#" + viewid).css("width",options.width + "px");
			        }else{
			          $("#" + viewid).css("width","378px");
			        }
			        if(options.height != null && parseInt(options.height) > 0){
			          $("#" + viewid).css("height",options.height + "px");
			        }else{
			          $("#" + viewid).css("height","358px");
			        }
			        $("#" + viewid).css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src='"+GetImgSrc($this)+"')");
			        // $("#" + xdelid).show();
			        $("#" + xdelid).attr('style','display:inline-block;');
			      }
			      function HanderOther($this){
			        $("#" + viewid).html("<img src='"+$this.val()+"' style='width:100%;height:100%;'/>");
			        // $("#" + xdelid).show();
			        $("#" + xdelid).attr('style','display:inline-block;');
			      }
			      function GetImgSrc($this){
			        $this.select();
			        $this.blur();
			        var imgSrc =document.selection.createRange().text;
			        document.selection.empty();
			        return imgSrc;
			      }
			      ajaxFileUpload(fileid);
			    });
			  });//绑定按钮事件
			  
			  $("#" + delid).bind("click",function(){
			    var browser={
			        isIE:function(ver){
			          var b = document.createElement('b');
			          b.innerHTML = '<!--[if IE ' + ver + ']><i></i><![endif]-->';
			          return b.getElementsByTagName('i').length === 1;
			        }
			      };
			    if(browser.isIE(7) || browser.isIE(8) || browser.isIE(9)){
			      $("#" + fileid).val('');
			      $("#" + viewid).css("filter","");
			      $("#" + viewid).css("width","");
			      $("#" + viewid).css("height","");
			      // $("#" + xdelid).hide();
			      $("#" + xdelid).attr('style','display:none;');
			    }else{
			      $("#" + fileid).val('');
			      $("#" + viewid).empty();
			      // $("#" + xdelid).hide();
			      $("#" + xdelid).attr('style','display:none;');
			    }
			    var src_all = $('#result_image').val();
			    var src = $("#" + fileid).attr('result_src');
			    src_all = src_all.replace(src+";",'');
			    $('#result_image').val(src_all);
			    console.log(src);
			    $.post("${delImageURL}"+new Date(),
			  		  {
			  			imgFile:src
			  		  },
			  		  function(data,status){
			  			  
			  		  },"json");
			  });
			  $("#" + fileid).click();
		});
	});
	
	
	function ajaxFileUpload_main(uploadFileId) {
	    $("#loading").ajaxStart(function(){
	    	$("#loading").css("display","block");
	   	});
	   	$("#loading").ajaxComplete(function(){
	   		$("#loading").css("display","none");
	   	});
	   	console.log(11+new Date());
	    $.ajaxFileUpload({
	        url:'${uploadImageURL}&'+new Date(),             //需要链接到服务器地址  
	        secureuri:false,
	        fileElementId : uploadFileId,                         //文件选择框的id属性  
	        dataType: 'json',                                     //服务器返回的格式，可以是json  
	        success: function (data, status)             //相当于java中try语句块的用法  
	        {
		       	 if(data.status==1){
		       		 var src_result = data.src;
		       		 $('#mainimage').val(src_result);
		       		 $('#main_image').attr('click','');
		       		$('#main_image').html('提交成功');
		       		 main_image_upload = true;
		       	 } else {
		       	 }
	        },
	        error: function (data, status, e)             //相当于java中catch语句块的用法  
	        {
	            $('#result').html('Submission failed');  
	        }  
	      });
	}

	function ajaxFileUpload(uploadFileId) {
	    $("#loading").ajaxStart(function(){
	    	$("#loading").css("display","block");
	   	});
	   	$("#loading").ajaxComplete(function(){
	   		$("#loading").css("display","none");
	   	});
	   	console.log(11+new Date());
	    $.ajaxFileUpload({
	        url:'${uploadImageURL}&'+new Date(),             //需要链接到服务器地址  
	        secureuri:false,
	        fileElementId : uploadFileId,                         //文件选择框的id属性  
	        dataType: 'json',                                     //服务器返回的格式，可以是json  
	        success: function (data, status)             //相当于java中try语句块的用法  
	        {
	        	console.log(data+" | "+status);
		       	 if(data.status==1){
		       		 var src_result = data.src;
		       		$('#result_image').val($('#result_image').val()+src_result+";");
		       		 console.log('src_result : '+$('#result_image').val());
		       		$('#'+uploadFileId).attr('result_src', src_result);
		       	 } else {
		       	 }
	        },
	        error: function (data, status, e)             //相当于java中catch语句块的用法  
	        {
	            $('#result').html('Submission failed');  
	        }  
	      });
	}
	
	
	
	function submitinfo(){
		if(!main_image_upload){
			alert('please commit main image');
			return;
		}
		$.post("${updateinfoURL}",
			  {
				uuid:$('#uuid').val(),
				title:$('#title').val(),
				location :$('#location').val(),
				startTime:$('#starttime').val(),
				endTime:$('#endtime').val(),
				targetedaudience:$('#targetedaudience').val(),
				description:$('#description').val(),
				mainimage:$('#mainimage').val(),
				image:$('#result_image').val(),
				video:$('#uploadify').val()+$('#hiloadify').val()
			  },
			  function(data,status){
				  if('success' == status){
					  window.location.href="${toAdminHomeURL }";
					 
				  }else{
					  alert("fail to add");
				  }
			  },"json");
	}
</script>
<script type="text/javascript">
        $(document).ready(function()
        {
            $("#uploadify").uploadify({
                swf: '<%=basePath %>js/uploadify.swf',
                uploader:'${uploadImageURL}',
                method:'post',
                FileTypeExts:'*.jpg;*.mp4',
                buttonText:'Video upload',
                simUploadLimit:0,
                auto: true,
                multi: true,
                onUploadSuccess:function(file,data,response){
              eval("data=" + data);
            var src_result = data.src;
            $('#uploadify').val($('#uploadify').val()+src_result+";");
             console.log('src_result : '+$('#uploadify').val());
                }
            },'json');
        });  
</script>	
<script>
	document.getElementById('portal_normal_dockbar').style="display:block";
	$('#portal_normal_dockbar').attr('style','display:block');
</script>

</html>