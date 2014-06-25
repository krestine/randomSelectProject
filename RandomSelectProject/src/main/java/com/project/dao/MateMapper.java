package com.project.dao;

import java.util.List;

import com.project.domain.MateDTO;

public interface MateMapper {
	// 회원 : 친구 리스트
	List<MateDTO> getMateIdsByMemId();

	// 회원 : 친구 아이디
	MateDTO getMateIdByMemId(String mateDto);
	
	// 회원 : 친구 정보
	MateDTO getMateInfoByMemId(String mateDto);
}
