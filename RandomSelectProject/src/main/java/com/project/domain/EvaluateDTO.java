package com.project.domain;

public class EvaluateDTO {
	//memberField
	private String evalId;
	private String memId;
	private String evalScore;
	private String restntId;
	//memberField end
	
	//getter & setter
	public String getEvalId() {
		return evalId;
	}
	public void setEvalId(String evalId) {
		this.evalId = evalId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getEvalScore() {
		return evalScore;
	}
	public void setEvalScore(String evalScore) {
		this.evalScore = evalScore;
	}
	public String getRestntId() {
		return restntId;
	}
	public void setRestntId(String restntId) {
		this.restntId = restntId;
	}
	//getter & setter end
	
	//hashCode & equals
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((evalId == null) ? 0 : evalId.hashCode());
		result = prime * result
				+ ((evalScore == null) ? 0 : evalScore.hashCode());
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
		result = prime * result
				+ ((restntId == null) ? 0 : restntId.hashCode());
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
		if (evalScore == null) {
			if (other.evalScore != null)
				return false;
		} else if (!evalScore.equals(other.evalScore))
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
		return true;
	}
	//hashCode & equals end
	
	//toString
	@Override
	public String toString() {
		return "EvaluateDTO [evalId=" + evalId + ", memId=" + memId
				+ ", evalScore=" + evalScore + ", restntId=" + restntId + "]";
	}
	//toString end
}
