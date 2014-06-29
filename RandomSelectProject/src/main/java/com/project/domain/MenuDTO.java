package com.project.domain;

public class MenuDTO {
	//memberField
	private String menuId;
	private String restntId;
	private String menuName;
	private String menuPrice;
	private String menuCalorie;
	private String menuNote;
	//memberField end
	
	//getter & setter
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getRestntId() {
		return restntId;
	}
	public void setRestntId(String restntId) {
		this.restntId = restntId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuCalorie() {
		return menuCalorie;
	}
	public void setMenuCalorie(String menuCalorie) {
		this.menuCalorie = menuCalorie;
	}
	public String getMenuNote() {
		return menuNote;
	}
	public void setMenuNote(String menuNote) {
		this.menuNote = menuNote;
	}
	//getter & setter end
	
	
	//hashCode & equals
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((menuCalorie == null) ? 0 : menuCalorie.hashCode());
		result = prime * result + ((menuId == null) ? 0 : menuId.hashCode());
		result = prime * result
				+ ((menuName == null) ? 0 : menuName.hashCode());
		result = prime * result
				+ ((menuNote == null) ? 0 : menuNote.hashCode());
		result = prime * result
				+ ((menuPrice == null) ? 0 : menuPrice.hashCode());
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
		MenuDTO other = (MenuDTO) obj;
		if (menuCalorie == null) {
			if (other.menuCalorie != null)
				return false;
		} else if (!menuCalorie.equals(other.menuCalorie))
			return false;
		if (menuId == null) {
			if (other.menuId != null)
				return false;
		} else if (!menuId.equals(other.menuId))
			return false;
		if (menuName == null) {
			if (other.menuName != null)
				return false;
		} else if (!menuName.equals(other.menuName))
			return false;
		if (menuNote == null) {
			if (other.menuNote != null)
				return false;
		} else if (!menuNote.equals(other.menuNote))
			return false;
		if (menuPrice == null) {
			if (other.menuPrice != null)
				return false;
		} else if (!menuPrice.equals(other.menuPrice))
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
		return "MenuDTO [menuId=" + menuId + ", restntId=" + restntId
				+ ", menuName=" + menuName + ", menuPrice=" + menuPrice
				+ ", menuCalorie=" + menuCalorie + ", menuNote=" + menuNote
				+ "]";
	}
	//toString end
	
	
	
}
