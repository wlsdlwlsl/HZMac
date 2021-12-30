package com.dogether.dao;

import java.util.List;

import com.dogether.domain.BoardVO;
import com.dogether.domain.MemberVO;

public interface MemberDAO {
	public List<MemberVO> getMemberList(MemberVO vo);//모든 유저
	public MemberVO getMemberInfo(String memberID);//특정 유저의 정보가져오기
	public void updatePoint(String memberID,int price);//포인트 추가하기
	public List<BoardVO> myBoardList(String memberID);//내 자랑하기 게시글 목록 가져오기
	public int updateMemberInfo(MemberVO vo);//내정보 수정하기
	// 회원 삭제(탈퇴)하기(관리자페이지)
	public void deleteMember(MemberVO vo);

}
