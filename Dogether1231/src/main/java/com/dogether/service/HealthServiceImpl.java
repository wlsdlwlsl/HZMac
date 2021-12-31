package com.dogether.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogether.dao.HealthDAOImpl;
import com.dogether.domain.HealthCareCenterVO;

@Service("healthService")
public class HealthServiceImpl implements HealthService{

	@Autowired
	public HealthDAOImpl healthDAO;
	
	@Override
	public List<HealthCareCenterVO> getHealthList(HealthCareCenterVO vo) {
		return healthDAO.getHealthList(vo);
	}
	
}
