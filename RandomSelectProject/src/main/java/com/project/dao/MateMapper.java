
package com.project.dao;

import java.util.List;

import com.project.domain.MateDTO;
import com.project.domain.MemberDTO;
import com.project.domain.RestntDTO;

public interface MateMapper {
	//  회원 : 친구 리스트
	List<MateDTO> getMateListByMemId(MateDTO mateDto);

	// 회원 : 친구 아이디
	MateDTO getMateIdByMateId(String mateId);
	
	// 회원 : 친구의 상태정보
	//String getMateId(String mateDto);
	MateDTO getMateInfoByMateId(MateDTO mateDto);
	
	// 회원 : 친구의 회원정보
	MateDTO getMemInfoByMemId(String mateId);
	
	// 친구 리스트 페이징 구현 : 페이지 총 갯수
	Integer mateListTotalCount(MateDTO restntDto);
	
	// 친구 리스트 페이징 구현 : 리스트 그리기
	List<MateDTO> mateListPaging(MateDTO mateDto);
	

}

