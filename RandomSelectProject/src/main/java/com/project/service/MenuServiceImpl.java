package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.dao.MenuMapper;
import com.project.domain.MenuDTO;

public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuMapper menuMapper;
	
	// 메뉴 리스트
	@Override
	public List<MenuDTO> getMenuListByRestntId(MenuDTO menuDto) {
		
		return menuMapper.getMenuListByRestntId(menuDto);
	}
	
	// 메뉴 정보
	@Override
	public MenuDTO getMenuByMenuId(MenuDTO menuDto) {
		
		return menuMapper.getMenuByMenuId(menuDto);
	}
	
}
