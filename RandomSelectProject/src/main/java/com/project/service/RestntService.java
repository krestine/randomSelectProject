package com.project.service;

import java.util.List;

import com.project.domain.RestntDTO;

public interface RestntService {
	List<RestntDTO> getRestntListByRestntTerms(RestntDTO restntDto);
	
	RestntDTO getRestntByRestntId(RestntDTO restntDto);
	
	
}
