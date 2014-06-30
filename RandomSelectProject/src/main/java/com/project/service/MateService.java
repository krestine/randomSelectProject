
package com.project.service;

import java.util.List;

import com.project.domain.MateDTO;

public interface MateService {
	// 회원 : 친구 리스트
	List<MateDTO> getMates();

	// 회원 : 친구 아이디
	MateDTO getMateId(String mateId);
	
	// 회원 : 친구 정보
	//String getMateId(String mateDto);
	String getMateInfo(String mateId);

}

/*
package com.project.service;

import java.util.List;

import com.project.domain.MateDTO;

public interface MateService {
	// 회원 : 친구 리스트
	List<MateDTO> getMateListByMateId();

	// 회원 : 친구 아이디
	MateDTO getMateIdByMateId(String mateDto);
	
	// 회원 : 친구 정보
	MateDTO getMateInfoByMateId(String mateDto);
	
}
*/

