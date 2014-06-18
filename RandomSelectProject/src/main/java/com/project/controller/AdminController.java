package com.project.controller;

import java.util.List;

import net.wimpi.telnetd.io.terminal.ansi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.MemberDTO;
import com.project.service.EvaluateService;
import com.project.service.MemberService;
import com.project.service.MenuService;
import com.project.service.RestntService;
import com.project.service.SettingService;




public class AdminController {
	
	@Autowired
	private EvaluateService evaluateService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private RestntService restntService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SettingService settingService;
	
	@RequestMapping(value = "/adminMainProc.do")
	String adminMainProc(Model model ){
		
		return "adminMain";
	}
	
	@RequestMapping(value = "/memberSearchForm.do")
	String memberSearchForm(Model model){
		return "memberSearch";
	}

	@RequestMapping(value = "/memberSearchProc.do",method = RequestMethod.POST)
	String memberSearchByIdProc(Model model,String memId){
		List<MemberDTO> members = memberService.getMemberListById(memId);
		model.addAttribute("members", members);
		return "memberList";
	}
}
