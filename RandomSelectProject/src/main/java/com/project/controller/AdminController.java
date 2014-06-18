package com.project.controller;

import java.util.List;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.EvaluateDTO;
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
	
	//관리자 메인 페이지
	@RequestMapping(value = "/adminMainProc.do")
	String adminMainProc(Model model ){
		
		return "adminMain";
	}
	
	//회원 검색 페이지
	@RequestMapping(value = "/memberSearchForm.do")
	String memberSearchForm(Model model){
		return "memberSearch";
	}

	//Id로 회원검색
	@RequestMapping(value = "/memberSearchByIdProc.do",method = RequestMethod.POST)
	String memberSearchByIdProc(Model model,String memId){
		List<MemberDTO> members = memberService.getMemberListById(memId);
		model.addAttribute("members", members);
		return "memberList";
	}
	
	//이름으로 회원검색
	@RequestMapping(value = "/memberSearchByNameProc.do",method = RequestMethod.POST)
	String memberSearchByNameProc(Model model,String memName){
		List<MemberDTO> members = memberService.getMemberListById(memName);
		model.addAttribute("members", members);
		return "memberList";
	}
	
	//등급으로 회원 검색
	@RequestMapping(value = "/memberSearchByGradeProc.do",method = RequestMethod.POST)
	String memberSearchByGradeProc(Model model,String memGrade){
		List<MemberDTO> members = memberService.getMemberListById(memGrade);
		model.addAttribute("members", members);
		return "memberList";
	}
	
	//블랙 으로 회원 검색
	@RequestMapping(value = "/memberSearchByBlackProc.do",method = RequestMethod.POST)
	String memberSearchByBlackProc(Model model,String Black){
		List<MemberDTO> members = memberService.getMemberListById(Black);
		model.addAttribute("members", members);
		return "memberList";
	}
	
	//회원 리스트에서 아이디 클릭 -> 회원의 평가 정보 리스트 표시 페이지
	@RequestMapping(value = "memberEvaluateListProc.do",method = RequestMethod.POST)
	String memberEvaluateListProc(Model model,String memId){
		List<EvaluateDTO> memberEvaluates = evaluateService.getEvaluateListByMemId(memId);
		model.addAttribute("memberEvaluates", memberEvaluates);
		return "memberEvaluateList";
	}
	
	//식당 관리 페이지
	
}
