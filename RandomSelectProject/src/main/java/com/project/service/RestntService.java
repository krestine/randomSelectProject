package com.project.service;

import java.util.List;

import com.project.domain.RestntDTO;

public interface RestntService {
	
	// 식당 리스트
	List<RestntDTO> getRestntListByRestntTerms(RestntDTO restntDto);
	
	// 식당 정보
	RestntDTO getRestntByRestntId(RestntDTO restntDto);
	
	
}
