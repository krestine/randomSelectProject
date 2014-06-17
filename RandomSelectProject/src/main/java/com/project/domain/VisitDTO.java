package com.project.domain;

import java.sql.Date;

public class VisitDTO {
	//memberField
	private String memid;
	private Date visitDate;
	private String visitRestntId;
	//memberField end
	
	//getter & setter
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}
	public String getVisitRestntId() {
		return visitRestntId;
	}
	public void setVisitRestntId(String visitRestntId) {
		this.visitRestntId = visitRestntId;
	}
	//getter & setter end
	
	//hashCode & equals
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((memid == null) ? 0 : memid.hashCode());
		result = prime * result
				+ ((visitDate == null) ? 0 : visitDate.hashCode());
		result = prime * result
				+ ((visitRestntId == null) ? 0 : visitRestntId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		VisitDTO other = (VisitDTO) obj;
		if (memid == null) {
			if (other.memid != null)
				return false;
		} else if (!memid.equals(other.memid))
			return false;
		if (visitDate == null) {
			if (other.visitDate != null)
				return false;
		} else if (!visitDate.equals(other.visitDate))
			return false;
		if (visitRestntId == null) {
			if (other.visitRestntId != null)
				return false;
		} else if (!visitRestntId.equals(other.visitRestntId))
			return false;
		return true;
	}
	//hashCode & equals end
	
	//toString
	@Override
	public String toString() {
		return "VisitDTO [memid=" + memid + ", visitDate=" + visitDate
				+ ", visitRestntId=" + visitRestntId + "]";
	}
	//toString end
}
