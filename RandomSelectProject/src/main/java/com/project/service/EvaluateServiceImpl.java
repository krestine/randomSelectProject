package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EvaluateMapper;
import com.project.domain.EvaluateDTO;
import com.project.domain.MemberDTO;

@Service
public class EvaluateServiceImpl implements EvaluateService {
	@Autowired
	EvaluateMapper evaluateMapper;

	// 평가한 방문 리스트

	public EvaluateDTO getEvaluateListByMemId(EvaluateDTO evaluateDto) {
		return evaluateMapper.getEvaluateListByMemId(evaluateDto);
	}

	// 평가한 방문리스트 수정
	public EvaluateDTO setEvaluateInfoByEvaluateTerms(
			EvaluateDTO evaluateDto) {
		return evaluateMapper.setEvaluateInfoByEvaluateTerms(evaluateDto);
	}

	// 평가안한 방문리스트
	public EvaluateDTO getnEvaluationListByMemId(EvaluateDTO evaluateDto) {
		return evaluateMapper.getnEvaluateListByMemId(evaluateDto);

	}

	/*
	 * //식당평가 안한 점수 입력 public EvaluateDTO
	 * setEvaluationInfoByEvaluationTerms(EvaluateDTO evaluateDto){ return
	 * evaluateMapper.setEvaluationInfoByEvaluationTerms(evaluateDto); }
	 */

	@Override
	public List<EvaluateDTO> getEvaluateListByMemId(String memId) {

		return evaluateMapper.getEvaluateListByMemId(memId);
	}

	@Override
	public MemberDTO getMemberInfoByMemberTerms(MemberDTO memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EvaluateDTO getEvaluateListByMemid(EvaluateDTO evaluateDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EvaluateDTO getnEvaluateListByMemId(EvaluateDTO evaluateDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EvaluateDTO setEvaluateInfoByEvaluateTerms(String string) {
		// TODO Auto-generated method stub
		return null;
	}

}
