package com.project.domain;

public class MemberDTO {

	// memberField
	private String memId;
	private String memPasswd;
	private String memName;
	private String memBirth;
	private String memMobile;
	private String memGrade;
	private String black;
	private String leave;
	private String leaveReason;

	// member Field end

	// getter & setter

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPasswd() {
		return memPasswd;
	}

	public void setMemPasswd(String memPasswd) {
		this.memPasswd = memPasswd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemMobile() {
		return memMobile;
	}

	public void setMemMobile(String memMobile) {
		this.memMobile = memMobile;
	}

	public String getMemGrade() {
		return memGrade;
	}

	public void setMemGrade(String memGrade) {
		this.memGrade = memGrade;
	}

	public String getBlack() {
		return black;
	}

	public void setBlack(String black) {
		this.black = black;
	}

	public String getLeave() {
		return leave;
	}

	public void setLeave(String leave) {
		this.leave = leave;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	// getter & setter end

	// hashCode & equals

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((black == null) ? 0 : black.hashCode());
		result = prime * result + ((leave == null) ? 0 : leave.hashCode());
		result = prime * result
				+ ((leaveReason == null) ? 0 : leaveReason.hashCode());
		result = prime * result
				+ ((memBirth == null) ? 0 : memBirth.hashCode());
		result = prime * result
				+ ((memGrade == null) ? 0 : memGrade.hashCode());
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
		result = prime * result
				+ ((memMobile == null) ? 0 : memMobile.hashCode());
		result = prime * result + ((memName == null) ? 0 : memName.hashCode());
		result = prime * result
				+ ((memPasswd == null) ? 0 : memPasswd.hashCode());
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
		MemberDTO other = (MemberDTO) obj;
		if (black == null) {
			if (other.black != null)
				return false;
		} else if (!black.equals(other.black))
			return false;
		if (leave == null) {
			if (other.leave != null)
				return false;
		} else if (!leave.equals(other.leave))
			return false;
		if (leaveReason == null) {
			if (other.leaveReason != null)
				return false;
		} else if (!leaveReason.equals(other.leaveReason))
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
		if (memMobile == null) {
			if (other.memMobile != null)
				return false;
		} else if (!memMobile.equals(other.memMobile))
			return false;
		if (memName == null) {
			if (other.memName != null)
				return false;
		} else if (!memName.equals(other.memName))
			return false;
		if (memPasswd == null) {
			if (other.memPasswd != null)
				return false;
		} else if (!memPasswd.equals(other.memPasswd))
			return false;
		return true;
	}

	// hashCode & equals end

	// toString

	@Override
	public String toString() {

		return "MemberDTO [memId=" + memId + ", memPasswd=" + memPasswd
				+ ", memName=" + memName + ", memBirth=" + memBirth
				+ ", memMobile=" + memMobile + ", memGrade=" + memGrade
				+ ", black=" + black + ", leave=" + leave + ", leaveReason="
				+ leaveReason + "]";

	}

	// toString end

}
