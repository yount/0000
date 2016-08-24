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
import com.liferay.portal.util.PortalUtil;
import com.wechat.info.EventInfoBean;
import com.wechat.info.InfoDao;

/**
 * This class Returns demanded JSP Page.
 */

@Controller("FeedPageController")
@RequestMapping("VIEW")
public class FeedPageController {

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
	
		List<EventInfoBean> infos = InfoDao.getInfos(" and uuid = '"+infoUUID + "' ", user.getUserId());
		
		if(!infos.isEmpty()){
			model.addAttribute("info", infos.get(0));
//			String multipleImages=infos.get(0).info.getImageURL();
//			System.out.println(multipleImages);
//			model.addAttribute("multipleImages",multipleImages);
		}
		return new ModelAndView("info/infoDetail",model);
	}
	
	@RenderMapping(params = "destination=addInfo")
	public ModelAndView addInfo(RenderRequest request, RenderResponse response)
			throws NestableException {
		ModelMap model = new ModelMap();
		
		return new ModelAndView("info/addInfo",model);
	}
	
	@RenderMapping(params = "destination=tohomepage")
	public ModelAndView tohomepage(RenderRequest request, RenderResponse response)
			throws NestableException {
	
        ModelMap model = new ModelMap();
		
		return new ModelAndView("home",model);
	
	}	
	
	
	
	
	
}
