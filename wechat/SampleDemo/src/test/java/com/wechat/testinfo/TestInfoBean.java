package com.wechat.testinfo;


import static org.junit.Assert.assertEquals;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

import com.wechat.info.InfoBean;

public class TestInfoBean {
	@Test
	public void testInfoBean(){
		InfoBean infobean=new InfoBean();
		Date date=new Date();
		infobean.setContent("abcd");
		infobean.setCreateId("1111");
		infobean.setImageURL("/local/image");
		infobean.setStatus("0");
		infobean.setTitle("mmm");
		infobean.setUuid("666666");
		infobean.setCreateDate(date);
		infobean.setStartTime(date);
		infobean.setAudience("aaa");
		infobean.setEndDate(date);
		infobean.setLocation("bbb");
		infobean.setMediaURL("ccc");

		
		assertEquals("abcd",infobean.getContent());
		assertEquals("1111",infobean.getCreateId());
		assertEquals("/local/image",infobean.getImageURL());
		assertEquals("ccc",infobean.getMediaURL());
		assertEquals("0",infobean.getStatus());
		assertEquals("mmm",infobean.getTitle());
		assertEquals("666666",infobean.getUuid());
		assertEquals(date,infobean.getCreateDate());
		assertEquals(date,infobean.getStartTime());
		assertEquals(date,infobean.getEndDate());
		assertEquals("aaa",infobean.getAudience());
		assertEquals("bbb",infobean.getLocation());
	}

}
