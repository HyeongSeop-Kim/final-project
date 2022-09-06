package com.myweb.somoim.participants.model;

public class MeetingParticipantsDTO {
	private int memberId;
	private int moimId;
	private String meetingId;
	private String memberName;
	private String memberImagePath;

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
	
	public String getMeetingId() {
		return meetingId;
	}
	
	public void setMeetingId(String meetingId) {
		this.meetingId = meetingId;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberImagePath() {
		return memberImagePath;
	}

	public void setMemberImagePath(String memberImagePath) {
		this.memberImagePath = memberImagePath;
	}

	@Override
	public String toString() {
		return "MeetingParticipantsDTO [memberId=" + memberId + ", moimId=" + moimId + ", meetingId=" + meetingId
				+ ", memberName=" + memberName + "]" + ", memberImagePath=" + memberImagePath + "]";
	}
}
