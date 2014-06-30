package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MateMapper;
import com.project.dao.MemberMapper;
import com.project.domain.MateDTO;

@Service
public class MateServieImpl implements MateService {
	
	@Autowired
	private MateMapper mateMapper;
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public List<MateDTO> getMates() {
		// TODO Auto-generated method stub
		return mateMapper.getMates();
	}

	@Override
	public MateDTO getMateId(String mateId) {
		// TODO Auto-generated method stub
		return mateMapper.getMateId(mateId);
	}

	@Override
	public String getMateInfo(String mateId) {
		// TODO Auto-generated method stub
		return mateMapper.getMateInfo(mateId);
	}


	
	
	
	


}
