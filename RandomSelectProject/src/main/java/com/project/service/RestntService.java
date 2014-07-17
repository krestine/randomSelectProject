package com.project.service;

import java.util.List;

import com.project.domain.LatLngDTO;
import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;

public interface RestntService {
	// 관리자, 회원 : 전체 식당 리스트
	List<RestntDTO> getRestntList();

	// 회원 : 식당 하나
	RestntDTO getRestnt(String restntId);

	// 관리자 : 식당 삭제
	void dropRestntById(String restntId);

	// 관리자 : 식당정보 수정
	void setRestntById(RestntDTO restntDto);

	// 관리자 : 식당정보 추가
	void putRestnt(RestntDTO restntDto);

	// 관리자 : 식당관리 - 식당리스트에서 식당선택 - 상세정보 표시
	RestntDTO getRestntInfoById(String restntId);

	// 관리자: 식당관리 - 주소필터 적용 - 식당 리스트
	List<RestntDTO> getRestntListByAddressCode(String addressCode);

	// 관리자: 식당관리 - 주소필터 적용 - 식당 리스트
	List<RestntDTO> getRestntListByAddr(RestntDTO restntDto);

	// 회원 : 식당 상세정보
	RestntDTO getRestntInfoByRestntId(String restntId);

	// 식당 추가 : id 지정 로직에 필요: 해당 지역의 마지막으로 등록된 식당의 아이디 값 가져오기
	String getLastRestntId(RestntDTO restntDto);

	// 식당 추가 : id 지정 로직에 필요: 해당 지역의 지역 코드 불러오기
	String getAdressCode(RestntDTO restntDto);

	// 회원 : 친구가 평가한 식당 리스트
	List<RestntDTO> getEvalRestntListByMateId(String memId);

	// 식당 리스트 페이징 구현 : 총 갯수 가져오기
	Integer restntListTotalCount(RestntDTO restntDto);

	// 식당 리스트 페이징 구현 : 리스트 그리기
	List<RestntDTO> restntListPaging(RestntDTO restntDto);

	List<RestntDTO> getRestntFullAddress(RestntDTO restntDto);
	List<RestntDTO> getRestntListByAdress(RestntDTO restntDto);
	List<RestntDTO> getRestntListByAdress2(RestntDTO restntDto);
	List<RestntDTO> getRestntListByLatLng(LatLngDTO latLngDto);

	void setRestntLocationInfo(RestntDTO restntDto);

}
