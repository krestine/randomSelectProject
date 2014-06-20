package com.project.service;

import java.util.List;

import com.project.domain.EvaluateDTO;
import com.project.domain.MemberDTO;

public interface EvaluateService {
	List<EvaluateDTO> getEvaluateListByMemId(String memId);

	// 로그인
	MemberDTO getMemberInfoByMemberTerms(MemberDTO memberDto);

	// 평가한 방문 리스트
	EvaluateDTO getEvaluateListByMemid(Object evalScore);

	// 평가한 방문리스트 수정
/*	EvaluateDTO setEvaluateInfoByEvaluateTerms(EvaluateDTO evaluateDto);*/
	void setEvaluateInfoByEvaluateTerms(String evaluateDto);
	// 평가안한 방문리스트
	EvaluateDTO getnEvaluateListByMemId(EvaluateDTO evaluateDto);



	/*// 식당평가 안한 점수 입력
	 EvaluateDTO setEvaluationInfoByEvaluationTerms(EvaluateDTO evaluateDto);
	*/

}



