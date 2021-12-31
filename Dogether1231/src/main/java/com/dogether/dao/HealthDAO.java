package com.dogether.dao;

import java.util.List;

import com.dogether.domain.HealthCareCenterVO;

public interface HealthDAO {
	public List<HealthCareCenterVO> getHealthList(HealthCareCenterVO vo);
}
