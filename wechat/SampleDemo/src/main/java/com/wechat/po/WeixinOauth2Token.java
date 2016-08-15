package com.wechat.po;

public class WeixinOauth2Token {
	private String accessToken;//网页授权借口调用凭证
	private int experesIn;//凭证有效时长
	private String refreshToken;//用于刷新凭证
	private String openId;//用户标识
	private String scope;//用户授权作用域
	public String getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(String accessToken) {
		this.accessToken = accessToken;
	}
	public int getExperesIn() {
		return experesIn;
	}
	public void setExperesIn(int experesIn) {
		this.experesIn = experesIn;
	}
	public String getRefreshToken() {
		return refreshToken;
	}
	public void setRefreshToken(String refreshToken) {
		this.refreshToken = refreshToken;
	}
	public String getOpenId() {
		return openId;
	}
	public void setOpenId(String openId) {
		this.openId = openId;
	}
	public String getScope() {
		return scope;
	}
	public void setScope(String scope) {
		this.scope = scope;
	}
	

}
