	package com.wechat.controller;

	import static org.junit.Assert.*;
import static org.easymock.EasyMock.*; 

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

	import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.easymock.EasyMock;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.easymock.PowerMock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.mock.web.MockHttpServletResponse;

import com.fileupload.WebFTPUtil;
import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.wechat.utils.SendMailUtil;
import com.wechat.utils.Util;

	@RunWith(PowerMockRunner.class)
	@PrepareForTest({PortalUtil.class,DataAccess.class,ParamUtil.class,UserLocalServiceUtil.class,Util.class,Pattern.class,ServletFileUpload.class,WebFTPUtil.class})
	public class ResourceActionControllerTest {

		private ResourceActionController resourceAction = new ResourceActionController();
		
		private ResourceRequest request;
		private ResourceResponse response;
		 
		private HttpServletRequest req;
		private HttpServletResponse res;
		
		
		@Before
		public void before() throws ClassNotFoundException, SQLException{
			request = createMock(ResourceRequest.class);
			response = createMock(ResourceResponse.class);
			req=createMock(HttpServletRequest.class);
			res=createMock(HttpServletResponse.class);
			
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
		
//		@Test
//		public void testUploadImage() throws Exception{
//			
//			Pattern reg=PowerMock.createMock(Pattern.class);
//			String fileName = "";
//			String filePath= "";
//			String path_ftp = filePath+"/"+fileName;
//			
//
//			FileItemIterator fii=createMock(FileItemIterator.class);
//			EasyMock.expect(fii.hasNext()).andReturn(true);
//			EasyMock.replay(fii);
//			
//            ServletFileUpload sfu = PowerMock.createMock(ServletFileUpload.class);
//			EasyMock.expect(sfu.getItemIterator(req)).andReturn(null);
//			EasyMock.replay(sfu);
//			
//			PowerMock.mockStatic(PortalUtil.class);
//			EasyMock.expect(PortalUtil.getHttpServletRequest(request)).andReturn(req);
//			EasyMock.expect(PortalUtil.getHttpServletResponse(response)).andReturn(res);
//	        PowerMock.replay(PortalUtil.class);
//	        
//	        PowerMock.mockStatic(ServletFileUpload.class);
//	        EasyMock.expect(ServletFileUpload.isMultipartContent(req)).andReturn(true);
//	        PowerMock.replay(ServletFileUpload.class);
//
//	        PowerMock.mockStatic(Pattern.class);
//	        EasyMock.expect(Pattern.compile("[.]jpg|png|jpeg|gif$")).andReturn(reg);
//	        PowerMock.replay(Pattern.class);
//	        
//	        PowerMock.mockStatic(WebFTPUtil.class);
//	        EasyMock.expect(WebFTPUtil.getFTPPath(path_ftp)).andReturn("aaa");
//	        EasyMock.expect( WebFTPUtil.getFileName(fileName)).andReturn("bbb");
//
//	        PowerMock.replay(WebFTPUtil.class);
//	        resourceAction.uploadImage(request, response);
//	        assertTrue(true);
//			
//		}
		@Test
		public void testSendMail() throws Exception{
			File file=new File("f.txt");
			PrintWriter pw=new PrintWriter(file);
			
			
			EasyMock.expect(response.getWriter()).andReturn(pw);
			EasyMock.replay(response);
			
			User user=createMock(User.class);
			EasyMock.expect(user.getUserId()).andReturn(123456L);
			EasyMock.expect(user.getFirstName()).andReturn("Perficient");
			EasyMock.expect(user.getLastName()).andReturn("Perficient");
			EasyMock.replay(user);
			
			PowerMock.mockStatic(PortalUtil.class);
			EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
			PowerMock.replay(PortalUtil.class);
			
			
			resourceAction.sendMail(request, response);
			assertTrue(file.exists());
			
		}
		
		@Test
		public void testSetInfoStatus0() throws Exception {
			String infoUUID = "123";
			String infoStatus = "0";
			long userId =332;
			
			
			
			String url="jdbc:mysql://10.2.1.191:3306/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";
			String username="root";
			String password="root";
			Connection mockConnection=DriverManager.getConnection(url,username,password);
			PreparedStatement ps;
			String sql = "delete from p_info_user where userId=332";
			ps = mockConnection.prepareStatement(sql);
			ps.execute();
			
			User user = createMock(User.class);
			PowerMock.mockStatic(PortalUtil.class);
			EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
			PowerMock.replay(PortalUtil.class); 
			EasyMock.expect(user.getUserId()).andReturn(userId);
			EasyMock.replay(user);
			
			
			
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
		
		@Test
		public void testaddinfo() throws PortalException, SystemException, ClassNotFoundException, SQLException, IOException, ParseException{
			long userId =22101;
			String status="1";
			String uuid=Util.getUUID();
			
			PowerMock.mockStatic(PortalUtil.class);
			PowerMock.mockStatic(ParamUtil.class);
			User user = createMock(User.class);
			EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
			PowerMock.replay(PortalUtil.class);
			
			EasyMock.expect(ParamUtil.getString(request, "title")).andReturn("nihao");
		   	EasyMock.expect(ParamUtil.getString(request, "location")).andReturn("hangzhou");
		   	EasyMock.expect(ParamUtil.getString(request, "startTime")).andReturn("09/20/2016 12:12:12");
		    EasyMock.expect(ParamUtil.getString(request, "endTime")).andReturn("09/20/2016 14:12:12");
		    EasyMock.expect(ParamUtil.getString(request, "targetedaudience")).andReturn("stephen");
		    EasyMock.expect(ParamUtil.getString(request, "description")).andReturn("tour in hangzhou");
		    EasyMock.expect(ParamUtil.getString(request, "mainimage")).andReturn("/images/img_001.jpg");
		    EasyMock.expect(ParamUtil.getString(request, "image")).andReturn("/images/img_002.jpg;/images/img_001.jpg");
		    EasyMock.expect(ParamUtil.getString(request, "video")).andReturn("55");
		    EasyMock.expect(user.getUserId()).andReturn(userId);
		    EasyMock.expect(ParamUtil.getString(request, "status")).andReturn(status);
		    
		    EasyMock.replay(user);
		    PowerMock.replay(ParamUtil.class);
		    
		    PowerMock.mockStatic(Util.class);
		    EasyMock.expect(Util.getUUID()).andReturn(uuid);
		    PowerMock.replay(Util.class);
		    
		    
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://10.2.1.191:3306/lportal?useUnicode=true&characterEncoding=UTF8&useFastDateParsing=false";
			String username="root";
			String password="root";
			Connection conn=DriverManager.getConnection(url, username, password);
			PreparedStatement ps;
			String sql = "delete from p_info where title='nihao'";
			ps = conn.prepareStatement(sql);
			ps.execute();
			
			PowerMock.mockStatic(DataAccess.class);
			EasyMock.expect(DataAccess.getConnection()).andReturn(conn);
			PowerMock.replay(DataAccess.class);
			
			File file = new File("f.txt");
			PrintWriter pw = new PrintWriter(file);
			EasyMock.expect(response.getWriter()).andReturn(pw);
			EasyMock.replay(response);
			
			resourceAction.addinfo(request, response);
			
			assertTrue(file.exists());
			
		}
		
		@Test
		public void testshowImage() throws Exception{
			
			String imgFile="img_001.jpg";
			PowerMock.mockStatic(ParamUtil.class);
			EasyMock.expect(ParamUtil.getString(request, "imgFile")).andReturn(imgFile);
			PowerMock.replay(ParamUtil.class);
			
			PowerMock.mockStatic(PortalUtil.class);
			response.setContentType("image/*"); 
			
			HttpServletResponse res = new MockHttpServletResponse();
			EasyMock.expect(PortalUtil.getHttpServletResponse(response)).andReturn(res);
			PowerMock.replay(PortalUtil.class);
				
			resourceAction.showImage(request, response);
		
		}
		
		@Test
	    public void testdelImage() throws Exception{
		PowerMock.mockStatic(ParamUtil.class);
	  	EasyMock.expect(ParamUtil.getString(request, "imgFile")).andReturn("t.txt");
	   	
	   	PowerMock.replay(ParamUtil.class); 
	   	
		assertTrue(resourceAction.delImage(request, response));
		
	    }
		
		@Test
	    public void testgetValue(){
			assertEquals(resourceAction.getValue("/t.txt"),"/t.txt");
		}
		
		@Test
		public void testshowinfo() throws PortalException, SystemException, ClassNotFoundException, SQLException, IOException, ParseException{
			long createId=20198;
			PowerMock.mockStatic(PortalUtil.class);
			User user = createMock(User.class);
			EasyMock.expect(PortalUtil.getUser(request)).andReturn(user);
			EasyMock.expect(user.getUserId()).andReturn(createId);
			EasyMock.replay(user);
			PowerMock.replay(PortalUtil.class);
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://10.2.1.191:3306/lportal?useUnicode=true&characterEncoding=UTF8&useFastDateParsing=false";
			String username="root";
			String password="root";
			Connection conn=DriverManager.getConnection(url, username, password);
			
			PowerMock.mockStatic(DataAccess.class);
			EasyMock.expect(DataAccess.getConnection()).andReturn(conn);
			PowerMock.replay(DataAccess.class);
			
			File file = new File("f.txt");
			PrintWriter pw = new PrintWriter(file);
			EasyMock.expect(response.getWriter()).andReturn(pw);
			EasyMock.replay(response);
			
			resourceAction.publish(request, response);
			
			assertTrue(file.exists());
		
		}
		
	}
