package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
=======
import org.springframework.stereotype.Service;

import com.project.dao.MenuMapper;
import com.project.domain.MenuDTO;
@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	MenuMapper menuMapper;
	
	@Override
	// 관리자: 메뉴 리스트
	public List<MenuDTO> getMenuListByRestntId(MenuDTO menuDto) {
		// TODO Auto-generated method stub
		return menuMapper.getMenuListByRestntId(menuDto);
	}
	
	// 관리자 : 메뉴 상세 정보표시
	@Override
	public MenuDTO getMenuInfoByMenuId(String menuId) {
		// TODO Auto-generated method stub
		return menuMapper.getMenuInfoByMenuId(menuId);
	}
	
	// 관리자 : 메뉴 추가
	@Override
	public void putMenu(MenuDTO menuDto) {
		menuMapper.putMenu(menuDto);
		
	}
	
	// 관리자 : 메뉴 수정
	@Override
	public void setMenuByMenuId(MenuDTO menuDto) {
		menuMapper.setMenuByMenuId(menuDto);
		
	}
	
	// 관리자 : 메뉴 삭제
	@Override
	public void dropMenuByMenuId(String menuId) {
		menuMapper.dropMenuByMenuId(menuId);
		
	}
>>>>>>> 299f68b1c74ac87f0a0d11e6dc0020beed92c1f3

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
