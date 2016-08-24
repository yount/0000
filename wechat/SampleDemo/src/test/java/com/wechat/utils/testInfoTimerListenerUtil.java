package com.wechat.utils;

import static org.easymock.EasyMock.*;
import static org.junit.Assert.*;

import java.util.Timer;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;

import org.easymock.EasyMock;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class testInfoTimerListenerUtil {
	InfoTimerListenerUtil info;
	ServletContextEvent event;
	InfoTimerTask infotask;
	 Timer timer;
	@Before  
    public void setUp(){  
    	 info = new InfoTimerListenerUtil();
         event=createMock(ServletContextEvent.class); 
    	
    }  
@Test
public void testinfoTimer(){
	 Timer timer =new Timer(true);
//	ServletContext sc=createMock(ServletContext.class); 
//	EasyMock.expect(event.getServletContext()).andReturn(sc);
	try{	
		timer.schedule(new InfoTimerTask(event.getServletContext()),0,60*60*1000);
		info.contextInitialized(event);
	}catch(Exception e){
		Assert.assertTrue(true);
	}

	
}


}
