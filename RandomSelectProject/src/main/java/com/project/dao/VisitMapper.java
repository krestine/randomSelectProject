package com.project.dao;

import com.project.domain.VisitDTO;

public interface VisitMapper {
	void putVisit(VisitDTO visitDto);
	String getLastVisitId();
	VisitDTO getVisitInfoByMemId(String string);
	void dropVisitById(String string);
}
