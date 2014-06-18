package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.RestntMapper;
import com.project.domain.RestntDTO;

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
	public RestntDTO dropRestntById(String restntId) {
		// TODO Auto-generated method stub
		return restntMapper.dropRestntById(restntId);
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
	public List<RestntDTO> getRestntListByAddr(RestntDTO restntDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RestntDTO getRestntInfoById(String restntId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
