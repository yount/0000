package com.wechat.testinfo;

import org.junit.Test;
import org.springframework.util.Assert;

import com.wechat.info.EventInfoBean;
import com.wechat.info.InfoBean;
import com.wechat.info.InfoWithUserBean;

public class TestEventInfoBean {
	@Test
	public void testEventInfoBean(){
		EventInfoBean eventinfobean=new EventInfoBean();
		
		InfoBean infobean=new InfoBean();
		infobean.setContent("");
		infobean.setCreateId("1111");
		infobean.setImageURL("/local/image");
		infobean.setStatus("0");
		infobean.setTitle("mmm");
		infobean.setUuid("666666");
		
		InfoWithUserBean in=new InfoWithUserBean();
		in.setStatus(0);
		in.setUserId(1234);
		in.setUuid("43434");
		
		eventinfobean.setInfo(infobean);
		eventinfobean.setInfoWithUser(in);
		
		Assert.notNull(eventinfobean.getInfo());
		Assert.notNull(eventinfobean.getInfoWithUser());
		
		
	}
	

}
