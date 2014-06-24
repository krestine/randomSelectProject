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
import com.project.service.RestntService;

@Controller
public class RandomSelectController {

	@Autowired
	private RestntService restntService;
	
	@RequestMapping("/selectResult.do")
	public String randomSelectMain(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberDTO memberDto = (MemberDTO) session.getAttribute("memberDto");
		if(memberDto==null){
			model.addAttribute("loginMode", "0");
		}
		else{
			model.addAttribute("loginMode", memberDto.getMemGrade());
		}
		List<RestntDTO> restntList = restntService.getRestntList();
		model.addAttribute("restntList", restntList);
		return "selectResult";
	}

	@RequestMapping(value = "/mainProc.do")
	String adminMainProc(Model model) {
		
		return "randomSelect/main";
	}

}
