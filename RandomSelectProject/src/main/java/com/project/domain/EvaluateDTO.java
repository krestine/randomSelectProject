package com.project.domain;

import java.sql.Timestamp;

public class EvaluateDTO {
	// memberField
	private Integer evalId;
	private String score;
	private String memId;
	private String restntId;
	private Timestamp evalDate;
	private String restntName;
	private Integer viewCount;
	private Integer pageNum;
	
	public EvaluateDTO(Integer evalId, String score, String memId,
			String restntId, String restntName) {
		super();
		this.evalId = evalId;
		this.score = score;
		this.memId = memId;
		this.restntId = restntId;
		this.restntName = restntName;
	}
	
	public EvaluateDTO(){
		
	}

	public Integer getEvalId() {
		return evalId;
	}

	public void setEvalId(Integer evalId) {
		this.evalId = evalId;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
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

	public Timestamp getEvalDate() {
		return evalDate;
	}

	public void setEvalDate(Timestamp evalDate) {
		this.evalDate = evalDate;
	}

	public String getRestntName() {
		return restntName;
	}

	public void setRestntName(String restntName) {
		this.restntName = restntName;
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
	public String toString() {
		return "EvaluateDTO [evalId=" + evalId + ", score=" + score
				+ ", memId=" + memId + ", restntId=" + restntId + ", evalDate="
				+ evalDate + ", restntName=" + restntName + ", viewCount="
				+ viewCount + ", pageNum=" + pageNum + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((evalDate == null) ? 0 : evalDate.hashCode());
		result = prime * result + ((evalId == null) ? 0 : evalId.hashCode());
		result = prime * result + ((memId == null) ? 0 : memId.hashCode());
		result = prime * result + ((pageNum == null) ? 0 : pageNum.hashCode());
		result = prime * result
				+ ((restntId == null) ? 0 : restntId.hashCode());
		result = prime * result
				+ ((restntName == null) ? 0 : restntName.hashCode());
		result = prime * result + ((score == null) ? 0 : score.hashCode());
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
		EvaluateDTO other = (EvaluateDTO) obj;
		if (evalDate == null) {
			if (other.evalDate != null)
				return false;
		} else if (!evalDate.equals(other.evalDate))
			return false;
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
		if (pageNum == null) {
			if (other.pageNum != null)
				return false;
		} else if (!pageNum.equals(other.pageNum))
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
		if (viewCount == null) {
			if (other.viewCount != null)
				return false;
		} else if (!viewCount.equals(other.viewCount))
			return false;
		return true;
	}
}