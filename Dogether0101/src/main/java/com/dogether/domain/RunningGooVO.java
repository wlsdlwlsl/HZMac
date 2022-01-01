package com.dogether.domain;
import java.util.Date;

public class RunningGooVO {
	private int roomNumber;
	private String location;
	private String memberID;
	private String memberPendingStatusYN;
	private int currentMembers;
	private int maxMembers;
	private String hostYN;
	private int sportsType;
	private int runningDistance;
	private int ageGeneration;
	private int sportsTime;
	private float locationLat;
	private float locationLong;
	private String hostComment;
	private String meetingTime;
	private int deposit;
	private int sortTypeRNG;	// 0이면 default / 1이면 미팅날짜순 

	
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getMemberPendingStatusYN() {
		return memberPendingStatusYN;
	}
	public void setMemberPendingStatusYN(String memberPendingStatusYN) {
		this.memberPendingStatusYN = memberPendingStatusYN;
	}
	public int getCurrentMembers() {
		return currentMembers;
	}
	public void setCurrentMembers(int currentMembers) {
		this.currentMembers = currentMembers;
	}
	public int getMaxMembers() {
		return maxMembers;
	}
	public void setMaxMembers(int maxMembers) {
		this.maxMembers = maxMembers;
	}
	public String getHostYN() {
		return hostYN;
	}
	public void setHostYN(String hostYN) {
		this.hostYN = hostYN;
	}
	public int getSportsType() {
		return sportsType;
	}
	public void setSportsType(int sportsType) {
		this.sportsType = sportsType;
	}
	public int getRunningDistance() {
		return runningDistance;
	}
	public void setRunningDistance(int runningDistance) {
		this.runningDistance = runningDistance;
	}
	public int getAgeGeneration() {
		return ageGeneration;
	}
	public void setAgeGeneration(int ageGeneration) {
		this.ageGeneration = ageGeneration;
	}
	public int getSportsTime() {
		return sportsTime;
	}
	public void setSportsTime(int sportsTime) {
		this.sportsTime = sportsTime;
	}
	public float getLocationLat() {
		return locationLat;
	}
	public void setLocationLat(float locationLat) {
		this.locationLat = locationLat;
	}
	public float getLocationLong() {
		return locationLong;
	}
	public void setLocationLong(float locationLong) {
		this.locationLong = locationLong;
	}
	public String getHostComment() {
		return hostComment;
	}
	public void setHostComment(String hostComment) {
		this.hostComment = hostComment;
	}
	public String getMeetingTime() {
		return meetingTime;
	}
	public void setMeetingTime(String meetingTime) {
		this.meetingTime = meetingTime;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getSortTypeRNG() {
		return sortTypeRNG;
	}
	public void setSortTypeRNG(int sortTypeRNG) {
		this.sortTypeRNG = sortTypeRNG;
	}
	
}
