package com.dogether.domain;

public class Runninggoo_EvaluationVO {
	private String judgedMemberID;
	private int roomNumber;
	private String judgerMemberID;
	private float evaluateStar;
	private char judgedYN;
	
	public String getJudgedMemberID() {
		return judgedMemberID;
	}
	public void setJudgedMemberID(String judgedMemberID) {
		this.judgedMemberID = judgedMemberID;
	}
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public String getJudgerMemberID() {
		return judgerMemberID;
	}
	public void setJudgerMemberID(String judgerMemberID) {
		this.judgerMemberID = judgerMemberID;
	}
	public float getEvaluateStar() {
		return evaluateStar;
	}
	public void setEvaluateStar(float evaluateStar) {
		this.evaluateStar = evaluateStar;
	}
	public char getJudgedYN() {
		return judgedYN;
	}
	public void setJudgedYN(char judgedYN) {
		this.judgedYN = judgedYN;
	}
	
	
}
