package com.wechat.utils;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.UUID;
import java.util.logging.Logger;

public class Util {
	private final static SimpleDateFormat fromatDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	private static Properties prop=new Properties();
	public static String getUUID(){
		return UUID.randomUUID().toString();
	}
	public static String getTime(){
		return fromatDate.format(new Date());
	}
	public static String getTime(Date date){
		return fromatDate.format(date);
	}

	/*获取url.properties的url等信息*/
	public static  Properties getUrlProperties() {
		Logger log=Logger.getLogger("log");
//		Util util=new Util();
//		try{
//			prop.load(util.getClass().getResourceAsStream("url.properties"));
//		}catch(Exception e){
////			e.printStackTrace();
//			log.log(null, "context", e);
//
//		}
		


		prop.setProperty("url", "http://121.43.175.85");

		prop.setProperty("ip", "121.43.175.85");

		prop.setProperty("port", "8888");
		
		return prop;
	}
	

	
	public static void main(String[] args) throws IOException {
		Properties pps= new Properties();
		InputStream in = new BufferedInputStream (new FileInputStream("Test.properties"));  
		    pps.load(in);
		 String url= pps.getProperty("url");
		  String ip = pps.getProperty("ip");
		           System.out.println( url);
		
		
	}

}
