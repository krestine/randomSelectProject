package com.project.service;

import java.util.List;

import com.project.domain.MenuDTO;

public interface MenuService {
	// 관리자, 회원 : 메뉴 리스트
	List<MenuDTO> getMenuListByRestntId(String restntId);
	
	// 관리자, 회원 : 메뉴 상세 정보표시
	MenuDTO getMenuInfoByMenuId(String menuId);

	// 관리자 : 메뉴 추가
	void putMenu(MenuDTO menuDto);

	// 관리자 : 메뉴 수정
	void setMenuByMenuId(MenuDTO menuDto);

	// 관리자 : 메뉴 삭제
	void dropMenuByMenuId(String menuId);
	
	// 관리자 : 메뉴 추가 취소
	void addMenuCancel(String menuId);
	// 관리자 : 마지막 메뉴 아이디 불러오기
	String getLastMenuId(String restntId);
	
	void addMenuForm(MenuDTO menuDto);
}
