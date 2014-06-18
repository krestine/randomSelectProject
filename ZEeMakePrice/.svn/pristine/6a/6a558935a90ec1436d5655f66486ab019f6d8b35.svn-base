package ezo.mp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ezo.mp.domain.Cart;
import ezo.mp.domain.Users;
import ezo.mp.service.ProductService;

@Controller
public class CartController {

	@Autowired
	private ProductService productService;

	@RequestMapping("/cartContext.do")
	public ModelAndView cartList(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		Users users=(Users)session.getAttribute("users");
		System.err.println("주문내역");
		System.out.println(users.getUserid());
		model.addAttribute("list", productService.getCart(users.getUserid()));
		System.out.println("CartController -> cartContext.do -> /cartContext.jsp");
		return new ModelAndView("cartContext");
	}
	
	@RequestMapping("/cartDelete.do")
	public ModelAndView cartDelete(Model model, HttpServletRequest request, @RequestParam String cartnumber){
		System.err.println(cartnumber);
		productService.cartDelete(cartnumber);
		HttpSession session = request.getSession();
		Users users=(Users)session.getAttribute("users");
		model.addAttribute("list", productService.getCart(users.getUserid()));
		System.out.println("CartController -> cartContext.do -> /cartContext.jsp");
		return new ModelAndView("cartContext");
	}
	
	@RequestMapping("/productCon.do")
	public ModelAndView ProductList(Model model, String productCode,
			String productEA, String check, HttpServletRequest request) {
		System.out
				.println("CartController -> cartContext.do -> /cartContext.jsp");
		System.out.println(productCode + "���� : " + productEA + check);
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("users");
		System.out.println(user);

		System.out.println("�ڵ�" + productCode + "���� " + productEA + " ���̵�"
				+ user.getUserid());
		String CartCode=productService.insertCart(productCode, productEA,
				user.getUserid());
		
		if (check.equals("�����ϱ�")) {
			System.out.println("�Ŀ�");
		}
		
		return new ModelAndView("cartSuccess");
	}
}
