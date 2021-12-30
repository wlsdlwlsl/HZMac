package com.dogether.service;

import java.util.List;

import com.dogether.domain.BoardVO;
import com.dogether.domain.MemberVO;

public interface MemberService {
	List<MemberVO> getMemberList(MemberVO vo); //모든 유저의 정보가져오기
	MemberVO getMemberInfo(String memberID);//특정 유저의 정보 가져오기
	void updatePoint(String memberID,int price);//포인트 충전하기
	List<BoardVO> myBoardList(String memberID);//내 자랑하기 게시글 가져오기
	int updateMemberInfo(MemberVO vo);//내 정보 수정하기
	// 회원 삭제(탈퇴)하기(관리자페이지)
	public void deleteMember(MemberVO vo);
}
