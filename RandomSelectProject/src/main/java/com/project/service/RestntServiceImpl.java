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
		return restntMapper.getRestntList();
	}

	@Override
	public void dropRestntByRestntId(String restntId) {

	}

	@Override
	public void setRestntByRestntId(RestntDTO restntDto) {
		
	}

	@Override
	public void putRestnt(RestntDTO restntDto) {
		
	}

	@Override
	public RestntDTO getRestntListByAddressCode(String addressCode) {
		return restntMapper.getRestntListByAddressCode(addressCode);
	}

	@Override
	public RestntDTO getRestntInfoById(String restntId) {
		return restntMapper.getRestntInfoById(restntId);
	}
<<<<<<< HEA

	

	@Override
	public RestntDTO getRestntListByAddessCode(String addressCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void dropRestntByRestntId(String restntId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setRestntByRestntId(RestntDTO restntDto) {
		// TODO Auto-generated method stub
		
	}
	
	
=======
>>>>>>> 3459b98d3fa3f7b7318c25c4c68abf84d8b569af

}
