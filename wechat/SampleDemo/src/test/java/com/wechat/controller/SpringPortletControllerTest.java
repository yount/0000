package com.wechat.controller;

import static org.junit.Assert.assertEquals;
import static org.easymock.EasyMock.*; 

import java.util.ArrayList;
import java.util.List;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.servlet.http.HttpServletRequest;

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
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.wechat.controller.SpringPortletController;



@RunWith(PowerMockRunner.class)
@PrepareForTest({ParamUtil.class,UserLocalServiceUtil.class,PortalUtil.class,HttpServletRequest.class})
public class SpringPortletControllerTest {
	private RenderRequest request;
	private RenderResponse response;
    private SpringPortletController springPortletController;
    @Before  
    public void setUp(){  
    	springPortletController = new SpringPortletController();
    	request = new MockRenderRequest();        
    	response = new MockRenderResponse();  
    }  
    @Test  
    public void testRegister() throws NestableException{
    	User user = createMock(User.class); 
    	PowerMock.mockStatic(PortalUtil.class);
    	EasyMock.expect(PortalUtil.getUser(request)).andReturn(null);
    	ModelAndView m = springPortletController.CheckHomePage(request, response);
    	ModelAndView exceptMAV =  new ModelAndView("register");
   	assertEquals(m.getViewName(),exceptMAV.getViewName());
    
    }
    @Test  
    public void testNotLoginView() throws NestableException{
    	
    	PowerMock.mockStatic(PortalUtil.class);
    	EasyMock.expect(PortalUtil.getUser(request)).andReturn(null);
    	PowerMock.replay(PortalUtil.class);
    	
    	ModelAndView expectReturn = new ModelAndView("register");
    	ModelAndView m = springPortletController.CheckHomePage(request, response);
    	
    	assertEquals(m.getViewName(),expectReturn.getViewName());
    }
    
    @Test
    public void testLoginInWeichat() throws NestableException{
    	
    	User user = EasyMock.createMock(User.class);
    	// HttpServletRequest req = new MockHttpServletRequest();
    	HttpServletRequest req = EasyMock.createMock(HttpServletRequest.class);
    	EasyMock.expect(req.getHeader("user-agent")).andReturn("--micromessenger--");
    	EasyMock.replay(req);
    	
    	PowerMock.mockStatic(PortalUtil.class);
    	EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
    	EasyMock.expect(PortalUtil.getHttpServletRequest(request)).andReturn(req);
    	PowerMock.replay(PortalUtil.class);
    	
    	ModelAndView expectReturn = new ModelAndView("info/home");
    	ModelAndView m = springPortletController.CheckHomePage(request, response);
    	assertEquals(m.getViewName(),expectReturn.getViewName());
    }
    
    @Test
    public void testLoginInPCAsAdmin() throws NestableException{
    	List<Role> roles = new ArrayList<Role>();
    	
    	Role role = EasyMock.createMock(Role.class);
    	EasyMock.expect(role.getRoleId()).andReturn((long) 20165);
    	EasyMock.expect(role.getRoleId()).andReturn((long) 20165);
    	EasyMock.replay(role);
    	
    	roles.add(role);
    	
    	User user = EasyMock.createMock(User.class);
    	EasyMock.expect(user.getRoles()).andReturn(roles);
    	EasyMock.replay(user);
    	
    	// HttpServletRequest req = new MockHttpServletRequest();
    	HttpServletRequest req = EasyMock.createMock(HttpServletRequest.class);
    	EasyMock.expect(req.getHeader("user-agent")).andReturn("----");
    	EasyMock.replay(req);
    	
    	PowerMock.mockStatic(PortalUtil.class);
    	EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
    	EasyMock.expect(PortalUtil.getHttpServletRequest(request)).andReturn(req);
    	PowerMock.replay(PortalUtil.class);
    	
    	ModelAndView expectReturn = new ModelAndView("admin/home",null);
    	ModelAndView m = springPortletController.CheckHomePage(request, response);
    	assertEquals(m.getViewName(),expectReturn.getViewName());
    }
    
    @Test
    public void testLoginInPCAsUser() throws NestableException {
    	List<Role> roles = new ArrayList<Role>();
    	
//    	Role role = EasyMock.createMock(Role.class);
//    	EasyMock.expect(role.getRoleId()).andReturn((long) 20162);
//    	EasyMock.replay(role);
//    	
//    	roles.add(role);
    	
    	User user = EasyMock.createMock(User.class);
    	EasyMock.expect(user.getRoles()).andReturn(roles);
    	EasyMock.replay(user);
    	
    	// HttpServletRequest req = new MockHttpServletRequest();
    	HttpServletRequest req = EasyMock.createMock(HttpServletRequest.class);
    	EasyMock.expect(req.getHeader("user-agent")).andReturn("----");
    	EasyMock.replay(req);
    	
    	PowerMock.mockStatic(PortalUtil.class);
    	EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
    	EasyMock.expect(PortalUtil.getHttpServletRequest(request)).andReturn(req);
    	PowerMock.replay(PortalUtil.class);
    	
    	ModelMap map = new ModelMap();
		map.addAttribute("errorInfo", "please login as admin");
    	ModelAndView expectReturn = new ModelAndView("status/error",map);
    	
    	ModelAndView m = springPortletController.CheckHomePage(request, response);
    	assertEquals(m.getViewName(),expectReturn.getViewName());
    	assertEquals(m.getModelMap().toString(),expectReturn.getModelMap().toString());
    }
}