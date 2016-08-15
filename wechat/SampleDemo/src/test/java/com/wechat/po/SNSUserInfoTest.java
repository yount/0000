package com.wechat.po;

import static org.junit.Assert.*;

import org.junit.Test;

public class SNSUserInfoTest {

	private SNSUserInfo userInfo = new SNSUserInfo();;
	
	@Test
	public void testOpenId() {
		userInfo.setOpenId("aaa");
		assertEquals("aaa", userInfo.getOpenId());
	}
	
	@Test
	public void testNickname() {
		userInfo.setNickname("aaa");
		assertEquals("aaa", userInfo.getNickname());
	}

	@Test
	public void testSex() {
		userInfo.setSex(1);
		assertEquals(1, userInfo.getSex());
	}
	
	@Test
	public void testCountry() {
		userInfo.setCountry("aaa");
		assertEquals("aaa", userInfo.getCountry());
	}
	
	@Test
	public void testProvince() {
		userInfo.setProvince("aaa");
		assertEquals("aaa", userInfo.getProvince());
	}
	
	@Test
	public void testCity() {
		userInfo.setCity("aaa");
		assertEquals("aaa", userInfo.getCity());
	}
	
	@Test
	public void testHeadImgUrl() {
		userInfo.setHeadImgUrl("aaa");
		assertEquals("aaa", userInfo.getHeadImgUrl());
	}
	
	@Test
	public void testPrivilegeList() {
		userInfo.setPrivilegeList(null);
		assertEquals(null, userInfo.getPrivilegeList());
	}
	
}
