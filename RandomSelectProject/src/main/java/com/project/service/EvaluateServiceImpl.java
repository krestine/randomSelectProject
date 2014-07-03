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
	public List<EvaluateDTO> getEvaluateListByMemId(String memId) {
		return evaluateMapper.getEvaluateListByMemId(memId);
	}

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
	public List<EvaluateDTO> getEvaluateListByMemId() {
		// TODO Auto-generated method stub
		return null;
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
	
	// 회원 : 평가한 친구의 식당목록
	 @Override
	 public List<EvaluateDTO> getEvaluateListByMateId(String memId) {
	 		
	 		return evaluateMapper.getEvaluateListByMateId(memId);
	 }

	// //////////////////////////////////////////////////

	/*// 회원: 평가한 식당목록
	// 방문날짜,restntId
	public List<EvaluateDTO> getVisitsByMemId(String memId) {
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
	
	// 회원: 식당 평가 수정 ,입력
	public void setScoreByEvaluateTerms(EvaluateDTO evaluateDTO) {
		((EvaluateServiceImpl) evaluateMapper)
				.setScoreByEvaluateTerms(evaluateDTO);
	}

	@Override
	public void setEvaluateInfoByEvaluateTerms(EvaluateDTO evaluateDto) {

	}

	@Override
	public List<EvaluateDTO> getRestntnameByRestId(List<String> restntId) {
		// 
		return null;
	}

	@Override
	public EvaluateDTO getnEvaluateListByMemId(EvaluateDTO evaluateDto) {
		
		return null;
	}

	@Override
	public void putnEvaluateByScore(EvaluateDTO evaluateDto) {
		

	}

	@Override
	public void putScoreByEvaluateTerms(EvaluateDTO evaluateDTO) {
		

	}

	@Override
	public List<EvaluateDTO> getEvaluateListByMemId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<EvaluateDTO> getVisitsByMemid(String memId) {
		// TODO Auto-generated method stub
		return null;
	}
*/
	
	
	
	

}
