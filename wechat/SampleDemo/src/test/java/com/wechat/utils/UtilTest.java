package com.wechat.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
public class UtilTest {
	private final static SimpleDateFormat fromatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	@Test
	public void testGetUUID(){
		String uuid=Util.getUUID();
		System.out.println(uuid);
		Assert.assertNotNull(uuid);
	}
	@Test
	public void testGetTime(){
		String time=Util.getTime();
		System.out.println(time);
		Assert.assertNotNull(time);
	}
	@Test
	public void testGetTimeNow(){
		String timeNow=Util.getTime(new Date());
		System.out.println(timeNow);
		Assert.assertNotNull(timeNow);
	}
	@Test
	public void testGetUrlProperties(){
		Properties expectProp=new Properties();
		expectProp.setProperty("ip", "121.43.175.85");
		expectProp.setProperty("url", "http://121.43.175.85");
		expectProp.setProperty("port", "8888");
		Properties prop=Util.getUrlProperties();
		System.out.println(prop.getProperty("ip")+"&&"+prop.getProperty("url")+"&&"+prop.getProperty("port"));
		Assert.assertEquals(expectProp.getProperty("ip").toString(), prop.getProperty("ip").toString());
		Assert.assertEquals(expectProp.getProperty("url").toString(), prop.getProperty("url").toString());
		Assert.assertEquals(expectProp.getProperty("port").toString(), prop.getProperty("port").toString());
	}
//	@Test
//	public void testGetUrlPropertiesException(){
//		PowerMock.createMock(type);
//		Util util=new Util();
//		InputStream inputStream=null;
		
//		Properties prop=PowerMock.createMock(Properties.class);
//		PowerMock.createMock(Util.class);
//		EasyMock.expect(Util.class.getResourceAsStream("url.properties")).andReturn(inputStream);
		
//		util.getClass().getResourceAsStream("url.properties");
//		Util util=EasyMock.createMock(Util.class);
//		EasyMock.expect(prop.load(inputStream)).andReturn(null);
//		EasyMock.replay(util);
//		
//
//		PowerMock.replay(Util.class);
//		Properties propt=Util.getUrlProperties();
//		Assert.assertNull(propt);
//		
//		
//	}
}
