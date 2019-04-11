package com.ssm.pojo;

import java.util.Date;

public class Complaint {
	//编号
	private int id;
	//投诉内容
	private String content;
	//投诉时间
	private Date time;
	//是否回复
	private int isReplay;
	//用户id
	private int userId;
	//回复内容
	private String replay;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getIsReplay() {
		return isReplay;
	}
	public void setIsReplay(int isReplay) {
		this.isReplay = isReplay;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getReplay() {
		return replay;
	}
	public void setReplay(String replay) {
		this.replay = replay;
	}
	
	
}
