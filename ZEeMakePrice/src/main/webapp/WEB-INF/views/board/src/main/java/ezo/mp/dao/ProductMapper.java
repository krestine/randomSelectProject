package ezo.mp.dao;


import java.util.List;


import ezo.mp.domain.Cart;
import ezo.mp.domain.Product;

public interface ProductMapper {
	
	List<Product> getAllProducts();
	
	Product getProduct(String productCode);
	

}
