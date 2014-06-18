package com.project.service;

import java.util.List;

import com.project.domain.MateDTO;

public interface MateService {
	
	// 회원 : 친구목록
	List<MateDTO> getMateIdsByMemId(MateDTO mateDto);
	
	// 회원 : 친구아이디
	MateDTO getMateIdByMemId(MateDTO mateDto);
	
	
	
}
