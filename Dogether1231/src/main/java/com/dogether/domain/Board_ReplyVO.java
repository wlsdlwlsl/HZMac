package com.dogether.domain;

public class Board_ReplyVO {
	private int reply_no;
	private int boardID;
	private String reply;
	private String replyer;
	private String ReplyDate;
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getReplyDate() {
		return ReplyDate;
	}
	public void setReplyDate(String replyDate) {
		ReplyDate = replyDate;
	}
	
}
