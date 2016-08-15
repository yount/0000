package com.wechat.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Logger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.wechat.po.SNSUserInfo;
import com.wechat.po.WeixinOauth2Token;
import com.wechat.utils.AdvancedUtil;
import com.wechat.utils.Util;


public class OAuthServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response){

		Properties prop=Util.getUrlProperties();

		String urlAndPort=prop.getProperty("url").trim()+":"+prop.getProperty("port").trim();
		Logger log = Logger.getLogger("log");
		try {
			request.setCharacterEncoding("gb2312");
			response.setCharacterEncoding("gb2312");
		} catch (UnsupportedEncodingException e1) {
			log.log(null, "context", e1);
		}
		String openId=null;
		//用户同意授权后才能获取到code
		String code = request.getParameter("code");
		if(!"authdeny".equals(code)){
			//获取网页授权access_token
			WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken("wx69235a4f4bfbb277","cef58090596a3e0d272e66044b6ecaf4",code);
			
			String accessToken = weixinOauth2Token.getAccessToken();
			openId = weixinOauth2Token.getOpenId();
//			if(null!=openId){
//				request.getSession().setAttribute("openId", openId);
//			}
//			if(openId==null){
//				openId = (String) request.getSession().getAttribute("openId");
//			}
			Connection conn = null;
			ResultSet rs = null;
			PreparedStatement ps = null;
			String sql = "select * from User_ where openid = ?";  
			try {
				conn = DataAccess.getConnection();
				ps = conn.prepareStatement(sql); 
				ps.setString(1, openId);
				//根据openId查询用户是否存在
//						System.out.println(sql);
				rs = ps.executeQuery();
//						System.out.println(rs.getRow());
				if(rs.next()){
					//TODO：修改登录状态？
					System.out.println(rs.getRow());
					long userId = rs.getLong("userId");
					User u = UserLocalServiceUtil.getUserById(userId);
					String email = u.getEmailAddress();
					String password = u.getPassword();
					//跳转到index.jsp 
//					http://localhost:8080/c/portal/login?parameterAutoLoginLogin=bruce.banner&parameterAutoLoginPassword=green
					try {
						System.out.println(urlAndPort+"/c/portal/login?parameterAutoLoginLogin=");
						response.sendRedirect(urlAndPort+"/c/portal/login?parameterAutoLoginLogin="+email+"&parameterAutoLoginPassword="+password);
					} catch (IOException e) {
						log.log(null, "context", e);
					}
//					request.getRequestDispatcher("/c/portal/login?parameterAutoLoginLogin="+email+"&parameterAutoLoginPassword="+password).forward(request, response);
				}else{
					response.setContentType("text/html;charset=utf-8");
					SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken,openId);//获取用户信息
					request.setAttribute("snsUserInfo", snsUserInfo);
					request.setAttribute("code",code);
					request.setAttribute("accessToken",accessToken);
					request.setAttribute("openId",openId);
					
					Cookie cookie = new Cookie("openId",openId);
//					cookie.setSecure(true);
//					cookie.setSecure(true);
					cookie.setPath("/");
					cookie.setMaxAge(1000*60);
					response.addCookie(cookie);
					
					
					try {
//						String new_url = "http://121.43.175.85:8888?openId="+openId;
//						String html = "<script type='text/javascript'>function send(){var date=new Date(); date.setTime(date.getTime()+120*1000); document.cookie='openId="+openId+"; path=/; expires=+'date.toGMTString();window.location.href='"+new_url+"';}</script>";
//						response.getWriter().println(html);
//						html = "<script type='text/javascript'>function send2(){window.location.href='"+new_url+"';}</script>";
//						response.getWriter().println(html);
//						html = "<script type='text/javascript'>function send3(){document.cookie='openId="+openId+"';window.location.href='"+new_url+"';}</script>";
//						response.getWriter().println(html);
//						
//						html = "<script type='text/javascript'>function send4(){document.cookie='openId="+openId+";path=/';window.location.href='"+new_url+"';}</script>";
//						response.getWriter().println(html);
//						
//						response.getWriter().println("<input type='button' style='width:40px;height:30px;' onclick='send1();return false;'>跳转1</input><br/>");
//						response.getWriter().println("<input type='button' style='width:40px;height:30px;' onclick='send2();return false;'>跳转2</input><br/>");
//						response.getWriter().println("<input type='button' style='width:40px;height:30px;' onclick='send3();return false;'>跳转2</input><br/>");
//						response.getWriter().println("<input type='button' style='width:40px;height:30px;' onclick='send4();return false;'>跳转2</input><br/>");
						System.out.println(urlAndPort+"?openId="+openId);
						response.sendRedirect(urlAndPort+"?openId="+openId);
					} catch (IOException e) {
						log.log(null, "context", e);
					}
//					response.sendRedirect("http://localhost:8097");
				}
			} catch (Exception e) {
				log.log(null, "context", e);
			}finally{
				if(ps!=null){
					try{
						ps.close();
					}catch(Exception e){
						log.log(null,"content",e);
					}
				}
				if(rs!=null){
					try{
						rs.close();
					}catch(Exception e){
						log.log(null,"content",e);
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {
						log.log(null, "context", e);
					}
				}
			}
		}
	}
}
