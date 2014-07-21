package com.project.domain;

public class MateDTO {
	//memberFiled
	private String memId;
	private String mateId;
	private String mateStatus;
	private String infoStatus;
	private String memName;
	private String memGrade;
	private String memBirth;
	private Integer viewCount;
	private Integer pageNum;
	
	public MateDTO(){
		
	}
	
	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public MateDTO(String memId2, String mateId2) {
		
	}
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
	public Integer getViewCount() {
		return viewCount;
	}
	public void setViewCount(Integer viewCount) {
		this.viewCount = viewCount;
	}
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
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
				+ ((memBirth == null) ? 0 : memBirth.hashCode());
		result = prime * result
				+ ((memGrade == null) ? 0 : memGrade.hashCode());
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
		result = prime * result + ((memName == null) ? 0 : memName.hashCode());
		result = prime * result + ((pageNum == null) ? 0 : pageNum.hashCode());
		result = prime * result
				+ ((viewCount == null) ? 0 : viewCount.hashCode());
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
		if (memBirth == null) {
			if (other.memBirth != null)
				return false;
		} else if (!memBirth.equals(other.memBirth))
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
		if (pageNum == null) {
			if (other.pageNum != null)
				return false;
		} else if (!pageNum.equals(other.pageNum))
			return false;
		if (viewCount == null) {
			if (other.viewCount != null)
				return false;
		} else if (!viewCount.equals(other.viewCount))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "MateDTO [memId=" + memId + ", mateId=" + mateId
				+ ", mateStatus=" + mateStatus + ", infoStatus=" + infoStatus
				+ ", memName=" + memName + ", memGrade=" + memGrade
				+ ", memBirth=" + memBirth + ", viewCount=" + viewCount
				+ ", pageNum=" + pageNum + "]";
	}
	
	
	
	
	

}
