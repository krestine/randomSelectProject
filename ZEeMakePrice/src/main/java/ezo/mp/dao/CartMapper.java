package ezo.mp.dao;

import java.util.List;

import ezo.mp.domain.Cart;
import ezo.mp.domain.CartInfo;

public interface CartMapper {

	List<CartInfo> getCarts(String userid);
	void insertCart(Cart cart);
	void cartDelete(String cartnumber);
	CartInfo getCart(String cartNumber);
}
