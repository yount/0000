package com.wechat.po;

import static org.junit.Assert.*;

import org.junit.Test;

public class WeixinOauth2TokenTest {

	private WeixinOauth2Token weixinOauth2Token = new WeixinOauth2Token();
	
	
	@Test
	public void testAccessToken() {
		weixinOauth2Token.setAccessToken("accessToken");
		assertEquals("accessToken", weixinOauth2Token.getAccessToken());
	}
	
	@Test
	public void testExperesIn() {
		weixinOauth2Token.setExperesIn(1);
		assertEquals(1, weixinOauth2Token.getExperesIn());
	}

	@Test
	public void testRefreshToken() {
		weixinOauth2Token.setRefreshToken("refreshToken");
		assertEquals("refreshToken", weixinOauth2Token.getRefreshToken());
	}
	
	@Test
	public void testOpenId() {
		weixinOauth2Token.setOpenId("openId");
		assertEquals("openId", weixinOauth2Token.getOpenId());
	}
	
	@Test
	public void testScope() {
		weixinOauth2Token.setScope("scope");
		assertEquals("scope", weixinOauth2Token.getScope());
	}
}
