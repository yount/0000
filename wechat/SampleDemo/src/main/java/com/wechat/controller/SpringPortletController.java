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
import com.liferay.portal.model.User;
import com.liferay.portal.util.PortalUtil;
import com.wechat.info.EventInfoBean;
import com.wechat.info.InfoDao;

/*
 * This class defines the first page which will be showed in Portlet.
 */

@Controller("homePage")
@RequestMapping(value="VIEW")
public class SpringPortletController {

	@RenderMapping
	public ModelAndView view(RenderRequest request, RenderResponse response)
			throws NestableException{
		
		User user = PortalUtil.getUser(request);
		if(null == user){
			return new ModelAndView("register");
		}else {
			ModelMap model = new ModelMap();
			List<EventInfoBean> infos = InfoDao.getInfos("",user.getUserId());
			model.addAttribute("infos", infos);
			return new ModelAndView("info",model);
		}
		
		
	}
}