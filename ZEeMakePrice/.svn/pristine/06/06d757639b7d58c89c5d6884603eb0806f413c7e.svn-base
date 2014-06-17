package ezo.mp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezo.mp.dao.CartMapper;
import ezo.mp.dao.OrderMapper;
import ezo.mp.dao.ProductMapper;
import ezo.mp.domain.Cart;
import ezo.mp.domain.CartInfo;
import ezo.mp.domain.Order;
import ezo.mp.domain.Product;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Autowired
	private CartMapper cartMapper;

	@Autowired
	private OrderMapper orderMapper;

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
	public void insertCart(String productCode, String productEA, String userid,
			int amount) {
		Cart cart = new Cart(productCode, productEA, userid, amount);

		cartMapper.insertCart(cart);

	}

	@Override
	public List<CartInfo> getCarts(String userid) {
		return cartMapper.getCarts(userid);
	}

	@Override
	public void cartDelete(String cartnumber) {
		cartMapper.cartDelete(cartnumber);
	}

	@Override
	public CartInfo getCart(String cartNumber) {
		// TODO Auto-generated method stub
		return cartMapper.getCart(cartNumber);
	}

	@Override
	public String getProductCode(String productname) {
		// TODO Auto-generated method stub
		return productMapper.getProductCode(productname);
	}

	@Override
	public void insertOrder(Order orders) {
		System.out.println("왓니?");
		System.out.println(orders);

		orderMapper.insertOrder(orders);

	}

	@Override
	public List<Order> getAllorderlist(String userid) {
		return orderMapper.getAllorderlist(userid);
	}

}
