package com.myweb.somoim.moim.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class MeetingsDTO {
	private int meetingId;
	private String meetingTitle;
	private Date meetingDate;
	private String meetingPlace;
	private int meetingPrice;
	private int meetingLimit;
	private int moimId;
	private String meetDay;
	private String meetDate;
	private String meetTime;

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
	
	@SuppressWarnings("deprecation")
	public void setMeetingDate(Date meetingDate) {
		this.meetingDate = meetingDate;
		switch (this.meetingDate.getDay()) {
			case 0 :
				this.setMeetDay("일요일");
				break;
			case 1 :
				this.setMeetDay("월요일");
				break;
			case 2 :
				this.setMeetDay("화요일");
				break;
			case 3 :
				this.setMeetDay("수요일");
				break;
			case 4 :
				this.setMeetDay("목요일");
				break;
			case 5 :
				this.setMeetDay("금요일");
				break;
			case 6 :
				this.setMeetDay("토요일");
				break;
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("MM.dd hh시 mm분");
		
		this.setMeetDate(dateFormat.format(this.meetingDate));
		this.setMeetTime(timeFormat.format(this.meetingDate));
		
		System.out.println(this.meetDate + this.meetTime);
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
	
	public String getMeetDay() {
		return meetDay;
	}

	public void setMeetDay(String meetDay) {
		this.meetDay = meetDay;
	}

	public String getMeetDate() {
		return meetDate;
	}

	public void setMeetDate(String meetDate) {
		this.meetDate = meetDate;
	}

	public String getMeetTime() {
		return meetTime;
	}

	public void setMeetTime(String meetTime) {
		this.meetTime = meetTime;
	}

	@Override
	public String toString() {
		return "MeetingsDTO [meetingId=" + meetingId + ", meetingTitle=" + meetingTitle + ", meetingDate=" + meetingDate
				+ ", meetingPlace=" + meetingPlace + ", meetingPrice=" + meetingPrice + ", meetingLimit=" + meetingLimit
				+ ", moimId=" + moimId + "]";
	}
}
