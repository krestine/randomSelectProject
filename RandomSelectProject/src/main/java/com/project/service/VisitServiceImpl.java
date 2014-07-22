package com.project.service;

import java.util.List;

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
	public Integer getLastVisitId() {
		return visitMapper.getLastVisitId();
	}

	@Override
	public void dropVisitById(String string) {
		visitMapper.dropVisitById(string);
	}

	@Override
	public List<VisitDTO> getVisitInfoByMemId(String string) {
		return visitMapper.getVisitInfoByMemId(string);
	}
}
