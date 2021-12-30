package com.dogether.dao;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogether.domain.BoardVO;
import com.dogether.domain.MemberVO;

@Repository("testDAO")
public class TestDAOImpl implements TestDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public BoardVO getBoardList() {
		return mybatis.selectOne("BoardDAO.getBoardList");
	}
	
	
	public MemberVO idCheck_Login(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.id_check",vo);
	}
	
	@Override
	public MemberVO nickName_Check(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.nickName_check",vo);
	}



	@Override
	public int memberinsert(MemberVO vo) {
		return mybatis.insert("MemberDAO.memberinsert", vo);
	}

	@Override
	public MemberVO memberLogin(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.memberLogin",vo);
	}


}
