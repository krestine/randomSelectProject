package com.project.domain;

import java.sql.Timestamp;

public class VisitDTO {
	//memberField
	private Integer visitId;
	private Timestamp visitDate;
	private String menuId;
	private String memId;
	private String restntId;
	private String restntName;
	private String active;
	//memberField end
	public VisitDTO(Integer visitId, String menuId,
			String memId, String restntId, String restntName) {
		super();
		this.visitId = visitId;
		this.menuId = menuId;
		this.memId = memId;
		this.restntId = restntId;
		this.restntName = restntName;
	}
	public VisitDTO(){
		
	}
	public Integer getVisitId() {
		return visitId;
	}
	public void setVisitId(Integer visitId) {
		this.visitId = visitId;
	}
	public Timestamp getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Timestamp visitDate) {
		this.visitDate = visitDate;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getRestntId() {
		return restntId;
	}
	public void setRestntId(String restntId) {
		this.restntId = restntId;
	}
	public String getRestntName() {
		return restntName;
	}
	public void setRestntName(String restntName) {
		this.restntName = restntName;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	@Override
	public String toString() {
		return "VisitDTO [visitId=" + visitId + ", visitDate=" + visitDate
				+ ", menuId=" + menuId + ", memId=" + memId + ", restntId="
				+ restntId + ", restntName=" + restntName + ", active="
				+ active + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((active == null) ? 0 : active.hashCode());
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
		result = prime * result + ((menuId == null) ? 0 : menuId.hashCode());
		result = prime * result
				+ ((restntId == null) ? 0 : restntId.hashCode());
		result = prime * result
				+ ((restntName == null) ? 0 : restntName.hashCode());
		result = prime * result
				+ ((visitDate == null) ? 0 : visitDate.hashCode());
		result = prime * result + ((visitId == null) ? 0 : visitId.hashCode());
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
		if (active == null) {
			if (other.active != null)
				return false;
		} else if (!active.equals(other.active))
			return false;
		if (memId == null) {
			if (other.memId != null)
				return false;
		} else if (!memId.equals(other.memId))
			return false;
		if (menuId == null) {
			if (other.menuId != null)
				return false;
		} else if (!menuId.equals(other.menuId))
			return false;
		if (restntId == null) {
			if (other.restntId != null)
				return false;
		} else if (!restntId.equals(other.restntId))
			return false;
		if (restntName == null) {
			if (other.restntName != null)
				return false;
		} else if (!restntName.equals(other.restntName))
			return false;
		if (visitDate == null) {
			if (other.visitDate != null)
				return false;
		} else if (!visitDate.equals(other.visitDate))
			return false;
		if (visitId == null) {
			if (other.visitId != null)
				return false;
		} else if (!visitId.equals(other.visitId))
			return false;
		return true;
	}
	
}
