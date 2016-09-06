package com.wechat.info;

import java.util.Date;

public class InfoWithUserBean {
	
	/**p_info_user表信息*/
	public String uuid;
	public long userId;
	public String infoId;
	public Date registerTime;
	public int status=0;
	
	/**User_表用户关键信息*/
	public String screenName;
	public String emailAddress;
	public String openId;
	public String firstName;
	public String lastName;
	
	public InfoWithUserBean(){
		super();
	}
	
	public long getUserId(){
		return userId;
	}
	
	public void setUserId(long userId){
		this.userId=userId;
	}
	
	public String getUuid(){
		return uuid;
	}
	
	public void setUuid(String uuid){
		this.uuid=uuid;
	}
	
	public String getInfoId() {
		return infoId;
	}
	
	public void setInfoId(String infoId) {
		this.infoId = infoId;
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
	
	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getOpenId() {
		return openId;
	}

	public void setOpenId(String openId) {
		this.openId = openId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	
}
