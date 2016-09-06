package com.wechat.info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.sun.istack.logging.Logger;

public class InfoDao {
	 private InfoDao() {
		    throw new IllegalAccessError("Utility class");
		  }
	
	private static Logger logger=Logger.getLogger(InfoDao.class);

	public static List<EventInfoBean> getInfos(String whereCase,long userId) throws ParseException{
		List<EventInfoBean> infos = new ArrayList<EventInfoBean>();
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Connection conn = null;
		PreparedStatement preState = null;
		try {
			conn = DataAccess.getConnection();
			String sql = "select pi.*, piu.* from p_info as pi left join "
					+ "(select uuid as infoUserId,userId,infoId,registerTime,status info_user_status from p_info_user as pu where pu.userId=? ) as piu on pi.uuid=piu.infoId "
					+ "where pi.startTime>now() and pi.status=1 "+whereCase+" order by pi.startTime asc" ;

			
			preState=conn.prepareStatement(sql);
			preState.setLong(1, userId);
			
			ResultSet rs = preState.executeQuery();
			
			while(rs.next()){
				EventInfoBean eventInfoBean = new EventInfoBean();
				eventInfoBean.info.setUuid(rs.getString("uuid"));
				eventInfoBean.info.setCreateId(rs.getString("createId"));
				eventInfoBean.info.setCreateDate(rs.getDate("createTime")==null?null:formatDate.parse(rs.getDate("createTime").toString()+" "+rs.getTime("createTime").toString()));
				eventInfoBean.info.setEndDate(rs.getDate("endTime")==null?null:formatDate.parse(rs.getDate("endTime").toString()+" "+rs.getTime("endTime").toString()));
				eventInfoBean.info.setTitle(rs.getString("title"));
				eventInfoBean.info.setContent(rs.getString("content"));
				eventInfoBean.info.setImageURL(rs.getString("imageUrl"));
				eventInfoBean.info.setMediaURL(rs.getString("mediaUrl"));
				eventInfoBean.info.setStatus(Integer.toString(rs.getInt("status")));
				eventInfoBean.info.setStartTime(rs.getDate("startTime")==null?null:formatDate.parse(rs.getDate("startTime").toString()+" "+rs.getTime("startTime").toString()));
				eventInfoBean.info.setLocation(rs.getString("event_location"));
				eventInfoBean.info.setAudience(rs.getString("target_audience"));
				eventInfoBean.info.setMainImageURL(rs.getString("mainImageUrl"));
				
				eventInfoBean.infoWithUser.setUuid(rs.getString("infoUserId"));
				eventInfoBean.infoWithUser.setUserId(rs.getLong("userId"));
				eventInfoBean.infoWithUser.setRegisterTime(rs.getDate("registerTime")==null?null:formatDate.parse(rs.getDate("registerTime").toString()+" "+rs.getTime("registerTime").toString()));
				eventInfoBean.infoWithUser.setStatus(rs.getInt("info_user_status"));

				infos.add(eventInfoBean);
			}
			preState.close();
			rs.close();		
		} catch (SQLException e) {
			logger.log(null, "context", e);
		} finally {
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					logger.log(null, "context", e);
				}
			}
		}
		return infos;
	}
	
	public final static String ADMIN_INFO_SQL = "select p.uuid, p.imageUrl, p.title, p.content, p.mediaUrl, p.mainImageUrl, p.event_location, p.target_audience, p.startTime, p.endTime, p.createid, (select firstName from User_ where userid=p.createid) as createUserName, createTime, (select count(*) from p_info_user where infoid=p.uuid) as number, p.status from p_info p where 1=1 "; 
	public static List<EventInfoBean> getAdminInfos(String wherecase){
		List<EventInfoBean> infos = new ArrayList<EventInfoBean>();
		Connection conn = null;
		PreparedStatement preState = null;
		String sql = ADMIN_INFO_SQL + wherecase +" order by createTime desc";
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			conn = DataAccess.getConnection();
			preState=conn.prepareStatement(sql);
			ResultSet rs = preState.executeQuery();
			
			while(rs.next()){
				EventInfoBean eventInfoBean = new EventInfoBean();
				eventInfoBean.info.setUuid(rs.getString("uuid"));
				eventInfoBean.info.setCreateId(rs.getString("createId"));
				eventInfoBean.info.setCreateUserName(rs.getString("createUserName"));
				eventInfoBean.info.setCreateDate(rs.getDate("createTime")==null?null:formatDate.parse(rs.getDate("createTime").toString()+" "+rs.getTime("createTime").toString()));
				eventInfoBean.info.setEndDate(rs.getDate("endTime")==null?null:formatDate.parse(rs.getDate("endTime").toString()+" "+rs.getTime("endTime").toString()));
				eventInfoBean.info.setTitle(rs.getString("title"));
				eventInfoBean.info.setContent(rs.getString("content"));
				eventInfoBean.info.setImageURL(rs.getString("imageUrl"));
				eventInfoBean.info.setMediaURL(rs.getString("mediaUrl"));
				eventInfoBean.info.setStatus(Integer.toString(rs.getInt("status")));
				eventInfoBean.info.setStartTime(rs.getDate("startTime")==null?null:formatDate.parse(rs.getDate("startTime").toString()+" "+rs.getTime("startTime").toString()));
				eventInfoBean.info.setLocation(rs.getString("event_location"));
				eventInfoBean.info.setAudience(rs.getString("target_audience"));
				eventInfoBean.info.setMainImageURL(rs.getString("mainImageUrl"));
				
				// eventInfoBean.infoWithUser.setUuid(rs.getString("infoUserId"));
				// eventInfoBean.infoWithUser.setUserId(rs.getLong("userId"));
				// eventInfoBean.infoWithUser.setRegisterTime(rs.getDate("registerTime")==null?null:formatDate.parse(rs.getDate("registerTime").toString()+" "+rs.getTime("registerTime").toString()));
				// eventInfoBean.infoWithUser.setStatus(rs.getInt("info_user_status"));

				eventInfoBean.setNumber(rs.getInt("number"));
				infos.add(eventInfoBean);
			}
			preState.close();
			rs.close();	
		} catch (Exception e) {
			logger.info(e.getMessage());
		} finally {
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					logger.info(e.getMessage());
				}
			}
		}
		return infos;
	}
	public static List<InfoWithUserBean> getUsersAndInfoUsers(String infoId,String wherecase){
		List<InfoWithUserBean> infoWithUsers=new ArrayList<InfoWithUserBean>();
		
		Connection conn=null;
		PreparedStatement preState=null;
		String sql="select piu.uuid,piu.userId,piu.infoId,piu.registerTime,piu.status,user.screenName,"+
				"user.emailAddress,user.openId,user.firstName,user.lastName from "+
				"p_info_user as piu inner join User_ as user on piu.userId=user.userId "+
				" where piu.infoId=? "+wherecase+"  order by registerTime desc";
		SimpleDateFormat formatDate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try{
			conn=DataAccess.getConnection();
			preState=conn.prepareStatement(sql);
			preState.setString(1, infoId);
			ResultSet result=preState.executeQuery();
			while(result.next()){
				InfoWithUserBean infoWithUser=new InfoWithUserBean();
				infoWithUser.setUuid(result.getString("uuid"));
				infoWithUser.setUserId(result.getLong("userId"));
				infoWithUser.setInfoId(result.getString("infoId"));
				infoWithUser.setRegisterTime(result.getDate("registerTime")==null?null:formatDate.parse(result.getDate("registerTime").toString()+" "+result.getTime("registerTime").toString()));
				infoWithUser.setStatus(result.getInt("status"));
				infoWithUser.setScreenName(result.getString("screenName"));
				infoWithUser.setEmailAddress(result.getString("emailAddress"));
				infoWithUser.setOpenId(result.getString("openId"));
				infoWithUser.setFirstName(result.getString("firstName"));
				infoWithUser.setLastName(result.getString("lastName"));
				
				infoWithUsers.add(infoWithUser);
			}
			
			
		}catch(Exception e){
			logger.log(null, "context", e);
		}

		return infoWithUsers;
	}
	
}
