	package com.wechat.controller;

	import static org.junit.Assert.*;
import static org.easymock.EasyMock.*; 

	import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

	import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.servlet.http.HttpServletRequest;

	import org.easymock.EasyMock;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.easymock.PowerMock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

	import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.wechat.info.InfoDao;

	@RunWith(PowerMockRunner.class)
	@PrepareForTest({PortalUtil.class,DataAccess.class,ParamUtil.class,UserLocalServiceUtil.class})
	public class ResourceActionControllerTest {

		private ResourceActionController resourceAction = new ResourceActionController();
		
		private ResourceRequest request;
		private ResourceResponse response;
		 ;
		
		
		@Before
		public void before() throws ClassNotFoundException, SQLException{
			request = createMock(ResourceRequest.class);
			response = createMock(ResourceResponse.class);
			Class.forName("com.mysql.jdbc.Driver");
			
		}
		
		
		@Test
		public void testSetInfoStatus1() throws Exception {
			String infoUUID = "9f7b6d16-64db-4bd0-9a93-e33a01bdb527";
			String infoStatus = "1";
			long userId = 22101;
			
			String url="jdbc:mysql://10.2.1.191:3306/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";
			String username="root";
			String password="root";
			Connection mockConnection=DriverManager.getConnection(url,username,password);
			
			User user = createMock(User.class);
			EasyMock.expect(user.getUserId()).andReturn(userId);
			EasyMock.replay(user);
			
			
			PowerMock.mockStatic(PortalUtil.class);
			EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
			
			PowerMock.replay(PortalUtil.class); 
			PowerMock.mockStatic(ParamUtil.class);
			EasyMock.expect(ParamUtil.getString(request, "infoUUID")).andReturn(infoUUID);
			EasyMock.expect(ParamUtil.getString(request, "infoStatus")).andReturn(infoStatus);
			PowerMock.replay(ParamUtil.class); 
			
			PowerMock.mockStatic(DataAccess.class);
			EasyMock.expect(DataAccess.getConnection()).andReturn(mockConnection);
			PowerMock.replay(DataAccess.class); 
			
			File file = new File("f.txt");
			
			PrintWriter pw = new PrintWriter(file);
			EasyMock.expect(response.getWriter()).andReturn(pw);
			EasyMock.replay(response);
			
			resourceAction.setInfoStatus(request, response);
			
			assertTrue(file.exists());
		}

		
		
		@Test
		public void testSetInfoStatus2() throws Exception {
			String infoUUID = "f312e128-4c2a-4d99-8a0e-46ba6fc5484d";
			String infoStatus = "2";
			long userId = 22101;
			
			
			String url="jdbc:mysql://10.2.1.191:3306/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";
			String username="root";
			String password="root";
			Connection mockConnection=DriverManager.getConnection(url,username,password);
			
			User user = createMock(User.class);
			EasyMock.expect(user.getUserId()).andReturn(userId);
			EasyMock.replay(user);
			
			PowerMock.mockStatic(PortalUtil.class);
			EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
			PowerMock.replay(PortalUtil.class); 
			
			PowerMock.mockStatic(ParamUtil.class);
			EasyMock.expect(ParamUtil.getString(request, "infoUUID")).andReturn(infoUUID);
			EasyMock.expect(ParamUtil.getString(request, "infoStatus")).andReturn(infoStatus);
			PowerMock.replay(ParamUtil.class); 
			
			PowerMock.mockStatic(DataAccess.class);
			EasyMock.expect(DataAccess.getConnection()).andReturn(mockConnection);
			PowerMock.replay(DataAccess.class); 
			
			File file = new File("f.txt");
			
			PrintWriter pw = new PrintWriter(file);
			EasyMock.expect(response.getWriter()).andReturn(pw);
			EasyMock.replay(response);
			
			resourceAction.setInfoStatus(request, response);
			
			assertTrue(file.exists());
		}
		
		
		@Test
	    public void testactivate() throws PortalException, SystemException, IOException{
	    
		PowerMock.mockStatic(ParamUtil.class);
	  	EasyMock.expect(ParamUtil.getString(request, "empId")).andReturn("21401");
	   	EasyMock.expect(ParamUtil.getString(request, "password")).andReturn("654321");
	   	EasyMock.expect(ParamUtil.getString(request, "email")).andReturn("222@qq.com");
	    EasyMock.expect(ParamUtil.getString(request, "openId")).andReturn("");
	   	PowerMock.replay(ParamUtil.class); 
	   	
	    User user = createMock(User.class);
	    PowerMock.mockStatic(UserLocalServiceUtil.class);
	    EasyMock.expect(UserLocalServiceUtil.getUserByEmailAddress(20155, "222@qq.com")).andReturn(user);
	    PowerMock.replay(UserLocalServiceUtil.class);
	    EasyMock.replay(user);
	   
        File file = new File("f.txt");
		
		PrintWriter pw = new PrintWriter(file);
		EasyMock.expect(response.getWriter()).andReturn(pw);
		EasyMock.replay(response);
		resourceAction.activate(request,response);
		assertTrue(file.exists());
		
	    }
	    
		
		@Test
	    public void testactivate2() throws PortalException, SystemException, IOException{
	    
		PowerMock.mockStatic(ParamUtil.class);
	  	EasyMock.expect(ParamUtil.getString(request, "empId")).andReturn("21401");
	   	EasyMock.expect(ParamUtil.getString(request, "password")).andReturn("654321");
	   	EasyMock.expect(ParamUtil.getString(request, "email")).andReturn("222@qq.com");
	    EasyMock.expect(ParamUtil.getString(request, "openId")).andReturn("28629");
	   	PowerMock.replay(ParamUtil.class); 
	   	
	    User user = createMock(User.class);
	    EasyMock.expect(user.getOpenId()).andReturn("sss");
	    EasyMock.expect(user.getOpenId()).andReturn("sss");
	    PowerMock.mockStatic(UserLocalServiceUtil.class);
	    
	    EasyMock.expect(UserLocalServiceUtil.getUserByEmailAddress(20155, "222@qq.com")).andReturn(user);
	    PowerMock.replay(UserLocalServiceUtil.class);
	    EasyMock.replay(user);
	   
        File file = new File("f.txt");
		
		PrintWriter pw = new PrintWriter(file);
		EasyMock.expect(response.getWriter()).andReturn(pw);
		EasyMock.replay(response);
		resourceAction.activate(request,response);
		assertTrue(file.exists());
		
	    }
		
		@Test
	    public void testactivate3() throws PortalException, SystemException, IOException{
	    
		PowerMock.mockStatic(ParamUtil.class);
	  	EasyMock.expect(ParamUtil.getString(request, "empId")).andReturn("21401");
	   	EasyMock.expect(ParamUtil.getString(request, "password")).andReturn("654321");
	   	EasyMock.expect(ParamUtil.getString(request, "email")).andReturn("222@qq.com");
	    EasyMock.expect(ParamUtil.getString(request, "openId")).andReturn("28629");
	   	PowerMock.replay(ParamUtil.class); 
	   	
	    User user = createMock(User.class);
	    EasyMock.expect(user.getOpenId()).andReturn(null);
	    EasyMock.expect(user.getOpenId()).andReturn("sss");
	    EasyMock.expect(user.getScreenName()).andReturn("emid");
	    EasyMock.expect(user.getScreenName()).andReturn("emid");
	    EasyMock.expect(user.getScreenName()).andReturn("emid");
	    PowerMock.mockStatic(UserLocalServiceUtil.class);
	    
	    EasyMock.expect(UserLocalServiceUtil.getUserByEmailAddress(20155, "222@qq.com")).andReturn(user);
	    PowerMock.replay(UserLocalServiceUtil.class);
	    EasyMock.replay(user);
	    
	   
        File file = new File("f.txt");
		
		PrintWriter pw = new PrintWriter(file);
		EasyMock.expect(response.getWriter()).andReturn(pw);
		EasyMock.replay(response);
		resourceAction.activate(request,response);
		assertTrue(file.exists());
		
	    }
		
		@Test
	    public void testactivate4() throws PortalException, SystemException, IOException{
	    
		PowerMock.mockStatic(ParamUtil.class);
	  	EasyMock.expect(ParamUtil.getString(request, "empId")).andReturn("21401");
	   	EasyMock.expect(ParamUtil.getString(request, "password")).andReturn("654321");
	   	EasyMock.expect(ParamUtil.getString(request, "email")).andReturn("222@qq.com");
	    EasyMock.expect(ParamUtil.getString(request, "openId")).andReturn("28629");
	   	PowerMock.replay(ParamUtil.class); 
	   	
	    User user = createMock(User.class);
	    EasyMock.expect(user.getOpenId()).andReturn(null);
	    EasyMock.expect(user.getOpenId()).andReturn("sss");
	    EasyMock.expect(user.getScreenName()).andReturn("empid28250");
	    EasyMock.expect(user.getScreenName()).andReturn("empid28250");
	    EasyMock.expect(user.getScreenName()).andReturn("empid28250");
	    EasyMock.expect(user.getScreenName()).andReturn("empid28250");
	    EasyMock.expect(user.getEmailAddress()).andReturn("77@qq.com");
	    
	    PowerMock.mockStatic(UserLocalServiceUtil.class);
	    
	    EasyMock.expect(UserLocalServiceUtil.getUserByEmailAddress(20155, "222@qq.com")).andReturn(user);
	    PowerMock.replay(UserLocalServiceUtil.class);
	    EasyMock.replay(user);
	   
        File file = new File("f.txt");
		
		PrintWriter pw = new PrintWriter(file);
		EasyMock.expect(response.getWriter()).andReturn(pw);
		EasyMock.replay(response);
		resourceAction.activate(request,response);
		assertTrue(file.exists());
		
	    }
		
		@Test
	    public void testactivate5() throws PortalException, SystemException, IOException{
	    
		PowerMock.mockStatic(ParamUtil.class);
	  	EasyMock.expect(ParamUtil.getString(request, "empId")).andReturn("21401");
	   	EasyMock.expect(ParamUtil.getString(request, "password")).andReturn("654321");
	   	EasyMock.expect(ParamUtil.getString(request, "email")).andReturn("222@qq.com");
	    EasyMock.expect(ParamUtil.getString(request, "openId")).andReturn("28629");
	   	PowerMock.replay(ParamUtil.class); 
	   	
	   	User user = createMock(User.class);
	    EasyMock.expect(user.getOpenId()).andReturn(null);
	    
	    EasyMock.expect(user.getOpenId()).andReturn("sss");
	    EasyMock.expect(user.getScreenName()).andReturn("empid21401");
	    EasyMock.expect(user.getScreenName()).andReturn("empid21401");
	    EasyMock.expect(user.getScreenName()).andReturn("empid21401");
	    EasyMock.expect(user.getScreenName()).andReturn("empid21401");
	    EasyMock.expect(user.getEmailAddress()).andReturn("222@qq.com");
	    PowerMock.mockStatic(UserLocalServiceUtil.class);
	    EasyMock.expect(UserLocalServiceUtil.getUserByEmailAddress(20155, "222@qq.com")).andReturn(user);
	    user.setOpenId("28629");
	    EasyMock.expect(UserLocalServiceUtil.updateUser(user)).andReturn(null);
	    EasyMock.expect(user.getEmailAddress()).andReturn("222@qq.com");
	    EasyMock.expect(user.getPassword()).andReturn("654321");
	    PowerMock.replay(UserLocalServiceUtil.class);
	    EasyMock.replay(user);
	   
        File file = new File("f.txt");
		
		PrintWriter pw = new PrintWriter(file);
		EasyMock.expect(response.getWriter()).andReturn(pw);
		EasyMock.replay(response);
		resourceAction.activate(request,response);
		assertTrue(file.exists());
		
	    }
		
	}

