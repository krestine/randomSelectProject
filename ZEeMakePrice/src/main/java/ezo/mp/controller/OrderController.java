package ezo.mp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ezo.mp.domain.CartInfo;
import ezo.mp.domain.Order;
import ezo.mp.domain.Users;
import ezo.mp.service.ProductService;

@Controller
public class OrderController {

	@Autowired
	private ProductService productService;

	@RequestMapping("/order.do")
	public ModelAndView Orders(Model model, String cartnumber, Order orders) {
		System.out.println("OrderController -> order.do -> /orderContext.jsp");
		System.out.println("오셧슈?");
		System.out.println(cartnumber);
		CartInfo order = productService.getCart(cartnumber);
		System.out.println(order);
		model.addAttribute("order", order);
		model.addAttribute("price", order.getAmount() / order.getEa());
		model.addAttribute("orders", orders);
		return new ModelAndView("orderContext");
	}

	@RequestMapping("/orderList.do")
	public ModelAndView OrderList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("users");
		if (users == null) {
			model.addAttribute("errorMessage", "로그인을 해주세요");
			return new ModelAndView("boardError");
		}
		model.addAttribute("orderlist",
				productService.getAllorderlist(users.getUserid()));
		System.out.println("OrderController -> orderList.do -> /orderList.jsp");
		return new ModelAndView("orderList");
	}

	@RequestMapping("/orderContext.do")
	public ModelAndView OrderContext(Model model, Order orders,
			HttpServletRequest request) {
		System.out.println(orders);

		HttpSession session = request.getSession();

		Users users = (Users) session.getAttribute("users");

		System.out.println("추가" + users.getUserid());
		orders.setUserid(users.getUserid());
		orders.setProductcode(productService.getProductCode(orders
				.getProductname()));
		System.out.println(orders);
		productService.insertOrder(orders);
		model.addAttribute("order", orders);
		System.out.println("OrderController -> orderList.do -> /orderRes.jsp");
		return new ModelAndView("order");
	}
}
