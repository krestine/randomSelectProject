package ezo.mp.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Users {
	@NotEmpty
	private String name;
	@NotEmpty
	private String userid;
	@Size(min = 4, max = 15)
	private String password;
	@NotEmpty
	private String passconfirm;
	private String phonenumber;
	private String phonefirst;
	@Size(min = 1, max = 4)
	private String phonesecond;
	@Size(min = 1, max = 4)
	private String phonethird;
	@NotEmpty
	private String address;
	private String jobcode;

	public Users() {
		// TODO Auto-generated constructor stub
	}

	public Users(String userid, String passwd) {
		this.userid = userid;
		this.password = passwd;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassconfirm() {
		return passconfirm;
	}

	public void setPassconfirm(String passconfirm) {
		this.passconfirm = passconfirm;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber() {
		this.phonenumber = this.phonefirst + this.phonesecond + this.phonethird;
	}

	public String getPhonefirst() {
		return phonefirst;
	}

	public void setPhonefirst(String phonefirst) {
		this.phonefirst = phonefirst;
	}

	public String getPhonesecond() {
		return phonesecond;
	}

	public void setPhonesecond(String phonesecond) {
		this.phonesecond = phonesecond;
	}

	public String getPhonethird() {
		return phonethird;
	}

	public void setPhonethird(String phonethird) {
		this.phonethird = phonethird;
		setPhonenumber();
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJobcode() {
		return jobcode;
	}

	public void setJobcode(String jobcode) {
		this.jobcode = jobcode;
	}

	@Override
	public String toString() {
		return "Users [userid=" + userid + ",name=" + name + ", password="
				+ password + ", passconfirm=" + passconfirm + ", phonenumber="
				+ phonenumber + ", phonefirst=" + phonefirst + ", phonesecond="
				+ phonesecond + ", phonethird=" + phonethird + ", address="
				+ address + ", jobcode=" + jobcode + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((jobcode == null) ? 0 : jobcode.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((passconfirm == null) ? 0 : passconfirm.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((phonefirst == null) ? 0 : phonefirst.hashCode());
		result = prime * result
				+ ((phonenumber == null) ? 0 : phonenumber.hashCode());
		result = prime * result
				+ ((phonesecond == null) ? 0 : phonesecond.hashCode());
		result = prime * result
				+ ((phonethird == null) ? 0 : phonethird.hashCode());
		result = prime * result + ((userid == null) ? 0 : userid.hashCode());
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
		Users other = (Users) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (jobcode == null) {
			if (other.jobcode != null)
				return false;
		} else if (!jobcode.equals(other.jobcode))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (passconfirm == null) {
			if (other.passconfirm != null)
				return false;
		} else if (!passconfirm.equals(other.passconfirm))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phonefirst == null) {
			if (other.phonefirst != null)
				return false;
		} else if (!phonefirst.equals(other.phonefirst))
			return false;
		if (phonenumber == null) {
			if (other.phonenumber != null)
				return false;
		} else if (!phonenumber.equals(other.phonenumber))
			return false;
		if (phonesecond == null) {
			if (other.phonesecond != null)
				return false;
		} else if (!phonesecond.equals(other.phonesecond))
			return false;
		if (phonethird == null) {
			if (other.phonethird != null)
				return false;
		} else if (!phonethird.equals(other.phonethird))
			return false;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		return true;
	}

}
