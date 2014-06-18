package com.project.service;

import java.util.List;

import com.project.domain.RestntDTO;
<<<<<<< HEAD

public interface RestntService {
	
	// 식당 리스트
	List<RestntDTO> getRestntListByRestntTerms(RestntDTO restntDto);
	
	// 식당 정보
	RestntDTO getRestntByRestntId(RestntDTO restntDto);
	
	
=======

public interface RestntService {
	// 관리자 : 전체 식당 리스트
	List<RestntDTO> getRestntList();

	// 관리자 : 식당 삭제
	RestntDTO dropRestntById(String restntId);

	// 관리자 : 식당정보 수정
	void setRestntById(RestntDTO resntDto);

	// 관리자 : 식당정보 추가
	void putRestnt(RestntDTO restntDto);

	// 관리자: 식당관리 - 주소필터 적용 - 식당 리스트
	List<RestntDTO> getRestntListByAddr(RestntDTO restntDto);

	// 관리자 : 식당관리 - 식당리스트에서 식당선택 - 상세정보 표시
	RestntDTO getRestntInfoById(String restntId);
>>>>>>> 299f68b1c74ac87f0a0d11e6dc0020beed92c1f3
}
