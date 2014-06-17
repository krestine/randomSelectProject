package ezo.mp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Index {
	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest request){
		System.out.println("Start -> / -> tiles Main");
		HttpSession session = request.getSession();
		if (!session.isNew()) {
			session = request.getSession(false);
		}
		
		return new ModelAndView("home");
	}
}