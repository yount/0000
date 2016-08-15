package com.wechat.po;

import static org.junit.Assert.*;

import org.junit.Test;

public class TokenTest {

	private Token token = new Token();
	
	
	@Test
	public void testAccessToken() {
		token.setAccessToken("accessToken");
		assertEquals("accessToken",token.getAccessToken());
	}

	
	@Test
	public void testExpiresIn() {
		token.setExpiresIn(1);
		assertEquals(1,token.getExpiresIn());
	}
	
	
}
