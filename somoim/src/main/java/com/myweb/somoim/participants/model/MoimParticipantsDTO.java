package com.myweb.somoim.participants.model;

public class MoimParticipantsDTO {
	private int memberId;
	private int jobId;
	private int moimId;
	private String memberName;
	private String JobName;
	private String memberImagePath;

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
		return JobName;
	}

	public void setJobName(String jobName) {
		JobName = jobName;
	}

	public String getMemberImagePath() {
		return memberImagePath;
	}

	public void setMemberImagePath(String memberImagePath) {
		this.memberImagePath = memberImagePath;
	}

	@Override
	public String toString() {
		return "MoimParticipantsDTO [memberId=" + memberId + ", jobId=" + jobId + ", moimId=" + moimId + "]";
	}
}
