package com.project.dao;

import java.util.List;

import com.project.domain.MenuDTO;

public interface MenuMapper {
	
	// 메뉴 리스트
	List<MenuDTO> getMenuListByRestntId(MenuDTO menuDto);
	
	// 메뉴 정보
	MenuDTO getMenuByMenuId(MenuDTO menuDto);
	
	
	
}
