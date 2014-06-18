package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.EvaluateService;
import com.project.service.MateService;
import com.project.service.MenuService;
import com.project.service.RestntService;

@Controller
public class CommunityController {
	
	@Autowired
	private MateService mateService;
	private RestntService restntService;
	private EvaluateService evaluateService;
	private MenuService menuService;
	
	// 친구 리스트
	@RequestMapping("/mateListProc.do")
	public String mateListProc(){
		System.out.println("mateListProc()");
		return "community/mateList";
	}
	
	
	// 친구 상세정보
	@RequestMapping("/mateDetailProc.do")
	public String mateDetailProc(){
		System.out.println("mateDetailProc()");
		return "community/mateDetail";
	}
	
	// 식당 리스트
	@RequestMapping("/restntListProc.do")
	public String restntListProc(){
		System.out.println("restntDetailProc()");
		return "community/restntDetail";
	}
	
	// 식당 상세정보

	@RequestMapping("/restntDetailProc.do")
	public String restntDetailProc(){
		System.out.println("restntDetailProc()");
		return "community/restntDetail";
	}

}
