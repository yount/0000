package com.wechat.controller;


import java.util.List;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.exception.NestableException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.wechat.info.EventInfoBean;
import com.wechat.info.InfoBean;
import com.wechat.info.InfoDao;

/*
 * This class Returns demanded JSP Page.
 */

@Controller("FeedPageController")
@RequestMapping("VIEW")
public class FeedPageController {

//	@RenderMapping(params = "destination=register")
//	public ModelAndView register(RenderRequest request, RenderResponse response)
//			throws NestableException {
//		ModelMap model = new ModelMap();
//		// long empId = ParamUtil.getLong(request, "empId");
//		String empId = ParamUtil.getString(request, "empId");
//		String password = ParamUtil.getString(request, "password").trim();
//		String emailAddress = ParamUtil.getString(request, "email").trim();
//		String openId = ParamUtil.getString(request, "openId").trim();
//		// User user = UserLocalServiceUtil.getUser(empId);
//		User user = UserLocalServiceUtil.getUserByEmailAddress(20155, emailAddress);
////		if(openId==null){
////			openId="-null-";
////		}else if("".equals(openId)) {
////			openId = "|空字符|";
////		}
//		
//		// System.out.println("openId="+openId);
//		
//		if(openId==null || "".equals(openId)){
//			// 界面没有传openId，到登录界面
//			return new ModelAndView("login");
//			// return new ModelAndView("status/error");
//		}
//		if(user.getOpenId()!=null && !"".equals(user.getOpenId())){
//			// 已经绑定过openId，则跳转到登录界面
//			 return new ModelAndView("login");
//			//return new ModelAndView("status/error");
//		}
//		
//		if(user.getScreenName()==null || "".equals(user.getScreenName()) || user.getScreenName().length()<=5){
//			model.addAttribute("msg", "system error");
//			return new ModelAndView("register", model);
//		}
//		
//		if(!empId.equalsIgnoreCase(user.getScreenName().substring(5)) || !emailAddress.equalsIgnoreCase(user.getEmailAddress())){
//			// ScreenName中获取到的数据不为空，且数据格式为"empIdxxxxxx"
//			// empId，emailAddress和数据库中的不一致，返回激活界面
//			model.addAttribute("msg", "email or empId error");
//			return new ModelAndView("register", model);
//			
//		}
//		// user.setPassword(password);
//		user.setOpenId(openId);
//		UserLocalServiceUtil.updateUser(user);
//		// UserLocalServiceUtil.updatePasswordReset(userId, false);
//		// UserLocalServiceUtil.updatePassword(userId, password, password,false);
//		// UserLocalServiceUtil.updateOpenId(userId, openId);
//		model.addAttribute("user", user);
//		return new ModelAndView("status/success", model);
//		
//		//判断该用户的empId查找到的用户是否为空
////		if(user!=null && emailAddress.equals(user.getEmailAddress())
////				&& userId==user.getUserId()){
////			// 如果已经注册
////			if(user.getOpenId()!=null || !"".endsWith(user.getOpenId())){
////                model.addAttribute("errorInfo","Sorry!! You has registered");
////                return new ModelAndView("status/error", model);
////            }
////			//用户的邮箱不为空并且和页面上获取的相同
////			if (user.getEmailAddress()!= null && user.getEmailAddress()
////					.equals(emailAddress) && user.getUserId()==userId) {
////				UserLocalServiceUtil.updatePasswordReset(userId, false);
////				UserLocalServiceUtil.updatePassword(userId, password, password,false);
////				//if(user.getOpenId()==null||"".equals(user.getOpenId())){
////				if(openId != null && !"".equals(openId)){
////					UserLocalServiceUtil.updateOpenId(userId, openId);
////				}
////				//}
////				//model.addAttribute("successInfo", "register successfully");
////				return new ModelAndView("status/success", model);
////			}else{
////				//输出信息邮箱信息错误
////				model.addAttribute("errorInfo","Sorry!! Your emailAddress is wrong");
////				return new ModelAndView("status/error", model);
////			}
////			
////		}else{
////			//用户为空直接显示错误用户不存在
////			model.addAttribute("errorInfo", "Sorry! This user is not exist");
////			return new ModelAndView("status/error", model);
////		}
//	}
	
	@RenderMapping(params = "destination=toLogin")
	public ModelAndView toLogin(RenderRequest request, RenderResponse response)
			throws NestableException {
		ModelMap model = new ModelMap();
		User user = PortalUtil.getUser(request);
		model.addAttribute("user", user);
		return new ModelAndView("login",model);
	}

	@RenderMapping(params = "destination=toInfo")
	public ModelAndView toInfo(RenderRequest request, RenderResponse response)
			throws NestableException {
		ModelMap model = new ModelMap();
		User user = PortalUtil.getUser(request);
		
		model.addAttribute("user", user);
		if(user!=null){
//			List<InfoBean> infos = new ArrayList<InfoBean>();
//			InfoBean info = new InfoBean();
//			
//			info.setUuid("111111111111111");
//			info.setCreateUuid("22222222222222");
//			info.setCreateDate(new Date());
//			info.setEndDate(new Date());
//			info.setTitle("title");
//			info.setContent("---content---");
//			info.setImageURL("/images/img_001.jpg");
//			info.setStatus("1");
//			
//			infos.add(info);
			List<EventInfoBean> infos = InfoDao.getInfos("",user.getUserId());
			model.addAttribute("infos", infos);
			return new ModelAndView("info",model);
		} else {
			model.addAttribute("jump",true);
			return new ModelAndView("register",model);
		}
	}
	
	@RenderMapping(params = "destination=toInfoDetail")
	public ModelAndView toInfoDetail(RenderRequest request, RenderResponse response)
			throws NestableException {
		ModelMap model = new ModelMap();
		
		User user = PortalUtil.getUser(request);
		String infoUUID = ParamUtil.getString(request, "infoUUID");
		// InfoBean info = InfoDao.getInfoDetail(infoUUID);
		System.out.println("infoUUID="+infoUUID);
		List<EventInfoBean> infos = InfoDao.getInfos(" and uuid = '"+infoUUID + "' ", user.getUserId());
		// System.out.println("infos.size()="+infos.size());
		if(infos.size()>0){
			model.addAttribute("info", infos.get(0));
		}
		return new ModelAndView("info/infoDetail",model);
	}
	
	@RenderMapping(params = "destination=addInfo")
	public ModelAndView addInfo(RenderRequest request, RenderResponse response)
			throws NestableException {
		ModelMap model = new ModelMap();
		
		return new ModelAndView("info/addInfo",model);
	}
	
	
	
	
	
	
	
}
