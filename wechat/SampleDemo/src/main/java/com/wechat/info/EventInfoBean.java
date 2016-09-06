package com.wechat.info;

public class EventInfoBean {
	public InfoBean info=new InfoBean();
	public InfoWithUserBean infoWithUser=new InfoWithUserBean();
	private int number = -1; // 参与事件的人数
	
	
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
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
}
