package com.project.domain;

public class RestntDTO {
	//memberField 
	private String restntId;
	private String restntName;
	private String restntLatitude;
	private String restntLongitude;
	private String restntAddress1;
	private String restntAddress2;
	private String restntAddress3;
	private String restntAddress4;
	private String restntPhone;
	private String restntType;
	//memberField end
	
	//getter & setter
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
	public String getRestntAddress1() {
		return restntAddress1;
	}
	public void setRestntAddress1(String restntAddress1) {
		this.restntAddress1 = restntAddress1;
	}
	public String getRestntAddress2() {
		return restntAddress2;
	}
	public void setRestntAddress2(String restntAddress2) {
		this.restntAddress2 = restntAddress2;
	}
	public String getRestntAddress3() {
		return restntAddress3;
	}
	public void setRestntAddress3(String restntAddress3) {
		this.restntAddress3 = restntAddress3;
	}
	public String getRestntAddress4() {
		return restntAddress4;
	}
	public void setRestntAddress4(String restntAddress4) {
		this.restntAddress4 = restntAddress4;
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
	//getter & setter end
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((restntAddress1 == null) ? 0 : restntAddress1.hashCode());
		result = prime * result
				+ ((restntAddress2 == null) ? 0 : restntAddress2.hashCode());
		result = prime * result
				+ ((restntAddress3 == null) ? 0 : restntAddress3.hashCode());
		result = prime * result
				+ ((restntAddress4 == null) ? 0 : restntAddress4.hashCode());
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
	
	//hash code & equals
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RestntDTO other = (RestntDTO) obj;
		if (restntAddress1 == null) {
			if (other.restntAddress1 != null)
				return false;
		} else if (!restntAddress1.equals(other.restntAddress1))
			return false;
		if (restntAddress2 == null) {
			if (other.restntAddress2 != null)
				return false;
		} else if (!restntAddress2.equals(other.restntAddress2))
			return false;
		if (restntAddress3 == null) {
			if (other.restntAddress3 != null)
				return false;
		} else if (!restntAddress3.equals(other.restntAddress3))
			return false;
		if (restntAddress4 == null) {
			if (other.restntAddress4 != null)
				return false;
		} else if (!restntAddress4.equals(other.restntAddress4))
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
	//hash code & equals end
	
	//toString
	@Override
	public String toString() {
		return "RestntDTO [restntId=" + restntId + ", restntName=" + restntName
				+ ", restntLatitude=" + restntLatitude + ", restntLongitude="
				+ restntLongitude + ", restntAddress1=" + restntAddress1
				+ ", restntAddress2=" + restntAddress2 + ", restntAddress3="
				+ restntAddress3 + ", restntAddress4=" + restntAddress4
				+ ", restntPhone=" + restntPhone + ", restntType=" + restntType
				+ "]";
	}
	//toString end
	
	
	
	
	
	
}
