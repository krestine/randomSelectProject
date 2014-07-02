package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.MemberDTO;
import com.project.domain.RestntDTO;
import com.project.service.MemberService;
import com.project.service.RestntService;

@Controller
public class RandomSelectController {

	@Autowired
	private RestntService restntService;
	@Autowired
	private MemberService memberService;
	
	private List<RestntDTO> restntList;
	
	@RequestMapping("/selectResult.do")
	public String randomSelectMain(Model model, HttpServletRequest request){
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		model.addAttribute("loginUser", loginUser);
		restntList = restntService.getRestntList();
		
		model.addAttribute("restntList", restntList);
		return "randomSelect/selectResult";
	}

	@RequestMapping("/main.do")
	String adminMainProc(Model model,HttpServletRequest request) {
		System.out.println("main.do");
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		return "randomSelect/main";
	}

}
