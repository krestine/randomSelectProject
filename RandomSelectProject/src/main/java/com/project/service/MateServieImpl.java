package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.project.dao.MateMapper;
import com.project.domain.MateDTO;

public class MateServieImpl implements MateService {
	@Autowired
	private MateMapper mateMapper;
	
	@Override
	public List<MateDTO> getMateIdsByMemId(MateDTO mateDto) {
		
		return mateMapper.getMateIdsByMemId(mateDto);
	}

	@Override
	public MateDTO getMateIdByMemId(String mateDto) {
		
		return mateMapper.getMateIdByMemId(mateDto);
		 
		
	}

}
