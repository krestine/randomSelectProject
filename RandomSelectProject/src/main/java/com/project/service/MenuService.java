package com.project.service;

import java.util.List;

import com.project.domain.MenuDTO;

public interface MenuService {
	//메뉴 리스트
	List<MenuDTO> getMenuListByRestntId(MenuDTO menuDto);
	
	//메뉴정보
	MenuDTO getMenuByMenuId(MenuDTO menuDto);
}
