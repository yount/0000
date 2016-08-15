package com.wechat.utils;

import net.sf.json.JSONObject;

import org.easymock.EasyMock;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.easymock.PowerMock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

import com.wechat.po.SNSUserInfo;
import com.wechat.po.WeixinOauth2Token;


@RunWith(PowerMockRunner.class)
@PrepareForTest({CommonUtil.class})
public class AdvancedUtilTest {
	private  AdvancedUtil anvancedUtil=new AdvancedUtil();
	private String requestUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	@Before 
	public void setUp(){
		//Assert.assertNotNull(anvancedUtil);
		
	}	
	@Test
	public void testGetOauth2AccessToken(){
		
		
		WeixinOauth2Token weiTokenExpect=new WeixinOauth2Token();
    	weiTokenExpect.setAccessToken("aaa");
    	weiTokenExpect.setExperesIn(111);
    	weiTokenExpect.setOpenId("bbb");
   		weiTokenExpect.setRefreshToken("ccc");
   		weiTokenExpect.setScope("ddd");
   		
		JSONObject json = new JSONObject();
		json.put("access_token","aaa");
		json.put("expires_in",111);
		json.put("openid","bbb");
		json.put("refresh_token","ccc");
		json.put("scope","ddd");

		PowerMock.mockStatic(CommonUtil.class);
    	EasyMock.expect(CommonUtil.httpsRequest(requestUrl,"GET",null)).andStubReturn(json);
    	PowerMock.replay(CommonUtil.class);
	
		WeixinOauth2Token weiToken=new WeixinOauth2Token();
		weiToken=anvancedUtil.getOauth2AccessToken("APPID", "SECRET", "CODE");	
		Assert.assertEquals(weiTokenExpect.getAccessToken(), weiToken.getAccessToken());
		Assert.assertEquals(weiTokenExpect.getOpenId(), weiToken.getOpenId());
		Assert.assertEquals(weiTokenExpect.getExperesIn(), weiToken.getExperesIn());
		Assert.assertEquals(weiTokenExpect.getRefreshToken(), weiToken.getRefreshToken());
		Assert.assertEquals(weiTokenExpect.getScope(), weiToken.getScope());
	}
	@Test
	public void testGetOauth2AccessException(){ 		
		JSONObject json = new JSONObject();
		json.put("error_access_token","aaa");
		json.put("error_expires_in",111);
		json.put("error_openid","bbb");
		json.put("error_refresh_token","ccc");
		json.put("error_scope","ddd");

		PowerMock.mockStatic(CommonUtil.class);
    	EasyMock.expect(CommonUtil.httpsRequest(requestUrl,"GET",null)).andStubReturn(json);
    	PowerMock.replay(CommonUtil.class);
    	
		WeixinOauth2Token weiToken=anvancedUtil.getOauth2AccessToken("APPID", "SECRET", "CODE");
		Assert.assertNull(weiToken);
	}
	@Test
	public void testGetSNSUserInfo(){
		String requestSNSUrl = "https://api.weixin.qq.com/sns/"
				+ "userinfo?access_token=ACCESS_TOKEN&openid=OPENID";
		SNSUserInfo expectSNSUerInfo=new SNSUserInfo();
		expectSNSUerInfo.setNickname("bbb");
		expectSNSUerInfo.setOpenId("aaa");
		
		JSONObject json = new JSONObject();
		json.put("openid","aaa");
		json.put("nickName","bbb");
		
		//snsUserInfo.setOpenId(jsonObject.getString("openid"));
		//snsUserInfo.setNickname(jsonObject.getString("nickName"));
		
		PowerMock.mockStatic(CommonUtil.class);
		EasyMock.expect(CommonUtil.httpsRequest(requestSNSUrl, "GET", null)).andReturn(json);
		PowerMock.replay(CommonUtil.class);
		
		SNSUserInfo snsUserInfo=anvancedUtil.getSNSUserInfo("ACCESS_TOKEN", "OPENID");
		Assert.assertEquals(expectSNSUerInfo.getNickname(), snsUserInfo.getNickname());
		Assert.assertEquals(expectSNSUerInfo.getOpenId(), snsUserInfo.getOpenId());
	}
	@Test
	public void testGetSNSUserInfoException(){
		String requestSNSUrl = "https://api.weixin.qq.com/sns/"
				+ "userinfo?access_token=ACCESS_TOKEN&openid=OPENID";
		SNSUserInfo expectSNSUerInfo=new SNSUserInfo();
		expectSNSUerInfo.setNickname("bbb");
		expectSNSUerInfo.setOpenId("aaa");
		
		JSONObject json = new JSONObject();
		json.put("errorOpenid","aaa");
		json.put("errorNickName","bbb");
		
		//snsUserInfo.setOpenId(jsonObject.getString("openid"));
		//snsUserInfo.setNickname(jsonObject.getString("nickName"));
		
		PowerMock.mockStatic(CommonUtil.class);
		EasyMock.expect(CommonUtil.httpsRequest(requestSNSUrl, "GET", null)).andReturn(json);
		PowerMock.replay(CommonUtil.class);
		SNSUserInfo snsUserInfo=anvancedUtil.getSNSUserInfo("ACCESS_TOKEN", "OPENID");
		Assert.assertNull(snsUserInfo);

		
	}
	
}
