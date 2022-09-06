package com.myweb.somoim.participants.model;

public class MoimParticipantsDTO {
	private int memberId;
	private int jobId;
	private int moimId;
	private String memberName;  //추가
	private String jobName; //추가
	
	public int getMemberId() {
		return memberId;
	}
	
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public int getJobId() {
		return jobId;
	}
	
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	
	public int getMoimId() {
		return moimId;
	}
	
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	
	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	@Override 
	public String toString() {
		return "MoimParticipantsDTO [memberId=" + memberId + ", jobId=" + jobId + ", moimId=" + moimId + "]";
	}
}
