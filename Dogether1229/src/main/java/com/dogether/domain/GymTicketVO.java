package com.dogether.domain;

public class GymTicketVO {
	private String gymTicketID;
	private String memberID;
	private String gymManagerID;
	private String reservationDate;
	private char usedYN;
	private char ptTicketYN;
	private String gymTrainerID;
	
	public String getGymTicketID() {
		return gymTicketID;
	}
	public void setGymTicketID(String gymTicketID) {
		this.gymTicketID = gymTicketID;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getGymManagerID() {
		return gymManagerID;
	}
	public void setGymManagerID(String gymManagerID) {
		this.gymManagerID = gymManagerID;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public char getUsedYN() {
		return usedYN;
	}
	public void setUsedYN(char usedYN) {
		this.usedYN = usedYN;
	}
	public char getPtTicketYN() {
		return ptTicketYN;
	}
	public void setPtTicketYN(char ptTicketYN) {
		this.ptTicketYN = ptTicketYN;
	}
	public String getGymTrainerID() {
		return gymTrainerID;
	}
	public void setGymTrainerID(String gymTrainerID) {
		this.gymTrainerID = gymTrainerID;
	}
	
}
