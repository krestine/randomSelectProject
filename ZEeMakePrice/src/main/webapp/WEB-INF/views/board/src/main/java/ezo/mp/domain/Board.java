package ezo.mp.domain;

import java.sql.Date;

public class Board {
	private String userId;
	private String title;
	private String qaContext;
	private Date qaDate;
	private int boardNumber;
	private int hit;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getQaContext() {
		return qaContext;
	}

	public void setQaContext(String qaContext) {
		this.qaContext = qaContext;
	}

	public Date getQaDate() {
		return qaDate;
	}

	public void setQaDate(Date qaDate) {
		this.qaDate = qaDate;
	}

	public int getBoardNumber() {
		return boardNumber;
	}

	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + boardNumber;
		result = prime * result + hit;
		result = prime * result
				+ ((qaContext == null) ? 0 : qaContext.hashCode());
		result = prime * result + ((qaDate == null) ? 0 : qaDate.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
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
		Board other = (Board) obj;
		if (boardNumber != other.boardNumber)
			return false;
		if (hit != other.hit)
			return false;
		if (qaContext == null) {
			if (other.qaContext != null)
				return false;
		} else if (!qaContext.equals(other.qaContext))
			return false;
		if (qaDate == null) {
			if (other.qaDate != null)
				return false;
		} else if (!qaDate.equals(other.qaDate))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Board [userId=" + userId + ", title=" + title + ", qaContext="
				+ qaContext + ", qaDate=" + qaDate + ", boardNumber="
				+ boardNumber + ", hit=" + hit + "]";
	}

}
