package com.wechat.testinfo;

import static org.junit.Assert.assertEquals;

import java.util.Date;

import org.junit.Test;

import com.wechat.info.InfoWithUserBean;

public class TestInfoWithUserBean {
	@Test
	public void testInfoWithUserBean(){
		InfoWithUserBean in=new InfoWithUserBean();
		Date date=new Date();
		in.setStatus(0);
		in.setUserId(1234);
		in.setUuid("43434");
		in.setRegisterTime(date);
		in.setStatus(1);
		in.setInfoId("aaaa");
		assertEquals(1,in.getStatus());
		assertEquals(1234,in.getUserId());
		assertEquals("43434",in.getUuid());
		assertEquals("aaaa",in.getInfoId());
		assertEquals(date,in.getRegisterTime());
		assertEquals(1,in.getStatus());
		
    }
	
	

}
