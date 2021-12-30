package com.dogether.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogether.dao.TestDAOImpl;
import com.dogether.domain.BoardVO;
import com.dogether.domain.MemberVO;

@Service("testService")
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDAOImpl testDAO;
	
	public BoardVO test() {
		return testDAO.getBoardList();
	}
	
	
	@Override
	public MemberVO idCheck_Login(MemberVO vo) {
		return testDAO.idCheck_Login(vo);
	}
	
	@Override
	public MemberVO nickName_Check(MemberVO vo) {
		return testDAO.nickName_Check(vo);
	}


	@Override
	public int memberinsert(MemberVO vo) {
		return testDAO.memberinsert(vo);
	}


	@Override
	public MemberVO login(MemberVO vo) {
		return testDAO.memberLogin(vo);
	}
}
