<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List,com.wechat.info.InfoBean
    ,com.liferay.portal.util.PortalUtil
    ,com.liferay.portal.model.User
    ,com.liferay.portal.model.Role
    "
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<portlet:defineObjects />
	<portlet:resourceURL id="changeUserInfoStatus" var="changeUserInfoStatusURL">
</portlet:resourceURL>

<portlet:actionURL name="dispatchRequest" var="infoDetailURL">
	<portlet:param name="destination" value="toInfoDetail" />
</portlet:actionURL>

<portlet:actionURL name="dispatchRequest" var="addInfoURL">
	<portlet:param name="destination" value="addInfo" />
</portlet:actionURL>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	
	User user = PortalUtil.getUser(request);
	List<Role> roles = user.getRoles();
	boolean isAdministrator = false;
	for(Role role : roles){
		if(role.getRoleId()==20162 || role.getRoleId()==20165){
			isAdministrator = true;
			break;
		}
	}
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
		    		$('#'+infoUUID+'_register').html('registered');
		    		$('#'+infoUUID+'_register').attr('color','#ff0000');
		    	} else {
		    		$('#'+infoUUID+'_register').html('unregistered');
		    		$('#'+infoUUID+'_register').attr('color','#f9f9f9');
		    	}
		    } else {
		    	$('#'+infoUUID).attr("onclick","changeStatus('"+infoUUID+"', '"+infoStatus+"')");
		    }
		  },"json");
	}
</script>
</head>
<body>
	
	
<%-- 	<%if(isAdministrator){%>
		<a href="${addInfoURL }">
			<input type="button" id="" value="add" style="width:100px;" class="button" />
		</a>
	<%} %> --%>
	
<%-- 	<%
		for(int i=0;i<3;i++){
	%> --%>
	<div class="login-title text-center">
		<h3>
		<font>Event List</font>
		</h3>
	</div>
	<c:forEach items="${infos}" varStatus="i" var="info" >
	<form action=""  method="post" id="myform"  >

		<%-- <input type="hidden" name="openId" id="openId" value="<%=openId %>"></input> --%>
		<div class="form-group">
			<div class="col-xs-12  ">
				<div class="input-group">
				<table class = "table">
				<tr>
					<td style="width:18%;padding:1px;vertical-align:middle; vertical-align:middle;padding-top:5px;padding-bottom:5px;" >
						<a href="${infoDetailURL }&infoUUID=${info.info.uuid}">
							<img alt="Failed to get the picture" src="<%=basePath%>/${info.info.imageURL}" class="image"/>
						</a>
					</td>
					<td  style="width:57%;padding:1px;vertical-align:middle; vertical-align:middle;padding-top:5px;padding-bottom:5px;">
						<a href="${infoDetailURL }&infoUUID=${info.info.uuid}">
							<c:choose>
		                        <c:when test="${info.info.title.length() <= 38 }">  
		                            ${info.info.title }
		                        </c:when>  
		                        <c:otherwise>  
		                            ${info.info.title.substring(0,36) }...
		                        </c:otherwise>  
		                    </c:choose>
							<%--  <%
								String mesge = "event name aaaa aaaaa aaaa aaaa aa aaa a aaa aa aaaaa aaa aaaa aaaa aaa";		
								mesge=mesge.substring(0, 30)+"...";
								out.print(mesge);
							%> --%>
						</a>
					</td>
					
					
					
					
					<td  style="width:25%;padding:1px;vertical-align:bottom;text-align:center;padding-top:10px;">
						<c:choose>  
                            <c:when test="${info.infoWithUser.status == 0 }">
                            
                                <input type="button" id="${info.info.uuid}" value="register" 
                                    class="button" onclick="changeStatus('${info.info.uuid}', '${info.infoWithUser.status}');">
                                <div style="margin-top:-25px;">
                                	<br><font size=1px; color="#f9f9f9" id="${info.info.uuid}_register"  style="">unregistered</font>
                                </div>
                            </c:when>
                            <c:when test="${info.infoWithUser.status == 1 }">
                                <input type="button" id="${info.info.uuid}" value="&nbsp;cancel&nbsp;"
                                    class="button" onclick="changeStatus('${info.info.uuid}', '${info.infoWithUser.status}');">
                                <div style="margin-top:-25px;">
                                    <br><font size=1px; color="#ff0000" id="${info.info.uuid}_register" style="">registered</font>
                                </div>
                            </c:when>
                            <c:when test="${info.infoWithUser.status == 2 }">
                                <input type="button" id="${info.info.uuid}" value="register" 
                                    class="button" onclick="changeStatus('${info.info.uuid}', '${info.infoWithUser.status}');">
                                <div style="margin-top:-25px;">
                                	<br><font size=1px; color="#f9f9f9" id="${info.info.uuid}_register"  style="">unregistered</font>
                            	</div>
                            </c:when>
                        </c:choose>
                        </td>
					<%-- <td  style="width:25%;padding:1px;vertical-align:middle;text-align:center;">
						<c:choose>  
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
	                    </c:choose>
					
					 <!-- <input type="button" id="button" value="register" class="button"> -->
					</td> --%>
				</tr>
				</table>
				</div>
			</div>
		</div>
	</form>
<%-- 		<%
		}%> --%>
	</c:forEach>
	
	
	
	
	
	
	
	
	

</body>
</html>