<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />
	<portlet:resourceURL id="changeUserInfoStatus" var="changeUserInfoStatusURL">
</portlet:resourceURL>

<portlet:actionURL name="dispatchRequest" var="toInfoURL">
	<portlet:param name="destination" value="toInfo" />
</portlet:actionURL>

<portlet:defineObjects />
	<portlet:resourceURL id="addinfo" var="addinfoURL">
</portlet:resourceURL>


<portlet:actionURL name="dispatchRequest" var="topublishURL">
	<portlet:param name="destination" value="publish" />
</portlet:actionURL>

<portlet:actionURL name="dispatchRequest" var="toAdminHomeURL">
	<portlet:param name="destination" value="toAdminHome" />
</portlet:actionURL>




<portlet:defineObjects />
	<portlet:resourceURL id="uploadImage" var="uploadImageURL">
</portlet:resourceURL>
<portlet:defineObjects />
	<portlet:resourceURL id="delImage" var="delImageURL">
</portlet:resourceURL>

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
<link rel="Stylesheet" href="<%=basePath %>css/uploadify.css" /> 
<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-ui-1.8.17.custom.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery.uploadify.min.js"></script>

<script >
function submitinfo(){
	if(!main_image_upload){
		alert('please commit main image');
		return;
	}
	
	$.post("${addinfoURL}",
		  {
			title:$('#title').val(),
			location :$('#location').val(),
			startTime:$('#starttime').val(),
			endTime:$('#endtime').val(),
			targetedaudience:$('#targetedaudience').val(),
			description:$('#description').val(),
			mainimage:$('#mainimage').val(),
			image:$('#result_image').val(),
			video:$('#uploadify').val()+$('#qq1').val()
		  },
		  function(data,status){
			  if('success' == status && data.result==1){
				  window.location.href="${toAdminHomeURL }";
			  }else{
				  alert("fail to add");
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
	<div class="login-title text-center">
		<h3>
		<font>Add Event </font>	
		</h3>
	</div>
	<form  id="myform" action="doUpload.jsp" method="post" enctype="multipart/form-data" >
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
					 			<input id="title" type="text" />
							</td>
						</tr>
						<tr>
							<td class="tdt">Event Location
							</td>
						</tr>
						<tr>
							<td class="tdp">
					 			<textarea id="location" rows="3" cols="" style="margin:0;padding:0;width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="tdt">Start Time</td>
						</tr>
						<tr>
							<td class="tdp">
								<input id="starttime"  type="text" />
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
/* $(function(){
showTimePanel("starttime");
}); */
</script>
							</td>
						</tr>
						<tr>
							<td class="tdt">End Time
							</td>
						</tr>
						<tr>
							<td class="tdp">
								<input id="endtime" name="endtime" type="text" />
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
							
							</td>
						</tr>
						<tr>
							<td class="tdt">Targeted Audience
							</td>
						</tr>
						<tr>
							<td class="tdp">
								<textarea  id="targetedaudience" rows="3" cols="" style="margin:0;padding:0;width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="tdt">Description
							</td>
						</tr>
						<tr>
							<td  class="tdp">
								<textarea id="description" rows="3" cols="" style="margin:0;padding:0;width:100%;"></textarea>
							</td>
						</tr>
						<tr>
							<td class="tdt">mainImage
							</td>
						</tr>
						<tr>
							 <td  class="tdp">

								<!-- <input id='mainfile' name="file" type="file" size="20" /> -->
								
								<div  style='display:inline-block;width:150px;float:left;'>
								  <div class='' style='float: left;'>
								    <a style='display: inline-block;position: relative;overflow: hidden;' href='javascript:void(0);' >
								      <span>Add Images</span>
								      <input id='fileid' type='file' name='file' class='ipt-bg' />
								    </a>
								    <a style='display: inline-block;position: relative;overflow: hidden;' href='javascript:void(0);' >
								      <span id='main_image' onclick='ajaxFileUpload_main("fileid");'>Update</span>
								    </a>
								  </div>
								  <div id='viewid' ></div>
								</div>
								<input id="mainimage" value="" type="text" style='display:none;'/>

							</td>   
						</tr>
						<tr>
							<td class="tdt">Image
							</td>
						</tr>
						<tr>
							 <td  class="tdp">
							 	<!-- <span id="result"></span> -->
								<input id="img_add" type="button" value="Add Images" />
								<input id="img_upload" type="button" value="Upload" style='display:none;'/>
								<div id="img_view" style='width:100%;'></div>
								<img id="loading" src="<%=basePath %>/js/img/loading.gif" style="display:none;width:20px;">
								<!-- <input name="file" type="file1" size="20" accept=".jpg"> -->
								<input id="result_image" value="" type="text" style='display:none;'/>
							</td>   
						</tr>
						<tr>
							<td><a >UploadTencentVid</a>
							<input id="qq1" type="text" />
								</td>
						</tr>
			<tr>
						<td> 
					     <div id="fileQueue"></div>
       <input type="file" name="uploadify" id="uploadify" />
       <input type="hidden" name="hiloadify" id="hiloadify" />
     <p>
      <a href="javascript:$('#uploadify').uploadify('upload','*')">Upload</a>| 
      <a href="javascript:$('#uploadify').uploadify('cancel','*')">Cancel</a>
    </p>
						
						</td> 
						<tr>			
						
						
					</table>
					</div>
					<button type="button" class="btn btn-sm btn-info" onclick="submitinfo()" >add
					</button>
				</div>
			</div>
		</form>
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
                auto: false,
                multi: true,
                onUploadSuccess:function(file,data,response){
           eval("data=" + data);
           var src_result = data.src;
            $('#uploadify').val($('#uploadify').val()+src_result+";");
             console.log('src_result : '+$('#uploadify').val());
             alert($('#uploadify').val());
          
                }
            },'json');
            
        });  
    </script>

   
<script>


var main_image_upload = false;
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
	       		$('#main_image').html('Submit successfully');
	       		 main_image_upload = true;
	       		// $('#result_image').val($('#result_image').val()+src_result+";");
	       		// console.log('src_result : '+$('#result_image').val());
	       		// return data.src;
	       		 // $('#result').append('上传图片成功!请复制图片地址<br/>'+data.src+'</br>');
	       		 // $('#result_img').attr('src',"${pageContext.request.contextPath}"+data.src);
	       		 // $('#result_img').show();
	       	 } else {
	       		 // $('#result').html('上传图片失败'+data.msg);
	       		 // return 'error';
	       	 }
	       	 /* alert(status+" | "+data.status);       //data是从服务器返回来的值     
	            $('#result').html('上传图片成功!请复制图片地址<br/>'+data.src);   */
        },
        error: function (data, status, e)             //相当于java中catch语句块的用法  
        {
            $('#result').html('Failure to upload iamges!');  
        }  
      });
}

// $('#starttime').datepicker();


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
	       	 if(data.status==1){
	       		 var src_result = data.src;
	       		$('#result_image').val($('#result_image').val()+src_result+";");
	       		 console.log('src_result : '+$('#result_image').val());
	       		$('#'+uploadFileId).attr('result_src', src_result);
	       		// return data.src;
	       		 // $('#result').append('上传图片成功!请复制图片地址<br/>'+data.src+'</br>');
	       		 // $('#result_img').attr('src',"${pageContext.request.contextPath}"+data.src);
	       		 // $('#result_img').show();
	       	 } else {
	       		 // $('#result').html('上传图片失败'+data.msg);
	       		 // return 'error';
	       	 }
	       	 /* alert(status+" | "+data.status);       //data是从服务器返回来的值     
	            $('#result').html('上传图片成功!请复制图片地址<br/>'+data.src);   */
        },
        error: function (data, status, e)             //相当于java中catch语句块的用法  
        {
            $('#result').html('Failure to upload iamges!');  
        }  
      });
}


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
	      "<span>Upload images</span>" +
	      "<input id='" + fileid + "' type='file' name='file' class='ipt-bg' />" +
	    "</a>" +
	  "</div>" +
	  "<div id='" + xdelid + "' class='drt'>" +
	    "<a class='btn-pic btn-pic-bg' href='javascript:void(0)'>" +
	      "<span id='" + delid + "'>Delete</span>" +
	      "<input type='button'  class='ipt-bg'/>" +
	    "</a>" +
	  "</div>" +
	  "<div id='" + viewid + "' ></div>";
	"</div>" +
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
	    $.post("${delImageURL}"+new Date(),
	  		  {
	  			imgFile:src
	  		  },
	  		  function(data,status){
	  			  
	  		  },"json");
	  });
	  $("#" + fileid).click();
});

// 上传图片
$('#img_upload').bind('click', function(){
	var errors = $("#img_view span[class='spanc']");
	if(errors.length>0){
		return;
	}
	var files = $("#img_view").children();
	
	for(var i=0; i<files.length; i++){
		var v = files[i];
		var file = $(v).find('input[type="file"]')[0];
		var display_none = $(v).find('[style="display:none;"]'); // 已经删除的
		var display_block = $(v).find('[style="display:block;"]'); // 没有删除的
		if(display_none.length>0){
			console.log('删除选择'+file.id);
		} else {
			console.log('未删除选项'+file.id);
			ajaxFileUpload(file.id);
		}
	}
});
document.getElementById('portal_normal_dockbar').style="display:block";
$('#portal_normal_dockbar').attr('style','display:block');
</script>
</body>
</html>