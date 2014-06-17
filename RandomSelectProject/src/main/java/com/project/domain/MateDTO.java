package com.project.domain;

public class MateDTO {
	//memberFiled
	private String memId;
	private String mateId;
	private String mateStatus;
	private String infoStatus;
	//memberFiled end
	
	//getter & setter
	public String getMemId() {
		return memId;
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
	
	//hashCode & equals
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((infoStatus == null) ? 0 : infoStatus.hashCode());
		result = prime * result + ((mateId == null) ? 0 : mateId.hashCode());
		result = prime * result
				+ ((mateStatus == null) ? 0 : mateStatus.hashCode());
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
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
		if (memId == null) {
			if (other.memId != null)
				return false;
		} else if (!memId.equals(other.memId))
			return false;
		return true;
	}
	//hashCode & equals end
	
	
	@Override
	public String toString() {
		return "MateDTO [memId=" + memId + ", mateId=" + mateId
				+ ", mateStatus=" + mateStatus + ", infoStatus=" + infoStatus
				+ "]";
	}
	//toString end
	
	

}
