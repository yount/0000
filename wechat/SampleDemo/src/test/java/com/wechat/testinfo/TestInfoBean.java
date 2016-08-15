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
		infobean.setContent("abcd");
		infobean.setCreateId("1111");
		infobean.setImageURL("/local/image");
		infobean.setStatus("0");
		infobean.setTitle("mmm");
		infobean.setUuid("666666");

		
		assertEquals("abcd",infobean.getContent());
		assertEquals("1111",infobean.getCreateId());
		assertEquals("/local/image",infobean.getImageURL());
		assertEquals("0",infobean.getStatus());
		assertEquals("mmm",infobean.getTitle());
		assertEquals("666666",infobean.getUuid());
	}

}
