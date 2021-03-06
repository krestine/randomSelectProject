package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MenuMapper;
import com.project.domain.MenuDTO;
@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	MenuMapper menuMapper;
	
	@Override
	// 관리자, 회원 : 메뉴 리스트
	public List<MenuDTO> getMenuListByRestntId(String restntId) {
		// TODO Auto-generated method stub
		return menuMapper.getMenuListByRestntId(restntId);
	}
	
	// 관리자, 회원 : 메뉴 상세 정보표시
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
	
	// 관리자 : 메뉴 추가 취소
	@Override
	public void addMenuCancel(String menuId) {
		menuMapper.addMenuCancel(menuId);
		
	}
	// 관리자 : 마지막 메뉴 아이디 불러오기
	@Override
	public String getLastMenuId(String restntId) {
		
		return menuMapper.getLastMenuId(restntId);
	}

	@Override
	public void addMenuForm(MenuDTO menuDto) {
		menuMapper.addMenuForm(menuDto);
		
	}

}
