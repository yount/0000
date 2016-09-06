package com.wechat.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.util.PortalUtil;
import com.sun.istack.logging.Logger;
import com.wechat.utils.Util;

@Controller
@RequestMapping("VIEW")
public class AdminResourceActionController {
	private Logger logger = Logger.getLogger(AdminResourceActionController.class);
	
	@ResourceMapping(value="changeInfoStatus")
	@ResponseBody
	public void setInfoStatus(ResourceRequest request, ResourceResponse response) throws IOException{
		PrintWriter pw = response.getWriter();
		JSONObject json = new JSONObject();
		String uuid = ParamUtil.getString(request, "infoUUID");
		String status = ParamUtil.getString(request, "infoStatus");
		// 0-未发布事件， 1-已发布事件
		if(uuid==null || status==null){
			json.put("result", 0);
			pw.println(json.toString());
			return;
		} else {
			uuid = uuid.trim();
			status = status.trim();
			String sql = "update p_info set status=? where uuid=?";
			if("0".equals(status)){
				status = "1";
			} else if("1".equals(status)) {
				status = "0";
			}
			Connection conn = null;
			PreparedStatement prep= null;
			int count = 0;
			try {
				conn = DataAccess.getConnection();
				prep = conn.prepareStatement(sql);
				prep.setString(1, status);
				prep.setString(2, uuid);
				count = prep.executeUpdate();
			} catch (SQLException e) {
				logger.info(e.getMessage());
			} finally {
				try {
					if(prep!=null){
						prep.close();
					}
					if(conn!=null){
						conn.close();
					}
				} catch (SQLException e) {
					logger.info(e.getMessage());
				}
			}
			if(count==0){
				json.put("result", 0);
				pw = response.getWriter();
				pw.println(json.toString());
				return;
			} 
			JSONObject msg = new JSONObject();
			msg.put("infoStatus", status);
			json.put("msg", msg);
			json.put("result", 1);
			pw.println(json.toString());
			pw.close();
		}
	}
	
	@ResourceMapping(value="updateinfo")
	@ResponseBody
	public void updateinfo(ResourceRequest request, ResourceResponse response) throws Exception{
		PrintWriter pw = null;
		JSONObject json = new JSONObject();
		User user = PortalUtil.getUser(request);
		
		String title = ParamUtil.getString(request, "title");
		String location = ParamUtil.getString(request, "location").trim();
		String start_time = ParamUtil.getString(request, "startTime").trim();
		Date testDate = new Date(start_time);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String startTime=format.format(testDate);
	
		
		String end_time = ParamUtil.getString(request, "endTime");
		Date te = new Date(end_time);
		SimpleDateFormat forma= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String endTime=forma.format(te);
		String targetedaudience = ParamUtil.getString(request, "targetedaudience").trim();
		String description = ParamUtil.getString(request, "description").trim();
		String mainimage= ParamUtil.getString(request, "mainimage").trim();
		String image= ParamUtil.getString(request, "image").trim();
		String uuid = ParamUtil.getString(request, "uuid").trim();
		String video = ParamUtil.getString(request, "video").trim();
		System.out.println("video : "+video);
		System.out.println("mainimage : "+mainimage);
		System.out.println("image : "+image);
		
		pw = response.getWriter();
		
		Connection conn = DataAccess.getConnection();
		PreparedStatement ps;
		// String sql = "insert into p_info(uuid, createId, startTime, endTime, title,content,target_audience,event_location,status,mainImageUrl,imageUrl) values(?,?,?,?,?,?,?,?,?,?,?)";
		String sql = "update p_info set createid=?, startTime=?, endTime=?, title=?, content=?, target_audience=?, event_location=?, status=?, mainImageUrl=?, imageUrl=?,mediaUrl=? where uuid = ?";
		ps = conn.prepareStatement(sql);
		ps.setLong(1, user.getUserId());
		ps.setString(2,startTime);
		ps.setString(3, endTime);
		ps.setString(4, title);
		ps.setString(5, description);
		ps.setString(6, targetedaudience);
		ps.setString(7, location);
		ps.setString(8, "0");
		ps.setString(9, mainimage);
		ps.setString(10, image);
		ps.setString(11, video);
		ps.setString(12, uuid);
		ps.execute();
		conn.close();
		ps.close();
		json.put("result", "1");
		pw.println(json.toString());
	}
}
