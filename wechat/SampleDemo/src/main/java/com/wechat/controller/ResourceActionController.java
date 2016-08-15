package com.wechat.controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.wechat.utils.Util;

@Controller
@RequestMapping("VIEW")
public class ResourceActionController {
	Logger logger = Logger.getLogger(ResourceActionController.class.getName());
	
	@ResourceMapping(value="changeUserInfoStatus")
	@ResponseBody
	public void setInfoStatus(ResourceRequest request, ResourceResponse response){
		PrintWriter pw = null;
		JSONObject json = new JSONObject();
		
		try {
			User user = PortalUtil.getUser(request);
			pw = response.getWriter();
			JSONObject jsonObject = new JSONObject();
			
			String infoUUID = ParamUtil.getString(request, "infoUUID");
			String infoStatus = ParamUtil.getString(request, "infoStatus");
			
			Connection conn = DataAccess.getConnection();
			PreparedStatement ps = null;
			// 0-数据库中还没有数据
			// 1-数据库中有数据，是注册状态
			// 2-数据库中有数据，是取消状态
			if(infoStatus.equals("0")){
				// 数据库中没有这条信息
				String sql = "insert into p_info_user(uuid, userId, infoId, registerTime, status) values(?,?,?,?,?)";
				ps = conn.prepareStatement(sql);
				String uuid = Util.getUUID();
				ps.setString(1, uuid);
				ps.setLong(2, user.getUserId());
				ps.setString(3, infoUUID);
				ps.setString(4, Util.getTime());
				ps.setString(5, "1");
				
				ps.execute();
				jsonObject.put("infoStatus", "1");
				jsonObject.put("infoValue", " cancel ");
			} else {
				String status = null;
				if("1".equals(infoStatus)){
					status = "2";
					jsonObject.put("infoStatus", status);
					jsonObject.put("infoValue", "register");
				} else if("2".equals(infoStatus)){
					status = "1";
					jsonObject.put("infoStatus", status);
					jsonObject.put("infoValue", " cancel ");
				}
				String sql = "update p_info_user set status=? where infoId = ? and userId = ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, status);
				ps.setString(2, infoUUID);
				ps.setLong(3, user.getUserId());
				ps.executeUpdate();
			} 

			
			
			json.put("msg", jsonObject);
			json.put("result", 1);
			pw.println(json.toString());
			
			conn.close();
			pw.close();
			ps.close();
		} catch (Exception e) {
//			e.printStackTrace();
			logger.log(null, "context", e);
		}
	}
	
	
	@ResourceMapping(value="activate")
	@ResponseBody
	public void activate(ResourceRequest request, ResourceResponse response){
		PrintWriter pw = null;
		JSONObject json = new JSONObject();
		
		String empId = ParamUtil.getString(request, "empId");
		String password = ParamUtil.getString(request, "password").trim();
		String emailAddress = ParamUtil.getString(request, "email").trim();
		String openId = ParamUtil.getString(request, "openId").trim();
		
		JSONObject msgJson = new JSONObject();
		
		try {
			User user = UserLocalServiceUtil.getUserByEmailAddress(20155, emailAddress);
			pw = response.getWriter();
			
			if(openId==null || "".equals(openId)){
				// 界面没有传openId，到登录界面
				json.put("result", "0");
				msgJson.put("error", "Please go to login page");
				
				json.put("msg", msgJson);
				pw.println(json.toString());
				return ;
			}
			
			if(user.getOpenId()!=null && !"".equals(user.getOpenId())){
				// 已经绑定过openId，则跳转到登录界面
				json.put("result", "0");
				msgJson.put("error", "Please go to login page");
				
				json.put("msg", msgJson);
				pw.println(json.toString());
				return ;
			}
			
			if(user.getScreenName()==null || "".equals(user.getScreenName()) || user.getScreenName().length()<=5){
				json.put("result", "0");
				msgJson.put("error", "Employee ID error,please contact the administrator");
				
				json.put("msg", msgJson);
				pw.println(json.toString());
				return ;
			}
			
			if(!empId.equalsIgnoreCase(user.getScreenName().substring(5)) || !emailAddress.equalsIgnoreCase(user.getEmailAddress())){
				// ScreenName中获取到的数据不为空，且数据格式为"empIdxxxxxx"
				// empId，emailAddress和数据库中的不一致，返回激活界面
				json.put("result", "0");
				msgJson.put("error", "Please check your mailbox or employee ID");
				
				json.put("msg", msgJson);
				pw.println(json.toString());
				return ;
			}
			
			user.setOpenId(openId);
			UserLocalServiceUtil.updateUser(user);
			
			json.put("result", "1");
			msgJson.put("email", user.getEmailAddress());
			msgJson.put("password", user.getPassword());
			
			json.put("msg", msgJson);
			pw.println(json.toString());
			return ;
//			json.put("msg", msgJson);
//			pw.println(json.toString());
//			pw.flush();
//			pw.close();
		} catch (Exception e) {
//			e.printStackTrace();
			logger.log(null, "context", e);
		} finally{
			if(pw!=null){
				pw.flush();
				pw.close();
			}
		}
		
	}
	
	
}
