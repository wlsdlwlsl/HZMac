package com.dogether.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogether.dao.MemberDAOImpl;
import com.dogether.domain.BoardVO;
import com.dogether.domain.MemberVO;

@Repository("memberService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAOImpl memberDAO; 
	
	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {//모든 유저
		return memberDAO.getMemberList(vo);
	}

	@Override
	public MemberVO getMemberInfo(String memberID) {//특정 유저
		return memberDAO.getMemberInfo(memberID);
	}

	@Override
	public void updatePoint(String memberID,int price) {
		memberDAO.updatePoint(memberID,price);
	}

	@Override
	public List<BoardVO> myBoardList(String memberID) {
		return memberDAO.myBoardList(memberID);
	}

	@Override
	public int updateMemberInfo(MemberVO vo) {
		return memberDAO.updateMemberInfo(vo);
	}
	// 회원 삭제(탈퇴)하기(관리자페이지)
	@Override
	public void deleteMember(MemberVO vo) {
		System.out.println("Service에서 회원 삭제(탈퇴) 호출함");
		memberDAO.deleteMember(vo);		
	}
	//총 회원 수(관리자페이지)
	@Override
	public int getMemberCount() {
		System.out.println("Service에서 총 회원 수 호출함");
		return memberDAO.getMemberCount();		
	}

	@Override
	public List<HashMap<String, Object>> myrunninggooList(String memberID) {
		return memberDAO.myrunninggooList(memberID);
	}

	@Override
	public List<HashMap<String, Object>> myhostrunninggooList(String memberID) {
		return memberDAO.myhostrunninggooList(memberID);
	}

}
