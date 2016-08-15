package com.wechat.info;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.util.PortalUtil;

public class InfoDao {
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	private static Logger logger=Logger.getLogger("log");

	public static List<EventInfoBean> getInfos(String whereCase,long userId){
		List<EventInfoBean> infos = new ArrayList<EventInfoBean>();
		
		Connection conn = null;
		PreparedStatement preState = null;
		try {
			conn = DataAccess.getConnection();
			System.out.println("Connection="+conn);
			String sql = "select pi.*, piu.* from p_info as pi left join "
					+ "(select uuid as infoUserId,userId,infoId,registerTime,status info_user_status from p_info_user as pu where pu.userId=? ) as piu on pi.uuid=piu.infoId "
					+ "where TO_DAYS(pi.startTime)>TO_DAYS(now()) and pi.status=1 "+whereCase+" order by pi.startTime asc" ;
			// Statement state = conn.createStatement();
			
			preState=conn.prepareStatement(sql);
			preState.setLong(1, userId);
			
			ResultSet rs = preState.executeQuery();
			
			System.out.println("ResultSet="+rs);
			
			while(rs.next()){
				EventInfoBean eventInfoBean = new EventInfoBean();
				
				eventInfoBean.info.setUuid(rs.getString("uuid"));
				eventInfoBean.info.setCreateId(rs.getString("createId"));
				eventInfoBean.info.setCreateDate(rs.getDate("createTime"));
				eventInfoBean.info.setEndDate(rs.getDate("endTime"));
				eventInfoBean.info.setTitle(rs.getString("title"));
				eventInfoBean.info.setContent(rs.getString("content"));
				eventInfoBean.info.setImageURL(rs.getString("imageUrl"));
				eventInfoBean.info.setStatus(""+rs.getInt("status"));
				eventInfoBean.info.setStartTime(rs.getDate("startTime"));
				eventInfoBean.info.setLocation(rs.getString("event_location"));
				eventInfoBean.info.setAudience(rs.getString("target_audience"));
				
				eventInfoBean.infoWithUser.setUuid(rs.getString("infoUserId"));
				eventInfoBean.infoWithUser.setUserId(rs.getLong("userId"));
				eventInfoBean.infoWithUser.setRegisterTime(rs.getDate("registerTime"));
				eventInfoBean.infoWithUser.setStatus(rs.getInt("info_user_status"));
//				String uuid = rps.getString("uuid"); // 主键 
//				String createUuid = rs.getString("createId"); // 创建者uuid
//				Date createDate = rs.getDate("createTime"); // 创建时间
//				Date endDate = rs.getDate("endTime"); // 到期时间
//				String title = rs.getString("title"); // 消息抬头
//				String content = rs.getString("content"); // 消息内容
//				String imageURL = rs.getString("imageUrl"); // 图片在本地的路径
//				int status = rs.getInt("status"); // 消息状态
				System.out.println("infos="+infos.size());
				infos.add(eventInfoBean);
			}
			preState.close();
			rs.close();
			
		} catch (SQLException e) {
//			e.printStackTrace();
			logger.log(null, "context", e);
		} finally {
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
//					e.printStackTrace();
					logger.log(null, "context", e);
				}
			}
		}
		
		return infos;
	}
	
//	public static InfoBean getInfoDetail(String infoUUID){
//		InfoBean info = new InfoBean();
//		
//		String sql = "select uuid, createId, createTime, endTime, title, content, imageUrl, status, startTime, event_location, target_audience "
//				+ " from p_info where uuid=?";
//		try {
//			PreparedStatement ps = DataAccess.getConnection().prepareStatement(sql);
//			
//			ps.setString(1, infoUUID);
//			ResultSet rs = ps.executeQuery();
//			if(rs.next()){
//				info.setUuid(rs.getString(1));
//				info.setCreateId(rs.getString(2));
//				info.setCreateDate(rs.getDate(3));
//				info.setEndDate(rs.getDate(4));
//				info.setTitle(rs.getString(5));
//				info.setContent(rs.getString(6));
//				info.setImageURL(rs.getString(7));
//				info.setStatus(rs.getString(8));
//				info.setStartTime(rs.getDate(9));
//				info.setLocation(rs.getString(10));
//				info.setAudience(rs.getString(11));
//			}
//			
//			ps.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		return info;
//	}
	
	
	
	
	
}
