package com.myweb.somoim.participants.model;

public class MeetingParticipantsDTO {
	private int memberId;
	private int moimId;
	private int meetingId;
	
	public int getMemberId() {
		return memberId;
	}
	
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public int getMoimId() {
		return moimId;
	}
	
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}
	
	public int getMeetingId() {
		return meetingId;
	}
	
	public void setMeetingId(int meetingId) {
		this.meetingId = meetingId;
	}
	
	@Override
	public String toString() {
		return "MeetingParticipantsDTO [memberId=" + memberId + ", moimId=" + moimId + ", meetingId=" + meetingId + "]";
	}
}
