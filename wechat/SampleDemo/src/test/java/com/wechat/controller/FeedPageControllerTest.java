package com.wechat.controller;

import static org.easymock.EasyMock.*; 
import static org.junit.Assert.*;

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
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.wechat.controller.FeedPageController;
import com.wechat.info.EventInfoBean;
import com.wechat.info.InfoDao;


@RunWith(PowerMockRunner.class)
@PrepareForTest({ParamUtil.class,UserLocalServiceUtil.class,PortalUtil.class,InfoDao.class})
public class FeedPageControllerTest {
	private RenderRequest request;
	private RenderResponse response;  
    private FeedPageController feedpageController;
    @Before  
    public void setUp(){  
    	feedpageController = new FeedPageController();
    	request = new MockRenderRequest();        
    	response = new MockRenderResponse();  
    }  
    
////    @Test  
////    public void testRegister(){  
////    	try {	  	
////	    	PowerMock.mockStatic(ParamUtil.class);
////	    	EasyMock.expect(ParamUtil.getLong(request, "empId")).andReturn((long) 21401);
////	    	EasyMock.expect(ParamUtil.getString(request, "password")).andReturn("654321");
////	    	EasyMock.expect(ParamUtil.getString(request, "email")).andReturn("222@qq.com");
////	    	EasyMock.expect(ParamUtil.getString(request, "openId")).andReturn("1111111");
////	    	PowerMock.replay(ParamUtil.class); 
////	    	
////	    	User user = createMock(User.class); 
////	    	PowerMock.mockStatic(UserLocalServiceUtil.class);
////	    	EasyMock.expect(UserLocalServiceUtil.getUser(21401)).andReturn(user);
////	    	PowerMock.replay(UserLocalServiceUtil.class);
////	    	
////	    	EasyMock.expect(user.getEmailAddress()).andReturn(null);    	
////	    	EasyMock.replay(user);
////	    	
////        	ModelMap model = new ModelMap();
////        	model.addAttribute("errorInfo","Sorry!! Your emailAddress is wrong");
////        	ModelAndView exceptMAV =  new ModelAndView("status/error", model);
////        	
////        	ModelAndView m = feedpageController.register(request, response);
////			assertEquals(m.getViewName(),exceptMAV.getViewName());
////			assertEquals(m.getModelMap().toString(),exceptMAV.getModelMap().toString());
////		} catch (Exception e) {
////			e.printStackTrace();
////		}   
////    }  
//    
//    @Test  
//    public void testRegister(){  
//    	try {	  	
//	    	PowerMock.mockStatic(ParamUtil.class);
//	    	EasyMock.expect(ParamUtil.getLong(request, "empId")).andReturn((long) 21401);
//	    	EasyMock.expect(ParamUtil.getString(request, "password")).andReturn("654321");
//	    	EasyMock.expect(ParamUtil.getString(request, "email")).andReturn("222@qq.com");
//	    	EasyMock.expect(ParamUtil.getString(request, "openId")).andReturn("333");
//	    	PowerMock.replay(ParamUtil.class); 
//	    	
//	    	User user = createMock(User.class); 
//	    	PowerMock.mockStatic(UserLocalServiceUtil.class);
//	    	EasyMock.expect(UserLocalServiceUtil.getUser(21401)).andReturn(user);
//	    	PowerMock.replay(UserLocalServiceUtil.class);
//	    	 
//	    	EasyMock.expect(user.getOpenId()).andReturn("222"); 
//	    	EasyMock.expect(user.getOpenId()).andReturn("222"); 
//	    	EasyMock.expect(user.getUserId()).andReturn((long)44); 
//    	EasyMock.replay(user);
//    	
//	    	
//        	ModelMap model = new ModelMap();
//        	model.addAttribute("msg", "email or empId error");
//        	ModelAndView exceptMAV =  new ModelAndView("login");
//        	
//        	ModelAndView m = feedpageController.register(request, response);
//			assertEquals(m.getViewName(),exceptMAV.getViewName());
//			//assertEquals(m.getModelMap().toString(),exceptMAV.getModelMap().toString());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}   
//    }  
//    
//    @Test  
//    public void testRegisterone(){  
//    	try {	  	
//	    	PowerMock.mockStatic(ParamUtil.class);
//	    	EasyMock.expect(ParamUtil.getLong(request, "empId")).andReturn((long) 21401);
//	    	EasyMock.expect(ParamUtil.getString(request, "password")).andReturn("654321");
//	    	EasyMock.expect(ParamUtil.getString(request, "email")).andReturn("222@qq.com");
//	    	EasyMock.expect(ParamUtil.getString(request, "openId")).andReturn("333");
//	    	PowerMock.replay(ParamUtil.class); 
//	    	
//	    	User user = createMock(User.class); 
//	    	PowerMock.mockStatic(UserLocalServiceUtil.class);
//	    	EasyMock.expect(UserLocalServiceUtil.getUser(21401)).andReturn(user);
//	    	PowerMock.replay(UserLocalServiceUtil.class);
//	    	 
//	    	EasyMock.expect(user.getOpenId()).andReturn(null); 
//	    	EasyMock.expect(user.getOpenId()).andReturn("222"); 
//	    	EasyMock.expect(user.getUserId()).andReturn((long)44);
//	    	
//    	EasyMock.replay(user);
//	    	
//        	ModelMap model = new ModelMap();
//        	model.addAttribute("msg", "email or empId error");
//        	ModelAndView exceptMAV =  new ModelAndView("register");
//        	
//        	ModelAndView m = feedpageController.register(request, response);
//			assertEquals(m.getViewName(),exceptMAV.getViewName());
//			assertEquals(m.getModelMap().toString(),exceptMAV.getModelMap().toString());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}   
//    }  
//    
//    
//    
//    @Test  
//    public void testRegistertwo(){  
//    	try {	  	
//	    	PowerMock.mockStatic(ParamUtil.class);
//	    	EasyMock.expect(ParamUtil.getLong(request, "empId")).andReturn((long) 21401);
//	    	EasyMock.expect(ParamUtil.getString(request, "password")).andReturn("654321");
//	    	EasyMock.expect(ParamUtil.getString(request, "email")).andReturn("222@qq.com");
//	    	EasyMock.expect(ParamUtil.getString(request, "openId")).andReturn("333");
//	    	PowerMock.replay(ParamUtil.class); 
//	    	
//	    	User user = createMock(User.class); 
//	    	PowerMock.mockStatic(UserLocalServiceUtil.class);
//	    	EasyMock.expect(UserLocalServiceUtil.getUser(21401)).andReturn(user);
//	    	
//	    	 
//	    	EasyMock.expect(user.getOpenId()).andReturn("333"); 
//	    	
//	    	EasyMock.expect(user.getOpenId()).andReturn(""); 
//	    	EasyMock.expect(user.getUserId()).andReturn((long)21401);
//	    	EasyMock.expect(user.getEmailAddress()).andReturn("222@qq.com");
//	    	user.setOpenId("333");
//	    	
//	    	EasyMock.expect(UserLocalServiceUtil.updateUser(user)).andReturn(null);
//	    	
//	    	PowerMock.replay(UserLocalServiceUtil.class);
//    	EasyMock.replay(user);
//	    	
//        	ModelMap model = new ModelMap();
//        	model.addAttribute("user", user);
//        	ModelAndView exceptMAV =  new ModelAndView("status/success",model);
//        	
//        	ModelAndView m = feedpageController.register(request, response);
//			assertEquals(m.getViewName(),exceptMAV.getViewName());
//			assertEquals(m.getModelMap().toString(),exceptMAV.getModelMap().toString());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}   
//    } 
    
    
    
    
    
    
    
    
   @Test  
   public void testtologin() throws NestableException{  
	   
	   User user = createMock(User.class); 
	PowerMock.mockStatic(PortalUtil.class);
	EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
	    
	    PowerMock.replay(PortalUtil.class);
	   
	   
	   PowerMock.replay(InfoDao.class);

	ModelMap model = new ModelMap();
	model.addAttribute("user", user);
	
	ModelAndView m = feedpageController.toLogin(request, response);
	assertEquals(m.getViewName(),"login");
	assertEquals(m.getModelMap().toString(),model.toString());
	}   	
   
 
    @Test  
    public void testtoInfo() throws NestableException{  

    		List<EventInfoBean> infos = new ArrayList<EventInfoBean>();
    		User user = createMock(User.class); 
    		PowerMock.mockStatic(PortalUtil.class);
    		EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
 		   
    		
 		    PowerMock.replay(PortalUtil.class);
 		   PowerMock.mockStatic(InfoDao.class);
 		   EasyMock.expect(InfoDao.getInfos("",0)).andReturn(infos);
 		   PowerMock.replay(InfoDao.class);
	
        	ModelMap model = new ModelMap();
        	model.addAttribute("user", user);
        	model.addAttribute("infos", infos);
        	 System.out.print(user);
        	ModelAndView m = feedpageController.toInfo(request, response);
			assertEquals(m.getViewName(),"info");
			assertEquals(m.getModelMap().toString(),model.toString());
		}  
    
    @Test  
    public void testtoInfoone() throws NestableException{  
    		List<EventInfoBean> infos = new ArrayList<EventInfoBean>();
    		PowerMock.mockStatic(PortalUtil.class);
    		EasyMock.expect(PortalUtil.getUser(request)).andReturn(null);
        	ModelMap model = new ModelMap();
        	model.addAttribute("user", null);
        	model.addAttribute("jump",true);
        	ModelAndView m = feedpageController.toInfo(request, response);
			assertEquals(m.getViewName(),"register");
			assertEquals(m.getModelMap().toString(),model.toString());
		}  
    
    

    @Test
    public void testtoInfoDetail() throws NestableException{ 
    	
    	
		List<EventInfoBean> infos = new ArrayList<EventInfoBean>();
		
		User user = createMock(User.class); 
		
		PowerMock.mockStatic(PortalUtil.class);
		PowerMock.mockStatic(ParamUtil.class);
		EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
		EasyMock.expect(ParamUtil.getString(request, "infoUUID")).andReturn("sss");
		EasyMock.expect(user.getUserId()).andReturn((long)0);
		 PowerMock.mockStatic(InfoDao.class);
		EasyMock.expect(InfoDao.getInfos(" and uuid = '"+"sss" + "' ",0)).andReturn(infos);
		PowerMock.replay(InfoDao.class);
		PowerMock.replay(PortalUtil.class);
		 PowerMock.replay(ParamUtil.class);
		 
		ModelMap model = new ModelMap();
    
    	ModelAndView m = feedpageController.toInfoDetail(request, response);
		assertEquals(m.getViewName(),"info/infoDetail");
		//assertEquals(m.getModelMap().toString(),model.toString());
	}  

	
}