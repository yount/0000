package com.wechat.utils;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class InfoTimerListenerUtil implements ServletContextListener {
	
	private  Timer timer=null;
	long time=(long)60*60*1000;

	@Override
	public void contextDestroyed(ServletContextEvent event) {
		timer.cancel();
		event.getServletContext().log("定时器销毁");
	}

	@Override
	public void contextInitialized(ServletContextEvent event) {
		timer =new Timer(true);
		//event.getServletContext().log("定时器已启动");
		try{
			timer.schedule(new InfoTimerTask(event.getServletContext()),60000,time);
		}catch(Exception e){
			  throw new RuntimeException(e);
		}
		//event.getServletContext().log("已添加定时器任务");
	}

}
