package com.project.service;

import java.util.List;

import com.project.domain.SettingDTO;

public interface SettingService {
	List<SettingDTO> getWalkRange();

	List<SettingDTO> getCarRange();

	List<SettingDTO> getExcMenu();

	String getExcMenuById(String excMenuId);

	List<String> getGradeValue();

	List<String> getAdress1();

	List<String> getAdress2(SettingDTO settingDto);

	List<String> getAdress3(SettingDTO settingDto);
}
