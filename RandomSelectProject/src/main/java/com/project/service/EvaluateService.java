package com.project.service;

import java.util.List;

import com.project.domain.EvaluateDTO;

public interface EvaluateService {
	List<EvaluateDTO> getEvaluateListByMemId(String memId);  
}
