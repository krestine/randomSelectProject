package com.project.domain;

public class MateDTO {
	//memberFiled
	private String memid;
	private String mateId;
	private String mateStatus;
	private String infoStatus;
	//memberFiled end
	
	//getter & setter
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
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
		result = prime * result + ((memid == null) ? 0 : memid.hashCode());
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
		if (memid == null) {
			if (other.memid != null)
				return false;
		} else if (!memid.equals(other.memid))
			return false;
		return true;
	}
	//hashCode & equals end
	
	
	@Override
	public String toString() {
		return "MateDTO [memid=" + memid + ", mateId=" + mateId
				+ ", mateStatus=" + mateStatus + ", infoStatus=" + infoStatus
				+ "]";
	}
	//toString end
	
	

}
