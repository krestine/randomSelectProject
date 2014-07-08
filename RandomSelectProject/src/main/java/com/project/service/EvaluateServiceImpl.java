package com.project.service;

import java.util.HashMap;
import java.util.List;

import javax.validation.OverridesAttribute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EvaluateMapper;
import com.project.domain.EvaluateDTO;

@Service
public class EvaluateServiceImpl implements EvaluateService {
	@Autowired
	EvaluateMapper evaluateMapper;

	// 평가 한 방문리스트
	@Override
	public List<EvaluateDTO> getEvaluateListByMemId(String memId) {
		return evaluateMapper.getEvaluateListByMemId(memId);
	}

	@Override
	public List<EvaluateDTO> getEvaluateListByMemId(String memId, int page,
			int limit) {

		int startrow = (page - 1) * 10;

		param.put("memId", memId);
		param.put("startrow", String.valueOf(startrow));
		param.put("endrow", String.valueOf(startrow + limit));
		List<EvaluateDTO> ev = evaluateMapper.getEvaluateListByMemId(param);
		System.out.println("imp:e");
		return ev;
	}

	private static HashMap<String, String> param = new HashMap<String, String>();

	@Override
	public List<EvaluateDTO> getEvaluateListByMemId(
			HashMap<String, String> param) {
		// TODO Auto-generated method stub
		return getEvaluateListByMemId(param);
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
		return getScoreByEvaluateTerms(evaluateDTO);
	}

	// 평가안한 방문리스트
	public List<EvaluateDTO> getnEvaluateListByMemId(String memId) {
		return evaluateMapper.getnEvaluateListByMemId(memId);
	}

	// 평가한 방문리스트 수정
	@Override
	public void setScoreByEvaluateTerms(EvaluateDTO evaluateDto) {
		return;
		// TODO Auto-generated method stub

	}

	// 식당평가 안한 점수 입력
	@Override
	public void putScoreByEvaluateTerms(EvaluateDTO evaluateDTO) {
		return;
	}

	//리스트 개수 
	@Override
	public int getListCount(String memId) {
		// TODO Auto-generated method stub
		return evaluateMapper.getListCount(memId);
	}

	// 데이터 삭제
	@Override
	public void deleteData(String memId, String evalId) {
		return;

	}

}
