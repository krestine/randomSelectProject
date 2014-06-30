package com.project.domain;

public class MateDTO {
	//memberFiled
	private String memId;
	private String mateId;
	private String mateStatus;
	private String infoStatus;
	private String memName;
	private String memGrade;
	
	//memberFiled end
	
	//getter & setter
	public String getMemId() {
		return memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemGrade() {
		return memGrade;
	}
	public void setMemGrade(String memGrade) {
		this.memGrade = memGrade;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMateId() {
		return mateId;
	}
	public void setMateId(String mateId) {
		this.mateId = mateId;
	}
	public String getMateStatus() {
		return mateStatus;
	}
	public void setMateStatus(String mateStatus) {
		this.mateStatus = mateStatus;
	}
	public String getInfoStatus() {
		return infoStatus;
	}
	public void setInfoStatus(String infoStatus) {
		this.infoStatus = infoStatus;
	}
	//getter & setter end
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((infoStatus == null) ? 0 : infoStatus.hashCode());
		result = prime * result + ((mateId == null) ? 0 : mateId.hashCode());
		result = prime * result
				+ ((mateStatus == null) ? 0 : mateStatus.hashCode());
		result = prime * result
				+ ((memGrade == null) ? 0 : memGrade.hashCode());
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
		result = prime * result + ((memName == null) ? 0 : memName.hashCode());
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
		MateDTO other = (MateDTO) obj;
		if (infoStatus == null) {
			if (other.infoStatus != null)
				return false;
		} else if (!infoStatus.equals(other.infoStatus))
			return false;
		if (mateId == null) {
			if (other.mateId != null)
				return false;
		} else if (!mateId.equals(other.mateId))
			return false;
		if (mateStatus == null) {
			if (other.mateStatus != null)
				return false;
		} else if (!mateStatus.equals(other.mateStatus))
			return false;
		if (memGrade == null) {
			if (other.memGrade != null)
				return false;
		} else if (!memGrade.equals(other.memGrade))
			return false;
		if (memId == null) {
			if (other.memId != null)
				return false;
		} else if (!memId.equals(other.memId))
			return false;
		if (memName == null) {
			if (other.memName != null)
				return false;
		} else if (!memName.equals(other.memName))
			return false;
		return true;
	}
	
	
	@Override
	public String toString() {
		return "MateDTO [memId=" + memId + ", mateId=" + mateId
				+ ", mateStatus=" + mateStatus + ", infoStatus=" + infoStatus
				+ ", memName=" + memName + ", memGrade=" + memGrade + "]";
	}
	
	

}
