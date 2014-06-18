package ezo.mp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ezo.mp.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@RequestMapping("/productList.do")
	public ModelAndView ProductList(Model model) {
		System.out
				.println("ProductController -> productList.do -> /productList.jsp");

		System.out.println(productService.getAllProducts());
		model.addAttribute("productList", productService.getAllProducts());

		return new ModelAndView("productList");
	}

	@RequestMapping("/productContext.do")
	public ModelAndView ProductContext(Model model, String productCode) {

		System.out.println("values_" + productCode);

		
		  model.addAttribute("product",productService.getProduct(productCode));
		  System.out.println(productService.getProduct(productCode));
		 
		System.out
				.println("ProductController -> productContext.do -> /productContext.jsp");
		return new ModelAndView("productContext");
	}

}
