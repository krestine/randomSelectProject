package ezo.mp.service;

import java.util.List;

import ezo.mp.domain.Cart;
import ezo.mp.domain.CartInfo;
import ezo.mp.domain.Order;
import ezo.mp.domain.Product;

public interface ProductService {
	List<CartInfo> getCarts(String userid);

	List<Order> getAllorderlist(String userid);
	
	CartInfo getCart(String cartNumber);
	List<Product> getAllProducts();

	Product getProduct(String productCode);

	void insertCart(String productCode, String productEA, String userid,
			int amount);

	void cartDelete(String cartnumber);

	String getProductCode(String productname);

	void insertOrder(Order orders);

}
