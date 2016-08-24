package com.wechat.info;

import java.util.Date;

public class InfoBean {
	private String uuid; // 主键 
	private String createId; // 创建者id
	private Date createDate; // 创建时间
	private Date endDate; // 到期时间
	private String title; // 消息抬头
	private String content; // 消息内容
	private String imageURL; // 图片在本地的路径,字段存放多张图片路径,以";"隔开
	private String mainImageURL;//事件主图在本地路径
	private String mediaURL; //视频在本地的路径
	private String status; // 消息状态
	private String location; // 地点
	private String audience; // 成员类型
	private Date startTime; // 开始时间
	public InfoBean() {
		super();
	}
	
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getCreateId() {
		return createId;
	}
	public void setCreateId(String createUuid) {
		this.createId = createUuid;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public String getMediaURL(){
		return mediaURL;
	}
	public void setMediaURL(String mediaURL){
		this.mediaURL=mediaURL;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAudience() {
		return audience;
	}

	public void setAudience(String audience) {
		this.audience = audience;
	}

	public String getMainImageURL() {
		return mainImageURL;
	}

	public void setMainImageURL(String mainImageURL) {
		this.mainImageURL = mainImageURL;
	}
	
}
