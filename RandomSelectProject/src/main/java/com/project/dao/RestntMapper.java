package com.project.dao;

import java.util.List;

import com.project.domain.RestntDTO;

public interface RestntMapper {
	// 관리자 : 식당 전체 리스트
	List<RestntDTO> getRestntList();

	// 공통, 회원, 관리자 : 식당 시/도 필터 적용 후 리스트
	List<RestntDTO> getRestntListByAddressCode(String addressCode);
	
	// 관리자 : 식당 삭제
	void dropRestntByRestntId(String restntId);

	// 관리자 : 식당 수정
	void setRestntByRestntId(RestntDTO restntDto);

	// 관리자 : 식당 추가
	void putRestnt(RestntDTO restntDto);

	// 관리자 : 식당관리 - 식당리스트에서 식당선택 - 상세정보 표시
	RestntDTO getRestntInfoById(String restntId);
}
