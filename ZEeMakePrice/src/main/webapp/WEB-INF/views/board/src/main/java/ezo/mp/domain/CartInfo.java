package ezo.mp.domain;

public class CartInfo {
	private String userid;
	private String cartnumber;
	private int ea;
	private int amount;
	private String productname;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getCartnumber() {
		return cartnumber;
	}
	public void setCartnumber(String cartnumber) {
		this.cartnumber = cartnumber;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	@Override
	public String toString() {
		return "CartInfo [userid=" + userid + ", cartnumber=" + cartnumber
				+ ", ea=" + ea + ", amount=" + amount + ", productname="
				+ productname + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + amount;
		result = prime * result
				+ ((cartnumber == null) ? 0 : cartnumber.hashCode());
		result = prime * result + ea;
		result = prime * result
				+ ((productname == null) ? 0 : productname.hashCode());
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
		CartInfo other = (CartInfo) obj;
		if (amount != other.amount)
			return false;
		if (cartnumber == null) {
			if (other.cartnumber != null)
				return false;
		} else if (!cartnumber.equals(other.cartnumber))
			return false;
		if (ea != other.ea)
			return false;
		if (productname == null) {
			if (other.productname != null)
				return false;
		} else if (!productname.equals(other.productname))
			return false;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		return true;
	}
	
	
	
}
