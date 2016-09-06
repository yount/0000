package com.wechat.controller;

import java.util.List;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.exception.NestableException;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.util.PortalUtil;
import com.wechat.info.EventInfoBean;
import com.wechat.info.InfoDao;

/**
 * This class defines the first page which will be showed in Portlet.
 */

@Controller("homePage")
@RequestMapping(value="VIEW")
public class SpringPortletController {

	@RenderMapping
	public ModelAndView CheckHomePage(RenderRequest request, RenderResponse response)
			throws NestableException{
		
		User user = PortalUtil.getUser(request);
		if(null == user){ // 未登录情况
			return new ModelAndView("register");
		}else { // 登录之后
			HttpServletRequest req = PortalUtil.getHttpServletRequest(request);
			String ua = req.getHeader("user-agent").toLowerCase();  
			if (ua.indexOf("micromessenger") > 0) {// 是微信浏览器
				return new ModelAndView("info/home");
			} else {
				// 判断角色，若是管理员，登录管理员界面，否则登录提示界面
				List<Role> roles = user.getRoles();
				boolean isAdministrator = false;
				for(Role role : roles){
					if(role.getRoleId()==20162 || role.getRoleId()==20165){
						isAdministrator = true;
						break;
					}
				}
				if(isAdministrator){
					ModelMap map = new ModelMap();
					List<EventInfoBean> infos = InfoDao.getAdminInfos("");
					map.addAttribute("infos", infos);
					return new ModelAndView("admin/home", map);
				} else {
					ModelMap map = new ModelMap();
					map.addAttribute("errorInfo", "please login as admin");
					return new ModelAndView("status/error", map);
				}
			}
			
		}	
	}
}
