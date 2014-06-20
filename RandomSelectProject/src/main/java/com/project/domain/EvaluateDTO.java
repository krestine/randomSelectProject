package com.project.domain;

public class EvaluateDTO {
	// memberField
	private String memId;
	private String restntId;
	private String visitDate;
	private String restntName;
	private String evalId;
	private String score;

	// memberField end

	// getter & setter

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

	public String getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(String visitDate) {
		this.visitDate = visitDate;
	}

	public String getRestntName() {
		return restntName;
	}

	public void setRestntName(String restntName) {
		this.restntName = restntName;
	}

	public String getEvalId() {
		return evalId;
	}

	public void setEvalId(String evalId) {
		this.evalId = evalId;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	// getter & setter end

	// hashCode & equals

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((evalId == null) ? 0 : evalId.hashCode());
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
		result = prime * result
				+ ((restntId == null) ? 0 : restntId.hashCode());
		result = prime * result
				+ ((restntName == null) ? 0 : restntName.hashCode());
		result = prime * result + ((score == null) ? 0 : score.hashCode());
		result = prime * result
				+ ((visitDate == null) ? 0 : visitDate.hashCode());
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
		EvaluateDTO other = (EvaluateDTO) obj;
		if (evalId == null) {
			if (other.evalId != null)
				return false;
		} else if (!evalId.equals(other.evalId))
			return false;
		if (memId == null) {
			if (other.memId != null)
				return false;
		} else if (!memId.equals(other.memId))
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
		if (score == null) {
			if (other.score != null)
				return false;
		} else if (!score.equals(other.score))
			return false;
		if (visitDate == null) {
			if (other.visitDate != null)
				return false;
		} else if (!visitDate.equals(other.visitDate))
			return false;
		return true;
	}

	// hashCode & equals end

	// toString

	@Override
	public String toString() {
		return "EvaluateDTO [memId=" + memId + ", restntId=" + restntId
				+ ", visitDate=" + visitDate + ", restntName=" + restntName
				+ ", evalId=" + evalId + ", score=" + score + "]";
	}

	// toString end
}
