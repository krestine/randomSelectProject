package com.project.service;

import java.util.List;

import com.project.dao.MateMapper;
import com.project.domain.MateDTO;

public class MateServieImpl implements MateService {
	private MateMapper mateMapper;
	
	
	@Override
	public List<MateDTO> getMateIdsByMemId(MateDTO mateDto) {
		
		return mateMapper.getMateIdsByMemId(mateDto);
	}

	@Override
	public MateDTO getMateIdByMemId(MateDTO mateDto) {
		
		return mateMapper.getMateIdByMemId(mateDto);
	}

}
