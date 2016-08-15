package com.wechat.testinfo;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.wechat.info.InfoWithUserBean;

public class TestInfoWithUserBean {
	@Test
	public void testInfoWithUserBean(){
		InfoWithUserBean in=new InfoWithUserBean();
		in.setStatus(0);
		in.setUserId(1234);
		in.setUuid("43434");
		
		
		assertEquals(0,in.getStatus());
		assertEquals(1234,in.getUserId());
		assertEquals("43434",in.getUuid());
		
    }
	
	

}
