package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.velocity.runtime.directive.Evaluate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EvaluateMapper;
import com.project.domain.EvaluateDTO;

@Service
public class EvaluateServiceImpl implements EvaluateService {
	@Autowired
	EvaluateMapper evaluateMapper;

	// 평가 한 방문리스트
	private static HashMap<String, Object> param = new HashMap<String, Object>();

	@Override
	public List<EvaluateDTO> getEvaluateListByMemId(HashMap<String, Object> param) {
		// TODO Auto-generated method stub
	
		return 	evaluateMapper.getEvaluateListByMemId(param);
	}

	// 식당이름
	@Override
	public List<EvaluateDTO> getRestntnameByRestId(String restntId) {
		// TODO Auto-generated method stub
		return getRestntnameByRestId(restntId);
	}

	// 평가점수
	@Override
	public List<EvaluateDTO> getScoreByEvaluateTerms(EvaluateDTO evaluateDTO) {
		// TODO Auto-generated method stub
		return evaluateMapper.getScoreByEvaluateTerms(evaluateDTO);
	}

	// 평가안한 방문리스트
	public List<EvaluateDTO> getnEvaluateListByMemId(String memId) {
		return evaluateMapper.getnEvaluateListByMemId(memId);
	}

	// 평가한 방문리스트 수정
	@Override
	public void setScoreByEvaluateTerms(EvaluateDTO evaluateDto) {
		evaluateMapper.setScoreByEvaluateTerms(evaluateDto);
		// TODO Auto-generated method stub
	}

	//리스트 개수 
	@Override
	public int getListCount(String memId) {
		// TODO Auto-generated method stub
		return evaluateMapper.getListCount(memId);
	}

	// 데이터 삭제
	@Override
//	public void deleteData(String memId, String evalId) {
	public void deleteData(Map<String, String> map) {
	evaluateMapper.deleteData(map);
	}
//평가안한 점수 입력
	@Override
	public void setScoreByEvaluateTerms1(EvaluateDTO evaluateDto) {
		evaluateMapper.setScoreByEvaluateTerms1(evaluateDto);
		
		
	}


}