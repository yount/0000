package com.wechat.utils;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;

public class Util {
	private Util(){
		
	}
	private static Properties prop=new Properties();
	public static String getUUID(){
		return UUID.randomUUID().toString();
	}
	public static String getTime(){
		SimpleDateFormat fromatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return fromatDate.format(new Date());
	}
	public static String getTime(Date date){
		SimpleDateFormat fromatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		return fromatDate.format(date);
	}
	public static  Properties getUrlProperties() {

		prop.setProperty("url", "http://employee.perficientgdc.com.cn");
		prop.setProperty("port", "8888");
		
		return prop;

	}
	
	public static void main(String[] args) throws IOException {
		
		/**
		 * Properties pps= new Properties();
		 * pps=getUrlProperties();
		 * System.out.println(pps.getProperty("url"));
		 * System.out.println(pps.getProperty("ip"));
		 * System.out.println(pps.getProperty("port"));
		 **/
		
	}

}
