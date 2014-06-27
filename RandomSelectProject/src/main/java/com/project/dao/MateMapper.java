package com.project.dao;

import java.util.List;

import com.project.domain.MateDTO;

public interface MateMapper {
	//  회원 : 친구 리스
	List<MateDTO> getMates();

	// 회원 : 친구 아이디
	MateDTO getMateId(String mateDto);
	
	// 회원 : 친구 정보
	//String getMateId(String mateDto);
	String getMateInfo(String memName);

}
