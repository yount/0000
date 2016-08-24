package com.wechat.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import com.wechat.po.MyX509TrustManager;

import net.sf.json.JSONObject;


/**
 * 通用工具类
 * @author perficient
 *
 */
public class CommonUtil {
	/** 凭证获取 **/
	private final static String GET_TOKEN_URL = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	/** 发送请求 @param requestUrl @param requestMethod @param outputStr @return */
	public static JSONObject httpsRequest(String requestUrl,String requestMethod,String outputStr){
		JSONObject jsonObject=null;
		Logger log=Logger.getLogger("log");
		try{
			/**JSONO创建SSLContext对象，并使用我们指定的信任管理初始化**/
			TrustManager[] tm = {new MyX509TrustManager()};
			SSLContext sslContext = SSLContext.getInstance("SSL","SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			/**从上述SSLContext对象中得到SSLSockFactory对象**/
			SSLSocketFactory ssf = sslContext.getSocketFactory();
			URL url = new URL(requestUrl);
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setSSLSocketFactory(ssf);
			conn.setDoOutput(true);
			conn.setDoInput(true);
			conn.setUseCaches(false);
			conn.setRequestProperty("Accept-Charset", "UTF-8");
			/**设置请求方式**/
			conn.setRequestMethod(requestMethod);
			/**当outputStr不为null时，向输出流写数据**/
			if(null!=outputStr){
				OutputStream outputStream = conn.getOutputStream();
				/**注意编码格式**/
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}
			/**从输入流读取返回内容**/
			InputStream inputStream = conn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(inputStream,"UTF-8");
			BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
			String str = null;
			StringBuffer buffer = new StringBuffer();
			while((str = bufferedReader.readLine())!=null){
				buffer.append(str);
			}
			/**释放资源**/
			bufferedReader.close();
			inputStreamReader.close();
			inputStream.close();
			inputStream = null;
			conn.disconnect();
			jsonObject = JSONObject.fromObject(buffer.toString()); 
			
		}catch(Exception e){
			log.log(Level.INFO,"content",e);
		}
		return jsonObject;
	}
	

	/**
	 * URL编码
	 * @param source
	 * @return
	 */
	public static String urlEncodUTF8(String source){
		String result = source;
		try{
			result = java.net.URLEncoder.encode(source,"utf-8");
		}catch(UnsupportedEncodingException e){
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	// 上次获取openid的时间
	public static long LAST_TIME = 0;
	
	// 一个小时的毫秒数
	public final static long ONE_HOUR = 2*60*60*1000; 
	
	public static String ACCESS_TOKEN = null;
	/**
	 * 获取调用借口权限的access_token,与通过code换取的access_token不同
	 * 此处access_token两小时过期，故一小时重新获取一次
	 * @param appid
	 * @param appSecret
	 * @return
	 */
	public static String getAccessToken(String appid, String appSecret){
		long now = System.currentTimeMillis();
		if(ACCESS_TOKEN!=null && (now-LAST_TIME)<ONE_HOUR){
			return ACCESS_TOKEN;
		} else {
			synchronized(AdvancedUtil.class){
				LAST_TIME = System.currentTimeMillis();
				// String requestUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+appid+"&secret="+appSecret;
				String requestUrl = GET_TOKEN_URL.replace("APPID", appid).replace("APPSECRET", appSecret);
				// 正确时数据返回格式：{"access_token":"ACCESS_TOKEN","expires_in":7200}
				// 错误时数据返回格式：{"errcode":40013,"errmsg":"invalid appid"}
				JSONObject json = CommonUtil.httpsRequest(requestUrl, "GET", null);
				if(json.getString("access_token")!=null){
					ACCESS_TOKEN = json.getString("access_token");
					return ACCESS_TOKEN;
				} else {
					ACCESS_TOKEN = null;
					return null;
				}
			}
		}
		
	}
	
	/**
	 * 向指定openid发送信息，postJson中包含有openid信息，postJson格式见：
	 * https://mp.weixin.qq.com/wiki?t=resource/res_main&id=mp1421140547&token=&lang=zh_CN
	 * 
	 * @param appid
	 * @param appSecret
	 * @param openid
	 * @param postJson
	 * @return
	 */
	public static boolean sendMessage(String appid, String appSecret, JSONObject postJson){
		String requestUrl = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=ACCESS_TOKEN";
		JSONObject result = null;
		
		requestUrl = requestUrl.replace("ACCESS_TOKEN", getAccessToken(appid, appSecret));
		// 发送消息正常时的返回格式：
		// {"errcode":0,"errmsg":"ok"}
		result = CommonUtil.httpsRequest(requestUrl, "POST", postJson.toString());
		System.out.println("显示微信返回信息:"+result.getString("errmsg"));
		
		return true;
	}
	
	
	public static void main(String[ ] arg){
		String url = "http://employee.perficientgdc.com.cn:8888/WeChatProject/oauthServlet/";
		System.out.print(CommonUtil.urlEncodUTF8(url));
	}
}
