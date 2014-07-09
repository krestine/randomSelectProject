package com.project.service;

import com.project.domain.VisitDTO;

public interface VisitService {
	void putVisit(VisitDTO visitDto);
	String getLastVisitId();
}
