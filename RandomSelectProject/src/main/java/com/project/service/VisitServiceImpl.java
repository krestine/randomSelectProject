package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.VisitMapper;
import com.project.domain.VisitDTO;

@Service
public class VisitServiceImpl implements VisitService {
	
	@Autowired
	VisitMapper visitMapper;
	
	@Transactional
	@Override
	public void putVisit(VisitDTO visitDto){
		visitMapper.putVisit(visitDto);
	}

	@Transactional
	@Override
	public String getLastVisitId() {
		return visitMapper.getLastVisitId();
	}
}
