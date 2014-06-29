package com.project.dao;

import java.util.List;

import com.project.domain.SettingDTO;

public interface SettingMapper {
	List<SettingDTO> getWalkRange();
	List<SettingDTO> getCarRange();
	List<SettingDTO> getExcMenu();
	String getExcMenuById(String excMenuId);
}
