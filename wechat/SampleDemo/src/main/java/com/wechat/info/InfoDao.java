package com.wechat.info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.liferay.portal.kernel.dao.jdbc.DataAccess;

public class InfoDao {
	 private InfoDao() {
		    throw new IllegalAccessError("Utility class");
		  }
	
	private static Logger logger=Logger.getLogger("log");

	public static List<EventInfoBean> getInfos(String whereCase,long userId){
		List<EventInfoBean> infos = new ArrayList<EventInfoBean>();
		
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
				eventInfoBean.info.setCreateDate(rs.getDate("createTime"));
				eventInfoBean.info.setEndDate(rs.getDate("endTime"));
				eventInfoBean.info.setTitle(rs.getString("title"));
				eventInfoBean.info.setContent(rs.getString("content"));
				eventInfoBean.info.setImageURL(rs.getString("imageUrl"));
				eventInfoBean.info.setMediaURL(rs.getString("mediaUrl"));
				eventInfoBean.info.setStatus(Integer.toString(rs.getInt("status")));
				eventInfoBean.info.setStartTime(rs.getDate("startTime"));
				eventInfoBean.info.setLocation(rs.getString("event_location"));
				eventInfoBean.info.setAudience(rs.getString("target_audience"));
				eventInfoBean.info.setMainImageURL(rs.getString("mainImageUrl"));
				
				eventInfoBean.infoWithUser.setUuid(rs.getString("infoUserId"));
				eventInfoBean.infoWithUser.setUserId(rs.getLong("userId"));
				eventInfoBean.infoWithUser.setRegisterTime(rs.getDate("registerTime"));
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
	
}
