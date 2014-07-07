
package com.project.service;

import java.util.List;

import com.project.domain.MateDTO;
import com.project.domain.MemberDTO;

public interface MateService {
	//  회원 : 친구 리스트
	List<MateDTO> getMateListByMemId(String memId);

	// 회원 : 친구 아이디
	MateDTO getMateIdByMateId(String mateId);
	
	// 회원 : 친구의 상태정보
	//String getMateId(String mateDto);
	MateDTO getMateInfoByMateId(String memId, String mateId);
	
	// 회원 : 친구의 회원정보
	MateDTO getMemInfoByMemId(String mateId);
	
}
	



