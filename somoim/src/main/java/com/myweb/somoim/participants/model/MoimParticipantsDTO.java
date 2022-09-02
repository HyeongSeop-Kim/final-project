package com.myweb.somoim.participants.model;

public class MoimParticipantsDTO {
	private int memberId;
	private int jobId;
	private int moimId;
	
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

	@Override
	public String toString() {
		return "MoimParticipantsDTO [memberId=" + memberId + ", jobId=" + jobId + ", moimId=" + moimId + "]";
	}
}
