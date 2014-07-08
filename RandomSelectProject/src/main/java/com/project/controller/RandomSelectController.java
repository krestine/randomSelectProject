package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.MemberDTO;
import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;
import com.project.service.MemberService;
import com.project.service.RestntService;
import com.project.service.SettingService;

@Controller
public class RandomSelectController {

	@Autowired
	private RestntService restntService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SettingService settingService;
	
	private List<RestntDTO> restntList;
	private List<SettingDTO> walkRange;
	
	@RequestMapping("/selectResult.do")
	public String randomSelectMain(Model model, HttpServletRequest request){
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		model.addAttribute("loginUser", loginUser);
		restntList = restntService.getRestntList();
		for(RestntDTO restnt : restntList){
			System.out.println(restnt.getRestntId());
		}
		
		walkRange = settingService.getWalkRange();
		model.addAttribute("walkRange", walkRange);
		
		model.addAttribute("restntList", restntList);
		return "selectResult";
	}

	@RequestMapping("/main.do")
	String adminMainProc(Model model,HttpServletRequest request) {
		System.out.println("main.do");
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		return "main";
	}
	
	@RequestMapping("ladderMake.do")
	String adminMainProc(Model model) {

		return "ladderMake";
	}

}
