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
	public EvaluateDTO getEvaluateListByMemId11(EvaluateDTO evaluateDto) {
		return evaluateMapper.getnEvaluateListByMemId(evaluateDto);

	}
		

		// 평가한 방문리스트 수정

	public void setEvaluateInfoByEvaluateTerms(String string){
		return;
	};

	/*	void setEvaluateInfoByEvaluateTerms(String evaluateDto);*/



		// 평가안한 방문리스트
		public EvaluateDTO getnEvaluateListByMemId(EvaluateDTO evaluateDto) {
			return evaluateMapper.getnEvaluateListByMemId(evaluateDto);

		}


		 // 식당평가 안한 점수 입력
		public void putEvaluateByScore(EvaluateDTO evaluateDto){
			
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
		 
	
}




	
	
	

	
	  