package com.project.domain;

public class RestntDTO {
	// memberField
	private String restntId;
	private String restntName;
	private String restntLatitude;
	private String restntLongitude;
	private String adress1;
	private String adress2;
	private String adress3;
	private String adress4;
	private String restntPhone;
	private String restntType;
	private String restntEval;
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
	public String getRestntLatitude() {
		return restntLatitude;
	}
	public void setRestntLatitude(String restntLatitude) {
		this.restntLatitude = restntLatitude;
	}
	public String getRestntLongitude() {
		return restntLongitude;
	}
	public void setRestntLongitude(String restntLongitude) {
		this.restntLongitude = restntLongitude;
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
	public String getRestntPhone() {
		return restntPhone;
	}
	public void setRestntPhone(String restntPhone) {
		this.restntPhone = restntPhone;
	}
	public String getRestntType() {
		return restntType;
	}
	public void setRestntType(String restntType) {
		this.restntType = restntType;
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
				+ ((restntEval == null) ? 0 : restntEval.hashCode());
		result = prime * result
				+ ((restntId == null) ? 0 : restntId.hashCode());
		result = prime * result
				+ ((restntLatitude == null) ? 0 : restntLatitude.hashCode());
		result = prime * result
				+ ((restntLongitude == null) ? 0 : restntLongitude.hashCode());
		result = prime * result
				+ ((restntName == null) ? 0 : restntName.hashCode());
		result = prime * result
				+ ((restntPhone == null) ? 0 : restntPhone.hashCode());
		result = prime * result
				+ ((restntType == null) ? 0 : restntType.hashCode());
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
		if (restntLatitude == null) {
			if (other.restntLatitude != null)
				return false;
		} else if (!restntLatitude.equals(other.restntLatitude))
			return false;
		if (restntLongitude == null) {
			if (other.restntLongitude != null)
				return false;
		} else if (!restntLongitude.equals(other.restntLongitude))
			return false;
		if (restntName == null) {
			if (other.restntName != null)
				return false;
		} else if (!restntName.equals(other.restntName))
			return false;
		if (restntPhone == null) {
			if (other.restntPhone != null)
				return false;
		} else if (!restntPhone.equals(other.restntPhone))
			return false;
		if (restntType == null) {
			if (other.restntType != null)
				return false;
		} else if (!restntType.equals(other.restntType))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "RestntDTO [restntId=" + restntId + ", restntName=" + restntName
				+ ", restntLatitude=" + restntLatitude + ", restntLongitude="
				+ restntLongitude + ", adress1=" + adress1 + ", adress2="
				+ adress2 + ", adress3=" + adress3 + ", adress4=" + adress4
				+ ", restntPhone=" + restntPhone + ", restntType=" + restntType
				+ ", restntEval=" + restntEval + "]";
	}

	

	
}
