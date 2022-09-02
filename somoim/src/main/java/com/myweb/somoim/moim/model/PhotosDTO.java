package com.myweb.somoim.moim.model;

public class PhotosDTO {
	private int photoId;
	private String photoImagePath;
	private int moimId;
	private int memberId;

	public int getPhotoId() {
		return photoId;
	}
	
	public void setPhotoId(int photoId) {
		this.photoId = photoId;
	}
	
	public String getPhotoImagePath() {
		return photoImagePath;
	}
	
	public void setPhotoImagePath(String photoImagePath) {
		this.photoImagePath = photoImagePath;
	}
	
	public int getMoimId() {
		return moimId;
	}
	
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}
	
	public int getMemberId() {
		return memberId;
	}
	
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String toString() {
		return "PhotosDTO [photoId=" + photoId + ", photoImagePath=" + photoImagePath + ", moimId=" + moimId
				+ ", memberId=" + memberId + "]";
	}
}
