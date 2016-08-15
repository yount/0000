package com.wechat.info;

import java.util.Date;

public class InfoWithUserBean {
	private String uuid;
	private long userId;
	private String infoId; 
	private Date registerTime;
	private int status=-1;
	
	public InfoWithUserBean(){
		super();
	}
	public String getUuid(){
		return uuid;
	}
	public void setUuid(String uuid){
		this.uuid=uuid;
	}
	public long getUserId(){
		return userId;
	}
	public void setUserId(long userId){
		this.userId=userId;
	}
	public Date getRegisterTime(){
		return registerTime;
	}
	public void setRegisterTime(Date registerTime){
		this.registerTime=registerTime;
	}
	public int getStatus(){
		return status;
	}
	public void setStatus(int status){
		this.status=status;
	}
	
}
