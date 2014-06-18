package com.project.dao;

import java.util.List;

import com.project.domain.EvaluateDTO;

public interface EvaluateMapper {
	//관리자 : 유저의 평가 목록 열람
	List<EvaluateDTO> getEvaluateListByMemId(String memId); 
}
