package com.project.domain;

public class RestntDTO {
	// memberField
	private String restntId;
	private String restntName;

	private String adress1;
	private String adress2;
	private String adress3;
	private String adress4;
	private String restntTel;
	private String restntCate;
	private String restntEval;
	private String menuName;
	private String menuPrice;
	private String menuCalorie;
	
	
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

	public String getRestntId() {
		return restntId;
	}

	public void setRestntId(String restntId) {
		this.restntId = restntId;
	}

	public String getRestntName() {
		return restntName;
	}

	public void setRestntName(String restntName) {
		this.restntName = restntName;
	}

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

	public String getAdress4() {
		return adress4;
	}

	public void setAdress4(String adress4) {
		this.adress4 = adress4;
	}

	public String getRestntTel() {
		return restntTel;
	}

	public void setRestntTel(String restntTel) {
		this.restntTel = restntTel;
	}

	public String getRestntCate() {
		return restntCate;
	}

	public void setRestntCate(String restntCate) {
		this.restntCate = restntCate;
	}

	public String getRestntEval() {
		return restntEval;
	}

	public void setRestntEval(String restntEval) {
		this.restntEval = restntEval;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((adress1 == null) ? 0 : adress1.hashCode());
		result = prime * result + ((adress2 == null) ? 0 : adress2.hashCode());
		result = prime * result + ((adress3 == null) ? 0 : adress3.hashCode());
		result = prime * result + ((adress4 == null) ? 0 : adress4.hashCode());
		result = prime * result
				+ ((menuCalorie == null) ? 0 : menuCalorie.hashCode());
		result = prime * result
				+ ((menuName == null) ? 0 : menuName.hashCode());
		result = prime * result
				+ ((menuPrice == null) ? 0 : menuPrice.hashCode());
		result = prime * result
				+ ((restntCate == null) ? 0 : restntCate.hashCode());
		result = prime * result
				+ ((restntEval == null) ? 0 : restntEval.hashCode());
		result = prime * result
				+ ((restntId == null) ? 0 : restntId.hashCode());
		result = prime * result
				+ ((restntName == null) ? 0 : restntName.hashCode());
		result = prime * result
				+ ((restntTel == null) ? 0 : restntTel.hashCode());
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
		RestntDTO other = (RestntDTO) obj;
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
		if (adress4 == null) {
			if (other.adress4 != null)
				return false;
		} else if (!adress4.equals(other.adress4))
			return false;
		if (menuCalorie == null) {
			if (other.menuCalorie != null)
				return false;
		} else if (!menuCalorie.equals(other.menuCalorie))
			return false;
		if (menuName == null) {
			if (other.menuName != null)
				return false;
		} else if (!menuName.equals(other.menuName))
			return false;
		if (menuPrice == null) {
			if (other.menuPrice != null)
				return false;
		} else if (!menuPrice.equals(other.menuPrice))
			return false;
		if (restntCate == null) {
			if (other.restntCate != null)
				return false;
		} else if (!restntCate.equals(other.restntCate))
			return false;
		if (restntEval == null) {
			if (other.restntEval != null)
				return false;
		} else if (!restntEval.equals(other.restntEval))
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
		if (restntTel == null) {
			if (other.restntTel != null)
				return false;
		} else if (!restntTel.equals(other.restntTel))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RestntDTO [restntId=" + restntId + ", restntName=" + restntName
				+ ", adress1=" + adress1 + ", adress2=" + adress2
				+ ", adress3=" + adress3 + ", adress4=" + adress4
				+ ", restntTel=" + restntTel + ", restntCate=" + restntCate
				+ ", restntEval=" + restntEval + ", menuName=" + menuName
				+ ", menuPrice=" + menuPrice + ", menuCalorie=" + menuCalorie
				+ "]";
	}

}
