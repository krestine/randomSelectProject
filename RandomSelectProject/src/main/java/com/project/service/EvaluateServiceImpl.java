package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EvaluateMapper;
import com.project.domain.EvaluateDTO;

@Service
public class EvaluateServiceImpl implements EvaluateService {
	@Autowired
	EvaluateMapper evaluateMapper;

	// 평가한 방문 리스트
	public EvaluateDTO getEvaluateListByMemId11(EvaluateDTO evaluateDto) {
		return evaluateMapper.getnEvaluateListByMemId(evaluateDto);

	}

	// 평가한 방문리스트 수정

	public void setEvaluateInfoByEvaluateTerms(String string) {
		return;
	};

	/* void setEvaluateInfoByEvaluateTerms(String evaluateDto); */

	// 평가안한 방문리스트
	public EvaluateDTO getnEvaluateListByMemId(EvaluateDTO evaluateDto) {
		return evaluateMapper.getnEvaluateListByMemId(evaluateDto);

	}

	// 식당평가 안한 점수 입력
	public void putEvaluateByScore(EvaluateDTO evaluateDto) {

	}

	@Override
	public List<EvaluateDTO> getEvaluateListByMemId(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EvaluateDTO getEvaluateListByMemId(Object evalScore) {
		// TODO Auto-generated method stub
		return null;
	};

	// //////////////////////////////////////////////////

	// 회원: 평가한 식당목록
	// 방문날짜,restntId
	public List<EvaluateDTO> getVisitsByMemid(String memId) {
		return evaluateMapper.getVisitsByMemid(memId);
	}

	// 식당이름
	public List<EvaluateDTO> getRestntnameByRestId(String restntId) {
		return evaluateMapper.getRestntnameByRestId(restntId);
	}

	// 평가점수
	public List<EvaluateDTO> getScoreByEvaluateTerms(EvaluateDTO evaluateDTO) {
		return evaluateMapper.getScoreByEvaluateTerms(evaluateDTO);
	}

	// 회원: 평가 안한 식당목록
	// 방문날짜,restntId
	public List<EvaluateDTO> getNevaluateListByMemId(String memId) {
		return evaluateMapper.getNevaluateListByMemId(memId);
	}

	// 회원: 식당 평가 수정 ,입력
	public void setScoreByEvaluateTerms(EvaluateDTO evaluateDTO) {
		evaluateMapper.setScoreByEvaluateTerms(evaluateDTO);
	}

}
