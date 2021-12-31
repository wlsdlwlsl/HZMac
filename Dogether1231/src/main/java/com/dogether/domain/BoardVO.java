package com.dogether.domain;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int boardID;
	private String memberID;
	private String boardTitle;
	private String boardContent;
	private String board_fname;
	private String board_realfname;
	private long board_fsize;
	private int board_like_count;
	private MultipartFile file;
	private int sortTypeBST;	// 0이면 default / 1이면 좋아요순 
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		System.out.println("????");
		this.file = file;
		
		// 업로드 파일 접근
		if(! file.isEmpty()){
			System.out.println("file되나?");
			// b_fname : 사용자가 올린 파일명
			this.board_fname = file.getOriginalFilename();
			this.board_fsize = file.getSize();
			
			// member_realfname : 서버에 저장되는 파일명
			UUID uuid = UUID.randomUUID();
			// 여기서 this는 멤버변수 member_realfname 자기자신
			this.board_realfname = uuid.toString() + "_" + board_fname;
			
			//***********************************************
			// 해당 경로로 변경
			//b_fname을 b_realfname으로 변경
			File f = new File("C:\\Users\\KOSMO\\git\\Spring_practice\\Dogether_test\\src\\main\\webapp\\resources\\upload\\board\\" + board_realfname);
			//File f = new File("webapp\\resources\\upload\\"+member_realfname);
			System.out.println(f.getAbsolutePath());
			//여기 경로를 실제 서버에서 할때는 바꿔야함----@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
	}
	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getMemberID() {
		return memberID;
	}
	public void setMemberID(String memberID) {
		this.memberID = memberID;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoard_fname() {
		return board_fname;
	}
	public void setBoard_fname(String board_fname) {
		this.board_fname = board_fname;
	}
	public String getBoard_realfname() {
		return board_realfname;
	}
	public void setBoard_realfname(String board_realfname) {
		this.board_realfname = board_realfname;
	}
	public long getBoard_fsize() {
		return board_fsize;
	}
	public void setBoard_fsize(int board_fsize) {
		this.board_fsize = board_fsize;
	}
	public int getBoard_like_count() {
		return board_like_count;
	}
	public void setBoard_like_count(int board_like_count) {
		this.board_like_count = board_like_count;
	}
	public int getSortTypeBST() {
		return sortTypeBST;
	}
	public void setSortTypeBST(int sortTypeBST) {
		this.sortTypeBST = sortTypeBST;
	}
	
}
