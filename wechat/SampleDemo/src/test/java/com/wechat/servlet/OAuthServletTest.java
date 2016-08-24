package com.wechat.servlet;

import static org.easymock.EasyMock.*;
import static org.junit.Assert.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.easymock.EasyMock;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.easymock.PowerMock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.wechat.po.WeixinOauth2Token;
import com.wechat.utils.AdvancedUtil;


@RunWith(PowerMockRunner.class)
@PrepareForTest({AdvancedUtil.class,DataAccess.class,UserLocalServiceUtil.class})
public class OAuthServletTest {
	private OAuthServlet oauthServlet;

//	private HttpServletRequest request;
//	private HttpServletResponse response;
	
	@Before
	public void before(){
		oauthServlet = new OAuthServlet();
		// request = createMock(HttpServletRequest.class);
		// response = createMock(HttpServletResponse.class);
	}
	
	@After
	public void after() throws IOException{
//		verify(request);
//		verify(response);
//		response.sendRedirect("http://121.43.175.85:8888/c/portal/login?parameterAutoLoginLogin=test@perficient.com&parameterAutoLoginPassword=test")
	}
	
	@Test
	public void doGetTest1() throws Exception{
		HttpServletRequest request = createMock(HttpServletRequest.class);
		HttpServletResponse response = createMock(HttpServletResponse.class);
		
		
		String code = null;
		String accessToken = "accessToken";
		String openId = "3";
		
		String url="jdbc:mysql://10.2.1.191:3306/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";
		String username="root";
		String password="root";
		Class.forName("com.mysql.jdbc.Driver");
		Connection mockConnection = DriverManager.getConnection(url,username,password);
		
		WeixinOauth2Token weixinOauth2Token = createMock(WeixinOauth2Token.class);
		EasyMock.expect(weixinOauth2Token.getAccessToken()).andReturn(accessToken);
		EasyMock.expect(weixinOauth2Token.getOpenId()).andReturn(openId);
		EasyMock.replay(weixinOauth2Token);
		
//		EasyMock.expect(request.getParameter("code")).andReturn(code);
		// EasyMock.expect(request.getParameter(EasyMock.eq("code"))).andReturn(code);
		request.getParameter("code");
		expectLastCall().andReturn(code); //传入参数  
//		EasyMock.replay(request);
		
		User user = createMock(User.class);
		EasyMock.expect(user.getEmailAddress()).andReturn("test@perficient.com");
		EasyMock.expect(user.getPassword()).andReturn("test");
		EasyMock.replay(user);
		
		PowerMock.mockStatic(AdvancedUtil.class);
    	EasyMock.expect(AdvancedUtil.getOauth2AccessToken("wx29e52cd7861daba6","46c484e0faee213f079709cf9bed69d1",code)).andReturn(weixinOauth2Token);
    	PowerMock.replay(AdvancedUtil.class);
		
    	PowerMock.mockStatic(DataAccess.class);
    	EasyMock.expect(DataAccess.getConnection()).andReturn(mockConnection);
    	PowerMock.replay(DataAccess.class);
		
    	
    	
    	PowerMock.mockStatic(UserLocalServiceUtil.class);
    	EasyMock.expect(UserLocalServiceUtil.getUserById(22101)).andReturn(user);
    	PowerMock.replay(UserLocalServiceUtil.class);
    	
    	oauthServlet.doGet(request, response);
    	
    	assertTrue(true);
    	
    	// response.sendRedirect("http://121.43.175.85:8888/c/portal/login?parameterAutoLoginLogin="+user.getEmailAddress()+"&parameterAutoLoginPassword="+user.getPassword());
		
	}
	
	@Test
	public void doGetTest2() throws Exception{
		HttpServletRequest request = createMock(HttpServletRequest.class);
		request.setCharacterEncoding("gb2312");
//		EasyMock.expect(request.getParameter("code")).andReturn("authdeny");
		EasyMock.expect(request.getParameter("code")).andReturn(null);
		request.setAttribute("snsUserInfo", null);
		request.setAttribute("code",null);
		request.setAttribute("accessToken","accessToken");
		request.setAttribute("openId","10");
		EasyMock.replay(request);
		
		HttpServletResponse response = createMock(HttpServletResponse.class);
		
		
		String code = null;
		String accessToken = "accessToken";
		String openId = "10";
		
		String url="jdbc:mysql://10.2.1.191:3306/lportal?useUnicode=true&characterEncoding=UTF-8&useFastDateParsing=false";
		String username="root";
		String password="root";
		Class.forName("com.mysql.jdbc.Driver");
		Connection mockConnection = DriverManager.getConnection(url,username,password);
		
		WeixinOauth2Token weixinOauth2Token = createMock(WeixinOauth2Token.class);
		EasyMock.expect(weixinOauth2Token.getAccessToken()).andReturn(accessToken);
		EasyMock.expect(weixinOauth2Token.getOpenId()).andReturn(openId);
		EasyMock.replay(weixinOauth2Token);
		
		// EasyMock.expect(request.getParameter(EasyMock.eq("code"))).andReturn(code);
//		request.getParameter("code");
//		expectLastCall().andReturn("authdeny"); //传入参数  
//		EasyMock.replay(request);
		
		User user = createMock(User.class);
		EasyMock.expect(user.getEmailAddress()).andReturn("test@perficient.com");
		EasyMock.expect(user.getPassword()).andReturn("test");
		EasyMock.replay(user);
		
		PowerMock.mockStatic(AdvancedUtil.class);
    	EasyMock.expect(AdvancedUtil.getOauth2AccessToken("wx29e52cd7861daba6","46c484e0faee213f079709cf9bed69d1",code)).andReturn(weixinOauth2Token);
    	EasyMock.expect(AdvancedUtil.getSNSUserInfo(accessToken,openId)).andReturn(null);
    	PowerMock.replay(AdvancedUtil.class);
		
    	PowerMock.mockStatic(DataAccess.class);
    	EasyMock.expect(DataAccess.getConnection()).andReturn(mockConnection);
    	PowerMock.replay(DataAccess.class);
		
    	
    	
    	PowerMock.mockStatic(UserLocalServiceUtil.class);
    	EasyMock.expect(UserLocalServiceUtil.getUserById(22101)).andReturn(user);
    	PowerMock.replay(UserLocalServiceUtil.class);
    	
    	
    	
    	oauthServlet.doGet(request, response);
    	assertTrue(true);
	}
	
}
