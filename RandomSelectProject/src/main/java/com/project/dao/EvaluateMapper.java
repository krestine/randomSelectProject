package com.project.dao;

import java.util.List;

import com.project.domain.EvaluateDTO;

public interface EvaluateMapper {
	// 관리자 : 유저의 평가 목록 열람
	List<EvaluateDTO> getEvaluateListByMemId(String memId);

	// 평가한 방문 리스트
	List<EvaluateDTO> getEvaluateListByMemId(Object evalScore);

	// 평가한 방문리스트 수정

	/* EvaluateDTO setEvaluateInfoByEvaluateTerms(EvaluateDTO evaluateDto); */
	/* void setEvaluateInfoByEvaluateTerms(String evaluateDto); */

	void setEvaluateInfoByEvaluateTerms(String string);

	// 평가안한 방문리스트
	EvaluateDTO getnEvaluateListByMemId(EvaluateDTO evaluateDto);

	// 식당평가 안한 점수 입력
	public void putEvaluateByScore(EvaluateDTO evaluateDto);

	// ///////////////////////////////////////////////////////////////

	// 회원: 평가한 식당목록
	// 방문날짜,restntId
	List<EvaluateDTO> getVisitsByMemid(String memId);

	// 식당이름
	List<EvaluateDTO> getRestntnameByRestId(String restntId);

	// 평가점수
	List<EvaluateDTO> getScoreByEvaluateTerms(EvaluateDTO evaluateDTO);

	// 회원: 평가 안한 식당목록
	// 방문날짜,restntId
	List<EvaluateDTO> getNEvaluateListByMemId(String memId);

	// 회원: 식당 평가 수정 ,입력
	void setScoreByEvaluateTerms(EvaluateDTO evaluateDto);

}
