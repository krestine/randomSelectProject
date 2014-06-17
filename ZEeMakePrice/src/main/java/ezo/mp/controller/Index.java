package ezo.mp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Index {
	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest request){
		System.out.println("Start -> / -> tiles Main");

		return new ModelAndView("home");
	}
}