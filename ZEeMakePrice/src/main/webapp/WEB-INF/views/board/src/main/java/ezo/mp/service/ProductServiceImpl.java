package ezo.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezo.mp.dao.CartMapper;
import ezo.mp.dao.ProductMapper;
import ezo.mp.domain.Cart;
import ezo.mp.domain.CartInfo;
import ezo.mp.domain.Product;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Autowired
	private CartMapper cartMapper;

	@Override
	public List<Product> getAllProducts() {

		return productMapper.getAllProducts();
	}

	@Override
	public Product getProduct(String productCode) {
		// TODO Auto-generated method stub
		return productMapper.getProduct(productCode);
	}

	@Override
	public String insertCart(String productCode, String productEA, String userid) {
		String cartCode=productCode+userid+productEA;
		System.out.println(cartCode+"/"+userid+productCode+productEA);
		Cart cart= new Cart(cartCode,productCode,productEA,userid);
		
		cartMapper.insertCart(cart);
		return cartCode;
	}

	@Override
	public List<CartInfo> getCart(String userid) {
		return cartMapper.getCart(userid);
	}

	@Override
	public void cartDelete(String cartnumber) {
		cartMapper.cartDelete(cartnumber);
	}

}
