<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>

<portlet:actionURL name="dispatchRequest" var="addInfoURL">
	<portlet:param name="destination" value="addInfo" />
</portlet:actionURL>


<portlet:actionURL name="dispatchRequest" var="editInfoURL">
	<portlet:param name="destination" value="editInfo" />
</portlet:actionURL>

<portlet:actionURL name="dispatchRequest" var="toInfoDetailUrl">
	<portlet:param name="destination" value="toAdminInfoDetail" />
</portlet:actionURL>

<portlet:actionURL name="dispatchRequest" var="toPasswordURL">
	<portlet:param name="destination" value="toPasswordPage" />
</portlet:actionURL>



<portlet:defineObjects />
	<portlet:resourceURL id="showImage" var="showImageURL">
</portlet:resourceURL>

<portlet:defineObjects />
	<portlet:resourceURL id="changeInfoStatus" var="changeInfoStatusURL">
</portlet:resourceURL>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
String path = request.getContextPath();
String serverPortPath=request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()+"/";
String basePath = request.getScheme() + "://"
		+ request.getServerName() + ":" + request.getServerPort()
		+ path + "/";
%>
<title>Insert title here</title>
<style>
	table_t{
		text-align: center;
		vertical-align: middle;
	}
</style>
<script type="text/javascript">
	window.onload=function(){
		document.getElementById('portal_normal_dockbar').style="display:block";
		$('#portal_normal_dockbar').attr('style','display:block');
	};
	function toResetPassword(){
		window.location.href="${toPasswordURL}";
	}
	function changeStatus(id, infoStatus){
		$('#'+id+'_status').attr("onclick","");
		$.post("${changeInfoStatusURL }",
				  {
					infoUUID:id,
					infoStatus:infoStatus
				  },
				  function(data,status){
				    if(data.result==1){
				    	var msg = data.msg;
				    	if(msg.infoStatus==1){
				    		$('#'+id+'_status').val('Cancel');
				    	} else {
				    		$('#'+id+'_status').val('Release');
				    	}
				    	$('#'+id+'_status').attr("onclick","changeStatus('"+id+"', '"+msg.infoStatus+"')");
				    } else {
				    	$('#'+id+'_status').attr("onclick","changeStatus('"+id+"', '"+infoStatus+"')");
				    }
				  },"json");
	};
	
</script>

</head>
<body>
	<a href="${addInfoURL }">
		<input type="button" id="" value="add event" style="width:100px;" class="button" />
	</a>
	<div>
		<input type="hidden" value="<%=serverPortPath%>">
	</div>
	<table class="table">
	    <caption>
	    	<!-- <span style='font-weight:bold; font-size:20px;'>Events</span> -->
	    </caption>
	    <thead> 
	        <tr> 
	        	<th style="width: 7%;"></th>
	            <th style="width: 25%; text-align: center; vertical-align: middle;">Event Title</th>
	           <!--  <th style="width: 10%;">Location</th>  -->
	            <!-- <th style="width: 10%;">Target Audience</th> -->
	            <th style="width: 15%; text-align: center; vertical-align: middle;">Start Time</th>
	            <th style="width: 15%; text-align: center; vertical-align: middle;">End Time</th>
	            <th style="width: 9%;">Creator</th>
	            <th style="width: 15%; text-align: center; vertical-align: middle;">Create Time</th>
	            <th style="width: 5%;">Number</th>
	            <th style="width: 9%; text-align: center; vertical-align: middle;">Status</th>
	            <!-- <th style="width: 9%;"></th> -->
	        </tr> 
	    </thead> 
	    <tbody>
	    	<c:forEach items="${infos}" varStatus="i" var="info" >
	    	<tr id="${info.info.uuid }" style="">
	    		<td style="width:100%;padding:1px;vertical-align:middle; vertical-align:middle;padding-top:5px;padding-bottom:5px;" >
					<img alt="Failed to get the picture" src="${showImageURL}&imgFile=${info.info.mainImageURL}" class="image"/>
				</td>
	    		<td><a href="${toInfoDetailUrl }&infoUUID=${info.info.uuid}">${info.info.title}</a></td>
	    		<%-- <td>${info.info.location}</td> --%>
	    		<%-- <td>${info.info.audience}</td> --%>
	    		<td><fmt:formatDate value="${info.info.startTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    		<td><fmt:formatDate value="${info.info.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    		<td>${info.info.createUserName}</td>
	    		<td><fmt:formatDate value="${info.info.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    		<td style="text-align: center;">${info.number}</td>
	    		<td style="text-align: center;">
	    			<c:choose>
	    				<c:when test="${info.info.status == 0 }">
                            <input type="button" id="${info.info.uuid}_status" style="width:80%;" value="Release" class="button" onclick="changeStatus('${info.info.uuid}', '${info.info.status}');">
                        </c:when>  
                        <c:otherwise>  
                            <input type="button" id="${info.info.uuid}_status" style="width:80%;" value="Cancel" class="button" onclick="changeStatus('${info.info.uuid}', '${info.info.status}');">
                        </c:otherwise>  
                    </c:choose>
	    			
	    		</td>
	    		<%-- 
	    		<td style="text-align: center;">
	    			<a href="${editInfoURL }&uuid=${info.info.uuid}">
	    				<input type="button" id="${info.info.uuid}_edit" style="width:80%;" value="Edit" class="button" onclick="">
	    			</a>
	    		</td>
	    		 --%>
	    	</tr>
	    	</c:forEach>
	        <tr> 
	        </tr> 
	        <tr> 
	        </tr> 
	    </tbody> 
	</table>

<script>
	document.getElementById('portal_normal_dockbar').style="display:block";
	$('#portal_normal_dockbar').attr('style','display:block');
</script>
</body>
</html>
