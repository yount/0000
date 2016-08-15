package com.wechat.controller;

import static org.junit.Assert.assertEquals;
import static org.easymock.EasyMock.*; 

import java.util.ArrayList;
import java.util.List;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.easymock.EasyMock;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.easymock.PowerMock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.mock.web.portlet.MockRenderRequest;
import org.springframework.mock.web.portlet.MockRenderResponse;
import org.springframework.ui.ModelMap;
import org.springframework.web.portlet.ModelAndView;

import com.liferay.portal.kernel.exception.NestableException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.wechat.controller.SpringPortletController;
import com.wechat.info.EventInfoBean;
import com.wechat.info.InfoDao;



@RunWith(PowerMockRunner.class)
@PrepareForTest({ParamUtil.class,UserLocalServiceUtil.class,PortalUtil.class,InfoDao.class})
public class SpringPortletControllerTest {
	private RenderRequest request;
	private RenderResponse response;  
    private SpringPortletController feedpageController;
    @Before  
    public void setUp(){  
    	feedpageController = new SpringPortletController();
    	request = new MockRenderRequest();        
    	response = new MockRenderResponse();  
    }  
    @Test  
    public void testRegister() throws NestableException{
    	User user = createMock(User.class); 
    	PowerMock.mockStatic(PortalUtil.class);
    	EasyMock.expect(PortalUtil.getUser(request)).andReturn(null);
    	ModelAndView m = feedpageController.view(request, response);
    	ModelAndView exceptMAV =  new ModelAndView("register");
   	assertEquals(m.getViewName(),exceptMAV.getViewName());
    
}
    @Test  
    public void testinfo() throws NestableException{
    	
    	List<EventInfoBean> infos = new ArrayList<EventInfoBean>();
    	User user = createMock(User.class); 
    	PowerMock.mockStatic(PortalUtil.class);
    	EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
    	
    	
    	EasyMock.expect(user.getUserId()).andReturn((long)0);
    	PowerMock.replay(PortalUtil.class);
    	PowerMock.mockStatic(InfoDao.class);
    	EasyMock.expect(InfoDao.getInfos("",0)).andReturn(infos);
		PowerMock.replay(InfoDao.class);
		EasyMock.replay(user);
		
    	
    	ModelMap model = new ModelMap();
    	model.addAttribute("infos", infos);
    	ModelAndView m = feedpageController.view(request, response);
    	assertEquals(m.getViewName(),"info");
		assertEquals(m.getModelMap().toString(),model.toString());
    
}
}