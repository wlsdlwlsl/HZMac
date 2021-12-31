package com.dogether.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogether.domain.AdminVO;

@Repository("adminLoginDAO")
public class AdminLoginDAOImpl implements AdminLoginDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public AdminVO adminIdCheck_Login(AdminVO vo) {
		System.out.println("===> adminIdCheck 호출");
		return mybatis.selectOne("adminLoginDAO.adminIdCheck",vo);
	}

}
