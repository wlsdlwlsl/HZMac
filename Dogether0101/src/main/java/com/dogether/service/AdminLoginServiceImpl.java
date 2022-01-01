package com.dogether.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogether.dao.AdminLoginDAOImpl;
import com.dogether.domain.AdminVO;

@Service("adminLoginService")
public class AdminLoginServiceImpl implements AdminLoginService {

	@Autowired
	private AdminLoginDAOImpl AdminLoginDAO;
	
	@Override
	public AdminVO adminIdCheck_Login(AdminVO vo) {
		return AdminLoginDAO.adminIdCheck_Login(vo);
	}

}
