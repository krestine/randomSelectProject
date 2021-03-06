package com.project.dao;

import java.util.List;

import com.project.domain.VisitDTO;

public interface VisitMapper {
	void putVisit(VisitDTO visitDto);
	Integer getLastVisitId();
	List<VisitDTO> getVisitInfoByMemId(String string);
	void dropVisitById(String string);
}
