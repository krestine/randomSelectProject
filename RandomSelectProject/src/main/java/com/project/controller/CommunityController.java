package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.MateDTO;
import com.project.domain.MenuDTO;
import com.project.domain.RestntDTO;
import com.project.service.EvaluateService;
import com.project.service.MateService;
import com.project.service.MenuService;
import com.project.service.RestntService;

@Controller
public class CommunityController {
	
	@Autowired
	private MateService mateService;
	@Autowired
	private RestntService restntService;
	
	// 회원 : 친구 리스트
<<<<<<< HEAD
	@RequestMapping(value="/mateListProc.do")
=======
	@RequestMapping("/mateListProc.do")
>>>>>>> e4d9167483ebb3648af7703d8af045f1778a7b61
	public String mateListProc(Model model, MateDTO mateDto){
		List<MateDTO> mates = mateService.getMateListByMateId(); 
		model.addAttribute("mates", mates);
		System.out.println("mateListProc()");
		return "community/mateList";
	}
	
	// 회원 : 친구 상세정보
<<<<<<< HEAD
	@RequestMapping(value="/mateDetailProc.do", method = RequestMethod.POST)
=======
	@RequestMapping("/mateDetailProc.do")
>>>>>>> e4d9167483ebb3648af7703d8af045f1778a7b61
	public String mateDetailProc(Model model, String mateDto){
		MateDTO mate = mateService.getMateInfoByMemId(mateDto);
		model.addAttribute("mate", mate);
		System.out.println("mateDetailProc()");
		return "mateDetail";
	}
	
	// 회원 : 식당 리스트
<<<<<<< HEAD
	@RequestMapping(value="/restntListProc.do", method = RequestMethod.POST)
=======
	@RequestMapping("/restntListProc.do")
>>>>>>> e4d9167483ebb3648af7703d8af045f1778a7b61
	public String restntListProc(Model model, RestntDTO restntDto){
		List<RestntDTO> restnts = restntService.getRestntList();
		model.addAttribute("restnts", restnts);
		System.out.println("restntListProc()");
		return "community/restntList";
	}
		
	// 회원 : 식당 상세정보
	@RequestMapping("/restntDetailProc.do")
	public String restntDetailProc(Model model, String restntId){
		RestntDTO restnt = restntService.getRestntInfoById(restntId);
		model.addAttribute("restnt", restnt);
		System.out.println("restntDetailProc()");
		return "community/restntDetail";
	
	}
	
}
