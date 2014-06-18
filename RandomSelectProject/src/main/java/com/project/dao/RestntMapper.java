package com.project.dao;

import java.util.List;

import com.project.domain.RestntDTO;

public interface RestntMapper {
	
	// 식당 정보
	RestntDTO getRestntByRestntId(RestntDTO restntDto);
	
	// 식당 리스트
	List<RestntDTO> getRestntListByRestntTerms(RestntDTO restntDto);
	
	
}
