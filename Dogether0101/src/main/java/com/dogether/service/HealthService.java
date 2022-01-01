package com.dogether.service;

import java.util.List;

import com.dogether.domain.HealthCareCenterVO;

public interface HealthService {
	public List<HealthCareCenterVO> getHealthList(HealthCareCenterVO vo);
}
