package com.project.service;

import java.util.List;

import com.project.domain.SettingDTO;

public interface SettingService {
	List<SettingDTO> getWalkRange();
	List<SettingDTO> getCarRange();
	List<SettingDTO> getExcMenu();
	String getExcMenuById(String excMenuId); 
	List<String> getGradeValue();
}
