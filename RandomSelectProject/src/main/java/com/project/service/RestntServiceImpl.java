package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.dao.RestntMapper;
import com.project.domain.RestntDTO;

public class RestntServiceImpl implements RestntService {
	@Autowired
	private RestntMapper restntMapper;
	
	
	// 식당 리스트
	@Override
	public List<RestntDTO> getRestntListByRestntTerms(RestntDTO restntDto) {
		
		return restntMapper.getRestntListByRestntTerms(restntDto);
	}
	
	// 식당 정보
	@Override
	public RestntDTO getRestntByRestntId(RestntDTO restntDto) {
		
		return restntMapper.getRestntByRestntId(restntDto);
	}

}
