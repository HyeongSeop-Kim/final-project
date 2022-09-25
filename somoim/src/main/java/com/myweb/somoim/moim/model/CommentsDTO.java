package com.myweb.somoim.moim.model;

import java.sql.Date;
public class CommentsDTO {
	
	private int commentId;
	private int boardId;
	private String content;
	private Date contentCreateDate;
	private int moimId;
	private String memberId;
	private String memberName;
	private String memberImagePath;
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getContentCreateDate() {
		return contentCreateDate;
	}
	public void setContentCreateDate(Date contentCreateDate) {
		this.contentCreateDate = contentCreateDate;
	}
	public int getMoimId() {
		return moimId;
	}
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
		return "CommentsDTO [commentId=" + commentId + ", boardId=" + boardId + ", content=" + content
				+ ", contentCreateDate=" + contentCreateDate + ", moimId=" + moimId + ", memberId=" + memberId
				+ ", memberName=" + memberName + ", memberImagePath=" + memberImagePath + "]";
	}
	
	

	
}
