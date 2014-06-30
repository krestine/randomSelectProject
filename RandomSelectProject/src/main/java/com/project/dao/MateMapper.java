
package com.project.dao;

import java.util.List;

import com.project.domain.MateDTO;

public interface MateMapper {
	//  회원 : 친구 리스트
	List<MateDTO> getMateListByMemId();

	// 회원 : 친구 아이디
	MateDTO getMateIdByMateId(String mateId);
	
	// 회원 : 친구 정보
	//String getMateId(String mateDto);
	String getMateInfoByMateId(String mateId);

}

