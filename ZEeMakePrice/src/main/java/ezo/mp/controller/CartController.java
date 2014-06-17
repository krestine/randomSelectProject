package ezo.mp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ezo.mp.domain.Cart;
import ezo.mp.domain.CartInfo;
import ezo.mp.domain.Product;
import ezo.mp.domain.Users;
import ezo.mp.service.ProductService;

@Controller
public class CartController {

	@Autowired
	private ProductService productService;

	@RequestMapping("/cartContext.do")
	public String cartList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("users");
		if (users == null) {
			model.addAttribute("errorMessage", "로그인을 해주세요");
			return "boardError";
		}

		System.out.println(users.getUserid());
		List<CartInfo> cartList= productService.getCarts(users.getUserid());
		int sum=0;
		for(CartInfo i :cartList){
			sum +=  i.getAmount();
		}
		
		model.addAttribute("list", cartList);
		model.addAttribute("sum", sum);
		System.out
				.println("CartController -> cartContext.do -> /cartContext.jsp");
		
		return "cartContext";
	}

	@RequestMapping("/cartDelete.do")
	public ModelAndView cartDelete(Model model, HttpServletRequest request,
			@RequestParam String cartnumber) {
		System.err.println(cartnumber);
		productService.cartDelete(cartnumber);
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("users");
		model.addAttribute("list", productService.getCart(users.getUserid()));
		System.out
				.println("CartController -> cartContext.do -> /cartContext.jsp");
		return new ModelAndView("cartRes");
	}

	@RequestMapping("/productCon.do")
	public String ProductList(Model model, String productCode,
			String productEA, String check, HttpServletRequest request) {
		System.out
				.println("CartController -> cartContext.do -> /cartContext.jsp");
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("users");
		if (users == null) {
			model.addAttribute("errorMessage", "로그인을 해주세요");
			return "boardError";
		}
		System.out.println(users);
		Product product = productService.getProduct(productCode);

		int amount = product.getProductPrice() * Integer.parseInt(productEA);
		productService.insertCart(productCode, productEA,
				users.getUserid(),amount);

		return "cartSuccess";
	}
}
