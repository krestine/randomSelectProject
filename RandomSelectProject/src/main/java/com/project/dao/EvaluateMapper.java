package com.project.dao;

import java.util.List;

import com.project.domain.EvaluateDTO;
import com.project.domain.MateDTO;

public interface EvaluateMapper {
	// 관리자 : 유저의 평가 목록 열람
	List<EvaluateDTO> getEvaluateListByMemId(String memId);


	// 평가한 방문 리스트
	EvaluateDTO getEvaluateListByMemId(Object evalScore);

	// 평가한 방문리스트 수정
	
/*	EvaluateDTO setEvaluateInfoByEvaluateTerms(EvaluateDTO evaluateDto);*/
/*	void setEvaluateInfoByEvaluateTerms(String evaluateDto);*/

	void setEvaluateInfoByEvaluateTerms(String string);

	// 평가안한 방문리스트
	EvaluateDTO getnEvaluateListByMemId(EvaluateDTO evaluateDto);



	// 식당평가 안한 점수 입력
	public void putEvaluateByScore(EvaluateDTO evaluateDto);
	

}


