package com.dogether.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dogether.domain.HealthCareCenterVO;

@Repository("healthDAO")
public class HealthDAOImpl implements HealthDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<HealthCareCenterVO> getHealthList(HealthCareCenterVO vo) {
		return mybatis.selectList("HealthcenterDAO.getHealthcenterList",vo);
	
	}

}
