package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.RestntMapper;
import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;

@Service
public class RestntServiceImpl implements RestntService {

	@Autowired
	RestntMapper restntMapper;

	@Override
	public List<RestntDTO> getRestntList() {
		// TODO Auto-generated method stub
		return restntMapper.getRestntList();
	}

	@Override
	public void dropRestntById(String restntId) {
		restntMapper.dropRestntById(restntId);

	}

	@Override
	public void setRestntById(RestntDTO restntDto) {
		restntMapper.setRestntById(restntDto);

	}

	@Override
	public void putRestnt(RestntDTO restntDto) {
		restntMapper.putRestnt(restntDto);

	}

	@Override
	public RestntDTO getRestntInfoById(String restntId) {

		return restntMapper.getRestntInfoById(restntId);
	}

	@Override
	public List<RestntDTO> getRestntListByAddressCode(String addressCode) {
		// TODO Auto-generated method stub
		return restntMapper.getRestntListByAddr(addressCode);
	}

	// 히원 : 식당하나
	@Override
	public RestntDTO getRestnt(String restntId) {

		return restntMapper.getRestnt(restntId);
	}

	@Override
	public List<RestntDTO> getRestntListByAddr(SettingDTO settingDto) {
		// TODO Auto-generated method stub
		return restntMapper.getRestntListByAddr(settingDto);
	}

}
