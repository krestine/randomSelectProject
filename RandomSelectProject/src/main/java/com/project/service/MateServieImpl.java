package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MateMapper;
import com.project.domain.MateDTO;

@Service
public class MateServieImpl implements MateService {
	
	@Autowired
	private MateMapper mateMapper;
	
	// 회원 : 친구 리스트
	@Override
	public List<MateDTO> getMateIdsByMemId() {
		
		return mateMapper.getMateIdsByMemId();
	}
	
	// 회원 : 친구아이디
	@Override
	public MateDTO getMateIdByMemId(String mateId) {
		
		return mateMapper.getMateIdByMemId(mateId);
		 
	}
	
	// 회원 : 친구정보
	@Override
	public MateDTO getMateInfoByMemId(String mateDto) {
		
		return mateMapper.getMateInfoByMemId(mateDto);
	}

}
