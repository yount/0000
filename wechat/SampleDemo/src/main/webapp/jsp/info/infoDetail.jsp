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
						<tr>
							<td  class="tdp" style="text-align: center;">
								<img alt="can not found image" src="<%=basePath%>/${info.info.imageURL}" style="width:80%;">
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
					</div>
				</div>
			</div>
		</form>
	
	
	
	
	
	
</body>
</html>