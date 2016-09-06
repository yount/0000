package com.wechat.testinfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import org.easymock.EasyMock;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.api.easymock.PowerMock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.util.Assert;

import com.liferay.portal.kernel.dao.jdbc.DataAccess;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.wechat.info.EventInfoBean;
import com.wechat.info.InfoDao;

/**
 * 此类测试infodao
 * @author wang
 */
@RunWith(PowerMockRunner.class)
@PrepareForTest({DataAccess.class,})
public class TestInfoDao {
	@Test
	public void testInfoDao() throws SQLException, ClassNotFoundException, ParseException {
		PowerMock.mockStatic(DataAccess.class);
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://10.2.1.191:3306/lportal?useUnicode=true&characterEncoding=UTF8&useFastDateParsing=false";
		String username="root";
		String password="root";
		Connection conn=DriverManager.getConnection(url, username, password);
		EasyMock.expect(DataAccess.getConnection()).andReturn(conn);
		PowerMock.replay(DataAccess.class);
		List<EventInfoBean> infos =InfoDao.getInfos("",20159);
		Assert.notNull(infos);
	}
}
