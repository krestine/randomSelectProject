package com.project.dao;

import java.util.List;

import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;

public interface RestntMapper {
	// 관리자, 회원 : 전체 식당 리스트
	List<RestntDTO> getRestntList();

	// 회원 : 식당 하나
	RestntDTO getRestnt(String restntId);

	// 회원 : 식당 코드
	RestntDTO getRestntId(String restntId);

	// 관리자 : 식당 삭제
	void dropRestntById(String restntId);

	// 관리자 : 식당정보 수정
	void setRestntById(RestntDTO restntdto);

	// 관리자 : 식당정보 추가
	void putRestnt(RestntDTO restntdto);

	// 관리자: 식당관리 - 주소필터 적용 - 식당 리스트
	List<RestntDTO> getRestntListByAddressCode(String addressCode);

	// 관리자, 회원 : 식당관리 - 식당리스트에서 식당선택 - 상세정보 표시
	RestntDTO getRestntInfoById(String restntId);

	List<RestntDTO> getRestntListByAddr(String addressCode);

	// 광역시, 도 필터
	List<SettingDTO> getAdress1();

	// 시/군/구 필터
	List<SettingDTO> getAdress2();

	// 도로명 주소 필터
	List<SettingDTO> getAdress3();
	
	//관리자: 식당관리 - 주소필터 적용 - 식당 리스트 표시
	List<RestntDTO> getRestntListByAddr(SettingDTO settingDto);
	
	// 회원 : 식당 상세정보
	RestntDTO getRestntInfoByName(RestntDTO restntDto);
}
