package com.wechat.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import com.wechat.info.EventInfoBean;
import com.wechat.info.InfoDao;
import com.wechat.info.InfoWithUserBean;

@Controller("AdminFeedPageController")
@RequestMapping("VIEW")
public class AdminFeedPageController {

	@RenderMapping(params = "destination=toAdminHome")
	public ModelAndView toAdminHome(RenderRequest request, RenderResponse response)
			throws NestableException, ParseException {
		ModelMap map = new ModelMap();
		List<EventInfoBean> infos = InfoDao.getAdminInfos("");
		map.addAttribute("infos", infos);
		return new ModelAndView("admin/home", map);
	}
	
	@RenderMapping(params = "destination=toAdminInfoDetail")
	public ModelAndView toInfoDetail(RenderRequest request, RenderResponse response)
			throws NestableException, ParseException {
		ModelMap model = new ModelMap();
		String infoUUID = ParamUtil.getString(request, "infoUUID");
		List<EventInfoBean> infos = InfoDao.getAdminInfos(" and p.uuid = '"+infoUUID + "' ");
		/**infos.get(0).info.setMediaURL("k03219ac7dw");*/
		model.addAttribute("infos", infos.get(0));
		List<InfoWithUserBean> infoWithUsers= InfoDao.getUsersAndInfoUsers(infoUUID,"");
		model.addAttribute("infoWithUsers",infoWithUsers);
		
		
		return new ModelAndView("admin/infoDetail",model);
	}
	
	@RenderMapping(params = "destination=editInfo")
	public ModelAndView editInfo(RenderRequest request, RenderResponse response)
			throws NestableException, ParseException {
		ModelMap model = new ModelMap();
		String uuid = ParamUtil.getString(request, "uuid");
		List<EventInfoBean> infos = InfoDao.getAdminInfos(" and p.uuid = '"+uuid +"' ");
		model.put("infos", infos.get(0));
		return new ModelAndView("admin/editInfo", model);
	}
}
