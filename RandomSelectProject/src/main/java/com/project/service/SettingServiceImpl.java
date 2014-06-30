package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.SettingMapper;
import com.project.domain.SettingDTO;

@Service
public class SettingServiceImpl implements SettingService{

	@Autowired
	private SettingMapper settingMapper;
	
	@Override
	public List<SettingDTO> getWalkRange() {
		return settingMapper.getWalkRange();
	}

	@Override
	public List<SettingDTO> getCarRange() {
		return settingMapper.getCarRange();
	}

	@Override
	public List<SettingDTO> getExcMenu() {
		return settingMapper.getExcMenu();
	}

	@Override
	public String getExcMenuById(String excMenuId) {
		return settingMapper.getExcMenuById(excMenuId);
	}

}
