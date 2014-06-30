
package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MateMapper;
import com.project.dao.MemberMapper;
import com.project.domain.MateDTO;
import com.project.domain.MemberDTO;

@Service
public class MateServieImpl implements MateService {
	
	@Autowired
	private MateMapper mateMapper;
	
	@Autowired
	private MemberMapper memberMapper;

	@Override
	public List<MateDTO> getMateListByMemId(String memId) {
		// TODO Auto-generated method stub
		return mateMapper.getMateListByMemId(memId);
	}

	@Override
	public MateDTO getMateIdByMateId(String mateId) {
		// TODO Auto-generated method stub
		return mateMapper.getMateIdByMateId(mateId);
	}

	@Override
	public MateDTO getMateInfoByMateId(String mateId) {
		// TODO Auto-generated method stub
		return mateMapper.getMateInfoByMateId(mateId);
	}


	
	
	

}


/*
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
	public List<MateDTO> getMateListByMateId() {
		
		return mateMapper.getMateListByMateId();
	}
	
	// 회원 : 친구아이디
	@Override
	public MateDTO getMateIdByMateId(String mateId) {
		
		return mateMapper.getMateIdByMateId(mateId);
		 
	}
	
	// 회원 : 친구정보
	@Override
	public MateDTO getMateInfoByMateId(String mateDto) {
		
		return mateMapper.getMateInfoByMateId(mateDto);
	}

}
*/
