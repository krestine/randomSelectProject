package ezo.mp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	@RequestMapping("/order.do")
	public ModelAndView Order(){
		System.out.println("OrderController -> order.do -> /orderRes.jsp");
		return new ModelAndView("order");
	}
	
	@RequestMapping("/orderList.do")
	public ModelAndView OrderList(){
		System.out.println("OrderController -> orderList.do -> /orderList.jsp");
		return new ModelAndView("orderList");
	}
	
	@RequestMapping("/orderContext.do")
	public ModelAndView OrderContext(){
		System.out.println("OrderController -> orderList.do -> /orderContext.jsp");
		return new ModelAndView("orderContext");
	}
}
