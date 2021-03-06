package com.project.dao;

import java.util.List;

import com.project.domain.MenuDTO;

public interface MenuMapper {
	
	// 관리자: 메뉴 리스트
	List<MenuDTO> getMenuListByRestntId(String restntId);

	// 관리자, 회원 : 메뉴 상세 정보표시
	MenuDTO getMenuInfoByMenuId(String menuId);

	// 관리자 : 메뉴 추가
	void putMenu(MenuDTO menuDto);

	// 관리자 : 메뉴 수정
	void setMenuByMenuId(MenuDTO menuDto);

	// 관리자 : 메뉴 삭제
	void dropMenuByMenuId(String menuId);
	
	
	void addMenuCancel(String menuId); 
	
	String getLastMenuId(String restntId);
	
	void addMenuForm(MenuDTO menuDto);
		
}
