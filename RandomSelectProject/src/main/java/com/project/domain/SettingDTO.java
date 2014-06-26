package com.project.domain;

public class SettingDTO {
	private int walkRange;
	private int carRange;
	private String excMenu;
	private int excMenuId;
	
	
	public int getExcMenuId() {
		return excMenuId;
	}
	public void setExcMenuId(int excMenuId) {
		this.excMenuId = excMenuId;
	}
	public int getWalkRange() {
		return walkRange;
	}
	public void setWalkRange(int walkRange) {
		this.walkRange = walkRange;
	}
	public int getCarRange() {
		return carRange;
	}
	public void setCarRange(int carRange) {
		this.carRange = carRange;
	}
	public String getExcMenu() {
		return excMenu;
	}
	public void setExcMenu(String excMenu) {
		this.excMenu = excMenu;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + carRange;
		result = prime * result + ((excMenu == null) ? 0 : excMenu.hashCode());
		result = prime * result + excMenuId;
		result = prime * result + walkRange;
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
		SettingDTO other = (SettingDTO) obj;
		if (carRange != other.carRange)
			return false;
		if (excMenu == null) {
			if (other.excMenu != null)
				return false;
		} else if (!excMenu.equals(other.excMenu))
			return false;
		if (excMenuId != other.excMenuId)
			return false;
		if (walkRange != other.walkRange)
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "SettingDTO [walkRange=" + walkRange + ", carRange=" + carRange
				+ ", excMenu=" + excMenu + ", excMenuId=" + excMenuId + "]";
	}
	
}
