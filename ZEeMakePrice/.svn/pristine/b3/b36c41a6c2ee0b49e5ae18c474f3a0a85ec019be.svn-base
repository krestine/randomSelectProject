package ezo.mp.service;


import java.util.List;

import ezo.mp.domain.Cart;
import ezo.mp.domain.CartInfo;
import ezo.mp.domain.Product;

public interface ProductService {
	List<CartInfo> getCart(String userid);
	
	List<Product> getAllProducts();
	
	Product getProduct(String productCode);
	
	String insertCart(String productCode, String productEA, String userid);
	
	void cartDelete(String cartnumber);
	
}
