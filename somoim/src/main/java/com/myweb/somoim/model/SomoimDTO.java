package com.myweb.somoim.model;

public class SomoimDTO {
	private int moimId;
	private String moimTitle;
	private String moimInfo;
	private int moimLimit;
	private int locationId;
	private String locationName;
	private String moimImagePath;
	private String locationName;
	
	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	
	public int getMoimId() {
		return moimId;
	}
	
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}
	
	public String getMoimTitle() {
		return moimTitle;
	}
	
	public void setMoimTitle(String moimTitle) {
		this.moimTitle = moimTitle;
	}
	
	public String getMoimInfo() {
		return moimInfo;
	}
	
	public void setMoimInfo(String moimInfo) {
		this.moimInfo = moimInfo;
	}
	
	public int getMoimLimit() {
		return moimLimit;
	}
	
	public void setMoimLimit(int moimLimit) {
		this.moimLimit = moimLimit;
	}
	
	public int getLocationId() {
		return locationId;
	}
	
	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}
	
	public String getMoimImagePath() {
		return moimImagePath;
	}
	
	public void setMoimImagePath(String moimImagePath) {
		this.moimImagePath = moimImagePath;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	@Override
	public String toString() {
		return "SomoimDTO [moimId=" + moimId + ", moimTitle=" + moimTitle + ", moimInfo=" + moimInfo + ", moimLimit="
				+ moimLimit + ", locationId=" + locationId + ", moimImagePath=" + moimImagePath + ", locationName="
				+ locationName + "]";
	}
	
	
}
