package com.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.EvaluateMapper;
import com.project.domain.EvaluateDTO;

@Service
public class EvaluateServiceImpl implements EvaluateService {
	@Autowired
	EvaluateMapper evaluateMapper;

	private static HashMap<String, String> param = new HashMap<String, String>();

	// 평가한 방문리스트 수정

	public void setEvaluateInfoByEvaluateTerms(String string) {
		return;
	};

	/* void setEvaluateInfoByEvaluateTerms(String evaluateDto); */

	// 평가안한 방문리스트
	public List<EvaluateDTO> getnEvaluateListByMemId(String memId) {
		return evaluateMapper.getnEvaluateListByMemId(memId);
	}

	// 식당평가 안한 점수 입력
	public void putEvaluateByScore(String evaluateDto) {
		evaluateMapper.putEvaluateByScore(evaluateDto);

	}

	@Override
	public void setEvaluateInfoByEvaluateTerms(EvaluateDTO evaluateDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public EvaluateDTO getnEvaluateListByMemId(EvaluateDTO evaluateDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void putnEvaluateByScore(EvaluateDTO evaluateDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<EvaluateDTO> getVisitsByMemid(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EvaluateDTO> getRestntnameByRestId(List<String> restntId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EvaluateDTO> getScoreByEvaluateTerms(EvaluateDTO evaluateDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void putScoreByEvaluateTerms(EvaluateDTO evaluateDTO) {
		// TODO Auto-generated method stub

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

		// return evaluateMapper.getEvaluateListByMemId(memId, page, limit);
	}

	@Override
	public int getListCount(String memId) {
		// TODO Auto-generated method stub
		return evaluateMapper.getListCount(memId);
	}

	@Override
	public List<EvaluateDTO> getEvaluateListByMemId(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

}
