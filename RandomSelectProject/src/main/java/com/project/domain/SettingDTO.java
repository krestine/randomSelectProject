package com.project.domain;

public class SettingDTO {
	//select box에 표시되는 값을 전달하는 DTO
	private int walkRange;
	private int carRange;
	private String excMenu;
	private int excMenuId;
	private String adress1;
	private String adress2;
	private String adress3;
	
	
	public String getAdress1() {
		return adress1;
	}
	public void setAdress1(String adress1) {
		this.adress1 = adress1;
	}
	public String getAdress2() {
		return adress2;
	}
	public void setAdress2(String adress2) {
		this.adress2 = adress2;
	}
	public String getAdress3() {
		return adress3;
	}
	public void setAdress3(String adress3) {
		this.adress3 = adress3;
	}
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
		result = prime * result + ((adress1 == null) ? 0 : adress1.hashCode());
		result = prime * result + ((adress2 == null) ? 0 : adress2.hashCode());
		result = prime * result + ((adress3 == null) ? 0 : adress3.hashCode());
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
		if (adress1 == null) {
			if (other.adress1 != null)
				return false;
		} else if (!adress1.equals(other.adress1))
			return false;
		if (adress2 == null) {
			if (other.adress2 != null)
				return false;
		} else if (!adress2.equals(other.adress2))
			return false;
		if (adress3 == null) {
			if (other.adress3 != null)
				return false;
		} else if (!adress3.equals(other.adress3))
			return false;
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
				+ ", excMenu=" + excMenu + ", excMenuId=" + excMenuId
				+ ", adress1=" + adress1 + ", adress2=" + adress2
				+ ", adress3=" + adress3 + "]";
	}
	
}
