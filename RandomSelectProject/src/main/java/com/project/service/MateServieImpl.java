
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
	public MateDTO getMateInfoByMateId(String memId, String mateId) {
		// TODO Auto-generated method stub
		System.out.println("홍선생의 기술이다!");
		MateDTO mateDto = new MateDTO(memId, mateId);
		
		return mateMapper.getMateInfoByMateId(mateDto);
	}

	@Override
	public MateDTO getMemInfoByMemId(String mateId) {
		// TODO Auto-generated method stub
		return mateMapper.getMemInfoByMemId(mateId);
	}
}
