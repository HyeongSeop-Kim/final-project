package com.myweb.somoim.moim.model;

import java.sql.Date;

public class BoardsDTO {
	private int moimId;
	private int boardId;
	private int memberId;
	private String boardTitle;
	private String content;
	private Date createDate;
	private int like;
	
	public int getMoimId() {
		return moimId;
	}
	
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}
	
	public int getBoardId() {
		return boardId;
	}
	
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	
	public int getMemberId() {
		return memberId;
	}
	
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public String getBoardTitle() {
		return boardTitle;
	}
	
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public int getLike() {
		return like;
	}
	
	public void setLike(int like) {
		this.like = like;
	}
	
	@Override
	public String toString() {
		return "BoardsDTO [moimId=" + moimId + ", boardId=" + boardId + ", memberId=" + memberId + ", boardTitle="
				+ boardTitle + ", content=" + content + ", createDate=" + createDate + ", like=" + like + "]";
	}
}
