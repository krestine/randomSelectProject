package com.project.service;
	

import java.util.List;

import com.project.domain.EvaluateDTO;

public interface EvaluateService {

	EvaluateDTO getEvaluateListByMemId(String memId); 


	List<EvaluateDTO> getEvaluateListByMemId(String memId);  

}
