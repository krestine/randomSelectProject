package com.project.service;

import java.util.List;

import com.project.domain.VisitDTO;

public interface VisitService {
	void putVisit(VisitDTO visitDto);
	Integer getLastVisitId();
	List<VisitDTO> getVisitInfoByMemId(String string);
	void dropVisitById(String string);
}
