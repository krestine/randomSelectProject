package com.project.service;

import java.util.List;

import com.project.dao.MateMapper;
import com.project.domain.MateDTO;

public class MateServieImpl implements MateService {
	private MateMapper mateMapper;
	
	// 친구 리스트
	@Override
	public List<MateDTO> getMateIdsByMemId(MateDTO mateDto) {
		
		return mateMapper.getMateIdsByMemId(mateDto);
	}
	
	// 친구 아이디
	@Override
	public MateDTO getMateIdByMemId(MateDTO mateDto) {
		
		return mateMapper.getMateIdByMemId(mateDto);
	}

}
