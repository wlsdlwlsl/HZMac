package com.dogether.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogether.domain.BoardVO;
import com.dogether.domain.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<MemberVO> getMemberList(MemberVO vo) {
		return mybatis.selectList("MemberDAO.getMemberList", vo);
	}

	@Override
	public MemberVO getMemberInfo(String memberID) {
		return mybatis.selectOne("MemberDAO.getMemberInfo", memberID);
	}

	@Override
	public void updatePoint(String memberID,int price) {
		Map<String,Object> mp = new HashMap<>();
		mp.put("memberID", memberID);
		mp.put("price", price);
		mybatis.insert("MemberDAO.updatePoint", mp);
	}

	@Override
	public List<BoardVO> myBoardList(String memberID) {
		System.out.println(memberID+"000");
		return mybatis.selectList("MemberDAO.myBoardList", memberID);
	}

	@Override
	public int updateMemberInfo(MemberVO vo) {
		return mybatis.update("MemberDAO.updateMemberInfo", vo);
	}

	// 회원 삭제(탈퇴)하기(관리자페이지)
	@Override
	public void deleteMember(MemberVO vo) {
		System.out.println("mybatis 회원 삭제(탈퇴) 호출함");
		System.out.println(vo.getMemberID()+"회원번호");
		mybatis.delete("MemberDAO.deleteMember", vo);		
	}	
}
