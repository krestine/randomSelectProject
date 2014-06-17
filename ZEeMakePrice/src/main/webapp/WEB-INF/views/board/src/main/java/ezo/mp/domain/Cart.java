package ezo.mp.domain;

public class Cart {

	private String cartCode;
	private String productCode;
	private String productEA;
	private String userid;
	private String aomunt;
	
	
	
	@Override
	public String toString() {
		return "Cart [cartCode=" + cartCode + ", productCode=" + productCode
				+ ", productEA=" + productEA + ", userid=" + userid
				+ ", aomunt=" + aomunt + "]";
	}



	public String getCartCode() {
		return cartCode;
	}



	public void setCartCode(String cartCode) {
		this.cartCode = cartCode;
	}



	public String getProductCode() {
		return productCode;
	}



	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}



	public String getProductEA() {
		return productEA;
	}



	public void setProductEA(String productEA) {
		this.productEA = productEA;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getAomunt() {
		return aomunt;
	}



	public void setAomunt(String aomunt) {
		this.aomunt = aomunt;
	}



	public Cart(String cartCode, String productCode, String productEA,
			String userid) {
		this.cartCode=cartCode;
		this.productCode=productCode;
		this.productEA=productEA;
		this.userid=userid;
	}

}
