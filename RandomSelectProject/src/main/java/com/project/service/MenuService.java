package com.project.service;

import java.util.List;

import com.project.domain.MenuDTO;
<<<<<<< HEAD

public interface MenuService {
	//메뉴 리스트
	List<MenuDTO> getMenuListByRestntId(MenuDTO menuDto);
	
	//메뉴정보
	MenuDTO getMenuByMenuId(MenuDTO menuDto);
=======

public interface MenuService {
	// 관리자: 메뉴 리스트
	List<MenuDTO> getMenuListByRestntId(MenuDTO menuDto);

	// 관리자 : 메뉴 상세 정보표시
	MenuDTO getMenuInfoByMenuId(String menuId);

	// 관리자 : 메뉴 추가
	void putMenu(MenuDTO menuDto);

	// 관리자 : 메뉴 수정
	void setMenuByMenuId(MenuDTO menuDto);

	// 관리자 : 메뉴 삭제
	void dropMenuByMenuId(String menuId);
>>>>>>> 299f68b1c74ac87f0a0d11e6dc0020beed92c1f3
}
