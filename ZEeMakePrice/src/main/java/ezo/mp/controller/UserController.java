package ezo.mp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ezo.mp.domain.Users;
import ezo.mp.service.UserService;
import ezo.mp.validation.RegistrationValidation;

@Controller
public class UserController {

	@Autowired
	private RegistrationValidation registrationValidation;
	@Autowired
	private UserService userService;

	// 占싸깍옙占쏙옙
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView Login(Model model, String userid, String password,
			HttpServletRequest request) {
		System.out.println("UserController -> login.do -> /login/login.jsp");
		System.out.println(userid + " 鍮꾨쾲" + password);
		Users users = new Users(userid, password);
		users = userService.loginUser(users);
		if(users==null)
		{
			return new ModelAndView("loginError");
		}
		model.addAttribute("loginUser", users);

		HttpSession session = request.getSession();
		if (!session.isNew()) {
			session = request.getSession(true);
		}

		session.setAttribute("name", users.getName());
		session.setAttribute("users", users);
		String welcome = "어서와";
		session.setAttribute("welcome", welcome);
		return new ModelAndView("login");
	}

	@RequestMapping("/loginForm.do")
	public ModelAndView LoginForm() {
		System.out
				.println("UserController -> loginForm.do -> /login/loginForm.jsp");
		return new ModelAndView("loginForm");
	}

	@RequestMapping("/logout.do")
	public ModelAndView LogOut(HttpServletRequest request) {
		System.out.println("header -> loginOut.do -> main");

		HttpSession session = request.getSession();
		session.removeAttribute("name");
		session.removeAttribute("user");
		session.invalidate();
		return new ModelAndView("logout");
	}

	// 회占쏙옙占쏙옙
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public ModelAndView Register(@Valid Users users, BindingResult result,
			Model model, HttpServletRequest request) {
		System.out.println(users);
		System.out.println("UserController -> register.do -> /main.jsp");

		// 異붽� �좏슚��泥댄겕(鍮꾨�踰덊샇 �뺤씤)
		registrationValidation.validate(users, result);

		if (result.hasErrors()) {
			model.addAttribute("list", userService.getJobCode());
			return new ModelAndView("registerForm");
		} else {
			String name = request.getParameter("name");
			System.out.println(name);
			HttpSession session = request.getSession();
			if (!session.isNew()) {
				session = request.getSession(true);
			}
			session.setAttribute("name", name);
		}
		userService.insertUser(users);
		return new ModelAndView("register");
	}

	@RequestMapping(value = "/idcheck.do", method = RequestMethod.POST)
	public String idCheck(@RequestParam String userid, Model model) {
		System.out.println(userid + " : " + "�꾩씠��泥댄겕");
		return "";
	}

	@RequestMapping("/registerForm.do")
	public ModelAndView RegisterForm(Users users, Model model) {
		model.addAttribute("list", userService.getJobCode());
		model.addAttribute(users);
		System.out
				.println("UserController -> register.do -> /register/registerForm.jsp");
		return new ModelAndView("registerForm");
	}
}
