package com.wechat.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;
import java.util.logging.Logger;

import javax.servlet.ServletContext;

import net.sf.json.JSONObject;

import com.wechat.info.InfoListen;

public class InfoTimerTask extends TimerTask {
	private static Logger logger=Logger.getLogger("log");
	private ServletContext context = null;
	
	public InfoTimerTask(){
		super();
	}
	public InfoTimerTask(ServletContext context){
		this.context=context;
	}

	
	
	@Override
	public void run() {
		//查询数据库
		Connection conn= null;
		PreparedStatement preState = null;
		SimpleDateFormat formatDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			String sql="select pi.title,pi.content,pi.startTime,piu.userId,user.openId from p_info as pi left join "
                       +"(select uuid as infoUserId,userId,infoId,registerTime,status from p_info_user  where p_info_user.status=1) as piu "
                       +"on pi.uuid=piu.infoId inner join User_ as user on piu.userId=user.userId "
                       +"where pi.status=1 " 
                       +"and pi.startTime>=date_add(now(),interval 12 hour) "
                       +"and pi.startTime<date_add(now(),interval 13 hour) " 
                       +"and user.openId is not null "
                       +"order by pi.startTime asc ";
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://121.43.175.85:3306/lportal?useUnicode=true&characterEncoding=UTF8&useFastDateParsing=false";
			String username="root";
			String password="cjhlTQL";
			conn=DriverManager.getConnection(url,username,password);
			preState=conn.prepareStatement(sql);
			ResultSet rs = preState.executeQuery();
			List<InfoListen> infolistenlist=new ArrayList<InfoListen>();
			while(rs.next()){
				InfoListen listen=new InfoListen();
				if(rs.getString("openId") != ""){
					listen.setTitle(rs.getString("title"));
					listen.setContent(rs.getString("content"));
					listen.setOpenId(rs.getString("openId"));
					listen.setUserId(rs.getLong("userId"));
					listen.setStartTime(rs.getTime("startTime"));
					infolistenlist.add(listen);
					System.out.println(listen.getOpenId());
				}
			}
			for(short i=0;i<infolistenlist.size();i++){
				if(infolistenlist.get(i).getOpenId()!=null){
					/**组建复杂json对象*/
					JSONObject textJson=new JSONObject();
					JSONObject postJson=new JSONObject();
					String userOpenId=null;
					String userSendMessage=null;
					userOpenId=infolistenlist.get(i).getOpenId();
					userSendMessage="您参加的活动\""+infolistenlist.get(i).getTitle()+"\"将于"+formatDate.format(infolistenlist.get(i).getStartTime())+"开始进行,请提前做好准备";
					textJson.put("content", userSendMessage);
					postJson.put("touser", userOpenId);
					postJson.put("msgtype", "text");
					postJson.put("text", textJson);
					System.out.println("向"+infolistenlist.get(i).getOpenId()+"发送消息:"+userSendMessage);
//					CommonUtil.sendMessage("wx29e52cd7861daba6", "46c484e0faee213f079709cf9bed69d1", postJson);
				}
			}
			
		} catch (Exception e) {		
			logger.log(null, "context", e);
			logger.log(null,"context",context);
		} finally{
			if(conn != null){
				try {
					conn.close();
				} catch (Exception e) {
					logger.log(null, "context", e);
				}
			}
		}

	}
	public static void main(String[] args){
		JSONObject textJson=new JSONObject();
		JSONObject postJson=new JSONObject();
		String userOpenId="o_CN7v-PpRt4nP974UfOJBi7w_xc";
		String userSendMessage="aaaaaaaaaaaaaaaaaaaaa";
		textJson.put("content", userSendMessage);
		postJson.put("touser", userOpenId);
		postJson.put("msgtype", "text");
		postJson.put("text", textJson);
		System.out.println(userOpenId+"发送消息:"+userSendMessage);
		System.out.println(postJson.toString());
		CommonUtil.sendMessage("wx29e52cd7861daba6", "46c484e0faee213f079709cf9bed69d1", postJson);
	}
	
}

