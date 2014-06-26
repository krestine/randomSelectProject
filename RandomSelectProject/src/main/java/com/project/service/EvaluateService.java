package com.project.service;

import java.util.List;

import com.project.domain.EvaluateDTO;

public interface EvaluateService {
	
	
	// 평가한 방문 리스트
	List<EvaluateDTO> getEvaluateListByMemId(String memId);

	
	// 평가한 방문리스트 점수 수정

	void setEvaluateInfoByEvaluateTerms(EvaluateDTO evaluateDto);

	// 평가안한 방문리스트
	EvaluateDTO getnEvaluateListByMemId(EvaluateDTO evaluateDto);

	//회원:식당평가 안한 점수 입력
	public void putnEvaluateByScore(EvaluateDTO evaluateDto);

		
	// //////////////////////////////////////////////////////////////////////

	// 회원: 평가한 식당목록
	// 방문날짜,restntId
	List<EvaluateDTO> getVisitsByMemid(String memId);

	// 식당이름
	List<EvaluateDTO> getRestntnameByRestId(List<String> restntId);

	// 평가점수
	List<EvaluateDTO> getScoreByEvaluateTerms(EvaluateDTO evaluateDTO);

	// 회원: 평가 안한 식당목록
	// 방문날짜,restntId
	List<EvaluateDTO> getnEvaluateListByMemId(String memId);

	void putScoreByEvaluateTerms(EvaluateDTO evaluateDTO);

	

}
