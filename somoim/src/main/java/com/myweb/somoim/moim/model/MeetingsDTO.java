package com.myweb.somoim.moim.model;

import java.sql.Date;

public class MeetingsDTO {
	private int meetingId;
	private String meetingTitle;
	private Date meetingDate;
	private String meetingPlace;
	private int meetingPrice;
	private int meetingLimit;
	private int moimId;
	
	public int getMeetingId() {
		return meetingId;
	}
	
	public void setMeetingId(int meetingId) {
		this.meetingId = meetingId;
	}
	
	public String getMeetingTitle() {
		return meetingTitle;
	}
	
	public void setMeetingTitle(String meetingTitle) {
		this.meetingTitle = meetingTitle;
	}
	
	public Date getMeetingDate() {
		return meetingDate;
	}
	
	public void setMeetingDate(Date meetingDate) {
		this.meetingDate = meetingDate;
	}
	
	public String getMeetingPlace() {
		return meetingPlace;
	}
	
	public void setMeetingPlace(String meetingPlace) {
		this.meetingPlace = meetingPlace;
	}
	
	public int getMeetingPrice() {
		return meetingPrice;
	}
	
	public void setMeetingPrice(int meetingPrice) {
		this.meetingPrice = meetingPrice;
	}
	
	public int getMeetingLimit() {
		return meetingLimit;
	}
	
	public void setMeetingLimit(int meetingLimit) {
		this.meetingLimit = meetingLimit;
	}
	
	public int getMoimId() {
		return moimId;
	}
	
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}
	
	@Override
	public String toString() {
		return "MeetingsDTO [meetingId=" + meetingId + ", meetingTitle=" + meetingTitle + ", meetingDate=" + meetingDate
				+ ", meetingPlace=" + meetingPlace + ", meetingPrice=" + meetingPrice + ", meetingLimit=" + meetingLimit
				+ ", moimId=" + moimId + "]";
	}
}
