package com.wechat.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Logger;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.wechat.po.SNSUserInfo;
import com.wechat.po.WeixinOauth2Token;
import com.wechat.utils.AdvancedUtil;
import com.wechat.utils.CommonUtil;
import com.wechat.utils.Util;


public class OAuthServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
//	public final static String APPID = "wx69235a4f4bfbb277";
//	public final static String APPSECRET = "cef58090596a3e0d272e66044b6ecaf4";
	
	public final static String APPID = "wx29e52cd7861daba6";
	public final static String APPSECRET = "46c484e0faee213f079709cf9bed69d1";
	
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
		/**用户同意授权后才能获取到code**/
		String code = request.getParameter("code");
		if(!"authdeny".equals(code)){
			/**获取网页授权access_token**/
			WeixinOauth2Token weixinOauth2Token = AdvancedUtil.getOauth2AccessToken("wx29e52cd7861daba6","46c484e0faee213f079709cf9bed69d1",code);
			String accessToken = weixinOauth2Token.getAccessToken();
			openId = weixinOauth2Token.getOpenId();
			
			Connection conn = null;
			ResultSet rs = null;
			PreparedStatement ps = null;
			String sql = "select * from User_ where openid = ?";  
			try {
				conn = DataAccess.getConnection();
				ps = conn.prepareStatement(sql); 
				ps.setString(1, openId);
				/**根据openId查询用户是否存在*/
				rs = ps.executeQuery();
				if(rs.next()){
					/**TODO：修改登录状态？**/
//					System.out.println(rs.getRow());
					long userId = rs.getLong("userId");
					User u = UserLocalServiceUtil.getUserById(userId);
					String email = u.getEmailAddress();
					String password = u.getPassword();
					/**跳转到index.jsp **/
					/**http://localhost:8080/c/portal/login?parameterAutoLoginLogin=bruce.banner&parameterAutoLoginPassword=green**/
					try {
						System.out.println(urlAndPort+"/c/portal/login?parameterAutoLoginLogin=");
						response.sendRedirect(urlAndPort+"/c/portal/login?parameterAutoLoginLogin="+email+"&parameterAutoLoginPassword="+password+"&"+System.currentTimeMillis());
					} catch (IOException e) {
						log.log(null, "context", e);
					}
				}else{
					response.setContentType("text/html;charset=utf-8");
					SNSUserInfo snsUserInfo = AdvancedUtil.getSNSUserInfo(accessToken,openId);//获取用户信息
					request.setAttribute("snsUserInfo", snsUserInfo);
					request.setAttribute("code",code);
					request.setAttribute("accessToken",accessToken);
					request.setAttribute("openId",openId);
					
					Cookie cookie = new Cookie("openId",openId);

					cookie.setPath("/");
					cookie.setMaxAge(1000*60);
					response.addCookie(cookie);
					
					try {
//						System.out.println(urlAndPort+"?openId="+openId);
						response.sendRedirect(urlAndPort+"?openId="+openId+"&"+System.currentTimeMillis());
					} catch (IOException e) {
						log.log(null, "context", e);
					}
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
