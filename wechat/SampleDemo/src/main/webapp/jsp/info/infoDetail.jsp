<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:actionURL name="dispatchRequest" var="toInfoURL">
	<portlet:param name="destination" value="toInfo" />
</portlet:actionURL>

<portlet:defineObjects />
	<portlet:resourceURL id="changeUserInfoStatus" var="changeUserInfoStatusURL">
</portlet:resourceURL>

<portlet:defineObjects />
	<portlet:resourceURL id="showImage" var="showImageURL">
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
</script>
</head>
<body>
<%-- 	<h1>infoDetail</h1>
	${info.uuid }<br/>
	${info.createId }<br/>
	${info.createDate }<br/>
	${info.endDate }<br/>
	${info.title }<br/>
	${info.content }<br/>
	<img alt="Failed to get the picture" src="<%=basePath%>/${info.imageURL }"/>
	<br/>
	${info.status }<br/>
	${info.startTime }<br/>
	${info.location }<br/>
	${info.audience }<br/> --%>
	
	<div class="login-title text-center">
		<h4>
		<font>${info.info.title }</font>	
		</h4>
	</div>
	<form action=""  method="post" id="myform"  >
			<div class="form-group">
				<div class="col-xs-12  ">
				 	<div class="input-group">
					<table class = "detailtable" width="100%">
						<tr>
							<td class="tdt">Event Location
							</td>
						</tr>
						<tr>
							<td class="tdp">
					 
							${info.info.location }
							</td>
						</tr>
						<tr>
							<td class="tdt">Start Time</td>
						</tr>
						<tr>
							<td class="tdp">
							${info.info.startTime }
							</td>
						</tr>
						<tr>
							<td class="tdt">End Time
							</td>
						</tr>
						<tr>
							<td class="tdp">
							${info.info.endDate }
							</td>
						</tr>
						<tr>
							<td class="tdt">Targeted Audience
							</td>
						</tr>
						<tr>
							<td class="tdp">
							${info.info.audience }
							</td>
						</tr>
						<tr>
							<td class="tdt">Description
							</td>
						</tr>
						<c:forEach items="${info.info.imageURL.split(\";\")}" varStatus="i" var="imageUrl" >
							<tr>
								<td  class="tdp" style="text-align: center;">
									<img alt="can not found image" src="${showImageURL}&imgFile=${imageUrl}" style="width:80%;">
								</td>
							</tr>
						</c:forEach>
						<tr >
							<td>
								<video width="100%"  controls="controls" style="text-align: center">
								  <source src="<%=basePath %>/${info.info.mediaURL}" type="video/mp4"  webkit-playsinline />
								  <source src="<%=basePath %>/${info.info.mediaURL}" type="video/ogg"  webkit-playsinline />
								  <source src="<%=basePath %>/${info.info.mediaURL}" type="video/webm"  webkit-playsinline />
								  <object data="<%=basePath %>/${info.info.mediaURL}" width="100%" >
								    <embed src="<%=basePath %>/${info.info.mediaURL}" width="100%" />
								  </object>			
								</video>
							</td>
						</tr>
						<tr>
						 	<td>
						 	    这是mp4格式
						 		<video width="100%" controls="controls" style="text-align: center">
								  
								  <source src="<%=basePath %>//media/video2.mp4" type="video/mp4"  webkit-playsinline />
								  <source src="<%=basePath %>//media/video2.mp4" type="video/ogg"  webkit-playsinline />
								  <source src="<%=basePath %>//media/video2.mp4" type="video/webm"  webkit-playsinline />
								  <object data="<%=basePath %>//media/video2.mp4" width="100%" >
								    <embed src="<%=basePath %>//media/video2.mp4" width="100%" />
								  </object>			
								</video>
						 	</td>
						 </tr>
						<tr>
						 	<td>
						 	    这是mov格式
						 		<video width="100%" controls="controls" style="text-align: center">
								 
								  <source src="<%=basePath %>//media/video7.mov" type="video/mp4"  webkit-playsinline />
								  <source src="<%=basePath %>//media/video7.mov" type="video/ogg"  webkit-playsinline />
								  <source src="<%=basePath %>//media/video7.mov" type="video/webm"  webkit-playsinline />
								  <object data="<%=basePath %>//media/video7.mov" width="100%" >
								    <embed src="<%=basePath %>//media/video7.mov" width="100%" />
								  </object>			
								</video>
						 	</td>
						 </tr>
						<tr>
							<td  class="tdp" style="text-align: center;">
								<!--  <embed wmode="window" flashvars="vid=k03219ac7dw&amp;duration=76&amp;cid=aqksvqexerm1yrf&amp;tpid=4&amp;showend=1&amp;showcfg=1&amp;searchbar=1&amp;shownext=1&amp;list=2&amp;autoplay=1&amp;ptag=www_baidu_com%7Cnew_vs_sports%3Aitem&amp;outhost=http%3A%2F%2Fv.qq.com%2Fcover%2Fa%2Faqksvqexerm1yrf.html%3Fvid%3Dk03219ac7dw&amp;refer=http%3A%2F%2Fv.qq.com%2F&amp;columnId=51784&amp;openbc=0&amp;fakefull=1&amp;title=0%E5%88%86%EF%BC%81%E4%BF%84%E7%BD%97%E6%96%AF%E8%B7%B3%E6%B0%B4%E5%8D%AB%E5%86%95%E5%86%A0%E5%86%9B%E8%B7%AA%E7%9D%80%E5%85%A5%E6%B0%B4%E5%B0%B4%E5%B0%AC%E5%87%BA%E5%B1%80" src="http://imgcache.qq.com/tencentvideo_v1/player/TencentPlayer.swf?max_age=86400&amp;v=20151010" quality="high" name="tenvideo_flash_player_1471417602749" id="tenvideo_flash_player_1471417602749" bgcolor="#000000" width="320px" height="240px" align="middle" allowscriptaccess="always" allowfullscreen="true" type="application/x-shockwave-flash" pluginspage="http://get.adobe.com/cn/flashplayer/" style="width: 320px; height: 240px;">
							   	-->
							   	<p style="text-align: center"><iframe class="video_iframe" style="z-index:1;" src="http://v.qq.com/iframe/player.html?vid=k03219ac7dw"  onload="Javascript:setHeight(this)" width="100%" height="auto" scrolling="auto" allowfullscreen="false" frameborder="0" ></iframe></p> 				
							</td>
						</tr>
						<tr>
							<td  class="tdp">
								${info.info.content }
							</td>
						</tr>
					</table>
					<div style="text-align:center;">
						<%-- <c:choose>  
	                        <c:when test="${info.infoWithUser.status == 0 }">
	                            <input type="button" id="${info.info.uuid}" value="register" style="width:100px;" 
	                            	class="button" onclick="changeStatus('${info.info.uuid}', '${info.infoWithUser.status}');">
	                        </c:when>
	                        <c:when test="${info.infoWithUser.status == 1 }">
	                            <input type="button" id="${info.info.uuid}" value="&nbsp;cancel&nbsp;" style="width:100px;" 
	                            	class="button" onclick="changeStatus('${info.info.uuid}', '${info.infoWithUser.status}');">
	                        </c:when>
	                        <c:when test="${info.infoWithUser.status == 2 }">
	                        	<input type="button" id="${info.info.uuid}" value="register" style="width:100px;" 
	                            	class="button" onclick="changeStatus('${info.info.uuid}', '${info.infoWithUser.status}');">
	                        </c:when>
	                    </c:choose> --%>
	                    <c:choose>  
                            <c:when test="${info.infoWithUser.status == 0 }">
                                <input type="button" id="${info.info.uuid}" value="register" 
                                    class="button" onclick="changeStatus('${info.info.uuid}', '${info.infoWithUser.status}');">
                                <div style="margin-top:-25px;">
                                	<br><font size=1px; color="#ff0000" id="${info.info.uuid}_register"  style="display:none;">you have registered this event.</font>
                                </div>
                            </c:when>
                            <c:when test="${info.infoWithUser.status == 1 }">
                                <input type="button" id="${info.info.uuid}" value="&nbsp;cancel&nbsp;"
                                    class="button" onclick="changeStatus('${info.info.uuid}', '${info.infoWithUser.status}');">
                                <div style="margin-top:-25px;">
                                    <br><font size=1px; color="#ff0000" id="${info.info.uuid}_register" style="">you have registered this event.</font>
                                </div>
                            </c:when>
                            <c:when test="${info.infoWithUser.status == 2 }">
                                <input type="button" id="${info.info.uuid}" value="register" 
                                    class="button" onclick="changeStatus('${info.info.uuid}', '${info.infoWithUser.status}');">
                                <div style="margin-top:-25px;">
                                	<br><font size=1px; color="#ff0000" id="${info.info.uuid}_register"  style="display:none;">you have registered this event.</font>
                            	</div>
                            </c:when>
                        </c:choose>
					</div>
					<div style="float:left">
	                   <a href="${toInfoURL }">
		                   <span class="glyphicon glyphicon-off" id="toInfo"></span> back
                       </a>
	                </div>		
					</div>
				</div>
			</div>
		</form>
	
	
	
	
	
	
</body>

<script type="text/javascript">
function setHeight() {
    var bodyWidth = document.body.clientWidth;
    for (var ilength = 0; ilength <= document.getElementsByTagName("iframe").length; ilength++) {
        document.getElementsByTagName("iframe")[ilength].height = bodyWidth * 4 / 16;//设定高度
    }
}
setHeight();/////////////
</script>
</script>

</html>