package com.wechat.testinfo;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;

import com.wechat.info.InfoListen;

public class TestInfoListen {
	
	private InfoListen infolisten=new InfoListen();
	
	@Test
	public void test1(){
		infolisten.setContent("fff");
		assertEquals("fff",infolisten.getContent());
	}
	@Test
	public void test2(){
		infolisten.setUserId(3232);
		assertEquals(3232,infolisten.getUserId());
	}
	@Test
	public void test3(){
		infolisten.setOpenId("bbb");
		assertEquals("bbb",infolisten.getOpenId());
	}
	@Test
	public void test4() throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String sss="2016-08-18";
		Date date=sdf.parse(sss);
		infolisten.setStartTime(date);
		assertEquals("2016-08-18",sdf.format(infolisten.getStartTime()));
	}
	@Test
	public void test5(){
		infolisten.setTitle("vvv");
		assertEquals("vvv",infolisten.getTitle());
	}
	

}
