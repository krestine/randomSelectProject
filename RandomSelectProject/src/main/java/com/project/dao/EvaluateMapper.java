package com.project.dao;

import java.util.HashMap;
import java.util.List;

import com.project.domain.EvaluateDTO;

public interface EvaluateMapper {

	// 관리자 : 유저의 평가 목록 열람
			// 회원: 평가한 식당목록. 평가한 방문 리스트
			List<EvaluateDTO> getEvaluateListByMemId(HashMap<String, String> param);
			List<EvaluateDTO> getEvaluateListByMemId(String memId,int page,int limit);
			List<EvaluateDTO> getEvaluateListByMemId(String memId);
			// 식당이름
			List<EvaluateDTO> getRestntnameByRestId(String restntId);

			

			/* EvaluateDTO setEvaluateInfoByEvaluateTerms(EvaluateDTO evaluateDto); */
			/* void setEvaluateInfoByEvaluateTerms(String evaluateDto); */

			// 평가점수
			List<EvaluateDTO> getScoreByEvaluateTerms(EvaluateDTO evaluateDTO);

			// 회원:평가안한 방문리스트. 방문날짜 restntId
			List<EvaluateDTO> getnEvaluateListByMemId(String memId);

			// 회원:식당평가 안한 점수 입력,  평가한 방문리스트 수정
			public void setScoreByEvaluateTerms(EvaluateDTO evaluateDto);

			// ///////////////////////////////////////////////////////////////

			// 회원: 평가한 식당목록
			// 방문날짜,restntId

			/*List<EvaluateDTO> getVisitsByMemid(String memId);*/
	        //  리스트 개수 
			int getListCount(String memId);
			// 게시물 삭제 
			public void deleteData(String memId, String evalId);
		
		

	}
