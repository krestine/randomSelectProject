package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EvaluateMapper;
import com.project.domain.EvaluateDTO;

@Service
public class EvaluateServiceImpl implements EvaluateService {
	@Autowired
	EvaluateMapper evaluateMapper;
	
	@Override
	public EvaluateDTO getEvaluateListByMemId(String memId) {
		
		return evaluateMapper.getEvaluateListByMemId(memId);
	}

}
