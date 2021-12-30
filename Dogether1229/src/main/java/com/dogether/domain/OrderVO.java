package com.dogether.domain;

public class OrderVO {
	private String orderID;
	private String memberID;
	private String productID;
	private String orderDate;
	private char buyingConfirmYN;
	private char returnYN;
	private int returnStatus;
	private int sortTypeOrder;		
	//1이면 반품신청만, 2면 반품진행중, 3이면 반품 처리완료, 4면 주문일자순, 5는 구매확정만
	
	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public char getBuyingConfirmYN() {
		return buyingConfirmYN;
	}
	public void setBuyingConfirmYN(char buyingConfirmYN) {
		this.buyingConfirmYN = buyingConfirmYN;
	}
	public char getReturnYN() {
		return returnYN;
	}
	public void setReturnYN(char returnYN) {
		this.returnYN = returnYN;
	}
	public int getReturnStatus() {
		return returnStatus;
	}
	public void setReturnStatus(int returnStatus) {
		this.returnStatus = returnStatus;
	}
	public int getSortTypeOrder() {
		return sortTypeOrder;
	}
	public void setSortTypeOrder(int sortTypeOrder) {
		this.sortTypeOrder = sortTypeOrder;
	}
	
}
