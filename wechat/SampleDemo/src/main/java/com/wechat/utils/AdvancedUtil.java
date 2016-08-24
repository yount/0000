package com.wechat.utils;

import java.util.logging.Logger;

import com.wechat.po.SNSUserInfo;
import com.wechat.po.WeixinOauth2Token;

import net.sf.json.JSONObject;

public class AdvancedUtil {
	  private AdvancedUtil (){
		  super();
	  }
	
	
	/** 获取网页授权凭证 @param appid @param appSecret @param code @return **/
	public static WeixinOauth2Token getOauth2AccessToken(String appid,String appSecret,String code){
		
		WeixinOauth2Token wat = null;
		Logger log=Logger.getLogger("log");
		String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
		requestUrl = requestUrl.replace("APPID", appid);
		requestUrl = requestUrl.replace("SECRET", appSecret);
		requestUrl = requestUrl.replace("CODE", code);
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl,"GET",null);
		if(null != jsonObject){
			try{
				wat = new WeixinOauth2Token();
				wat.setAccessToken(jsonObject.getString("access_token"));
				wat.setExperesIn(jsonObject.getInt("expires_in")); 
				wat.setOpenId(jsonObject.getString("openid"));
				wat.setRefreshToken(jsonObject.getString("refresh_token"));
				wat.setScope(jsonObject.getString("scope"));				
			} catch(Exception e){
				
				wat = null;
				log.log(null,"content",e);
			}
		}
		return wat;
	}
	
	public static SNSUserInfo getSNSUserInfo(String accessToken,String openId){
		
		SNSUserInfo snsUserInfo = null;
		Logger log=Logger.getLogger("log");
		/**拼接请求地址**/
		String requestUrl = "https://api.weixin.qq.com/sns/"
				+ "userinfo?access_token=ACCESS_TOKEN&openid=OPENID";
		requestUrl = requestUrl.replace("ACCESS_TOKEN",accessToken).replace("OPENID", openId);
		/**通过网页授权获取用户信息**/
		JSONObject jsonObject = CommonUtil.httpsRequest(requestUrl, "GET", null);
		if(null!=jsonObject){
			try{
				snsUserInfo = new SNSUserInfo();
				snsUserInfo.setOpenId(jsonObject.getString("openid"));
			
			}catch(Exception e){
				snsUserInfo = null;
				log.log(null,"content",e);
			}
		}
		return snsUserInfo;		
	}

	

}
