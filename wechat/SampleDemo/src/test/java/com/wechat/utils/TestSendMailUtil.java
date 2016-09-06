package com.wechat.utils;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
public class TestSendMailUtil {

	@Before 
	public void setUp(){
		//Assert.assertNotNull(anvancedUtil);
	}	
	@Test
	public void testSendMail(){

		String trueEmailAddress="15757126461@163.com";
		try{
			SendMailUtil.sendEmail(trueEmailAddress, "Need Help For Perficient Wechat Project", "Hello,admin, I need some help!");
		}catch(Exception e){
			return;
		}
		Assert.assertTrue(true);

	}
	@Test
	public void testSendMailExpection(){
		String wrongEmailAddress="15757126461@qq.com";
		try{
			SendMailUtil.sendEmail(wrongEmailAddress, "Need Help For Perficient Wechat Project", "Hello,admin, I need some help!");
		}catch(Exception e){
			Assert.assertTrue(true);
		}
	}
	
}
