package com.project.service;

import com.project.domain.EvaluateDTO;
import com.project.domain.MateDTO;

public interface EvaluateService {
	// 관리자 : 유저의 평가 목록 열람
	EvaluateDTO getEvaluateListByMemId(String memId);

	// 회원 : 유저의 평가
	MateDTO getEvaluateByMemId(String memId);
}
