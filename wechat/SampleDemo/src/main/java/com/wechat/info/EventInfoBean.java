package com.wechat.info;

public class EventInfoBean {
	public InfoBean info=new InfoBean();
	public InfoWithUserBean infoWithUser=new InfoWithUserBean();
	public InfoBean getInfo() {
		return info;
	}
	public void setInfo(InfoBean info) {
		this.info = info;
	}
	public InfoWithUserBean getInfoWithUser() {
		return infoWithUser;
	}
	public void setInfoWithUser(InfoWithUserBean infoWithUser) {
		this.infoWithUser = infoWithUser;
	}
}
