package com.info.controller;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.ModelAndView;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.exception.NestableException;

@Controller("homePage")
@RequestMapping(value="VIEW")
public class SpringPortletController {

	@RenderMapping
	public ModelAndView view(RenderRequest request, RenderResponse response)
			throws NestableException{
		
		return new ModelAndView("info/setInfo");
		
	}
}