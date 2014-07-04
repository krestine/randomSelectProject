package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.EvaluateDTO;
import com.project.domain.MateDTO;
import com.project.domain.MemberDTO;
import com.project.domain.MenuDTO;
import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;
import com.project.service.EvaluateService;
import com.project.service.MateService;
import com.project.service.MemberService;
import com.project.service.MenuService;
import com.project.service.RestntService;

@Controller
public class CommunityController {

	@Autowired
	private MateService mateService;
	@Autowired
	private RestntService restntService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private MemberService memberService; 
	@Autowired
	private EvaluateService evaluateService;
	
		
	private MemberDTO loginUser;
	private MateDTO mate;
	private List<MateDTO> mates;
	private List<RestntDTO> restnts;
	private MemberDTO memInfo;
	private RestntDTO restnt;
	private MateDTO mateInfo;
	private List<EvaluateDTO> evaluates;
	private EvaluateDTO evaluate;
	private List<MenuDTO> menuInfo;
	
	// 회원 : 친구 리스트
	@RequestMapping(value = "/mateListProc.do", method = RequestMethod.POST)
	public String mateListProc(Model model, HttpServletRequest request) {
		
		loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		try {
			if (loginUser.getMemId() != null || loginUser != null) {
				
				try {
					mates = mateService
							.getMateListByMemId(loginUser.getMemId());
					System.out.println(mates);
					model.addAttribute("mates", mates);
					return "community/mateList";

				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");
					return "setting/error";
				}

			}
		} catch (Exception e) {
			model.addAttribute("errorMessage", "로그인 해주세요!");

		}
		return "setting/error";
	}

	// 회원 : 친구 상세정보
	@RequestMapping(value = "/mateDetailProc.do", method = RequestMethod.POST)
	public String mateDetailProc(Model model, MateDTO mateDto, String param , HttpServletRequest request) {
				
		mateInfo=mateService.getMemInfoByMemId(param);
		System.out.println(mateInfo);
		model.addAttribute("mateInfo", mateInfo);
				
		mate = mateService.getMateInfoByMateId(mateDto);
		System.out.println(mate);
		model.addAttribute("mate", mate);
		
		System.out.println(mateDto);
		return "community/mateDetail";
	}
	
	
	

	// 회원 : 친구들이 평가한 식당 리스트
	
	@RequestMapping(value =  "/restntListProc.do", method = RequestMethod.POST)
	public String restntListProc(Model model, String memId, HttpServletRequest request) {
		restnts= restntService.getEvalRestntListByMateId(loginUser.getMemId());
		model.addAttribute("restnts", restnts);
		System.out.println(restnts);
		System.out.println("restnts여기?");
		return "community/restntList";
	}
	
	/*
		@RequestMapping(value =  "/restntListProc.do", method = RequestMethod.POST)
		public String restntListProc(Model model, String memId, HttpServletRequest request) {
			//loginUser = (MemberDTO) request.getSession().getAttribute("loginUser");
			evaluates= evaluateService.getEvaluateListByMateId(loginUser.getMemId());
			model.addAttribute("evaluates", evaluates);
			System.out.println(evaluates);
			System.out.println("evaluates여기?");
			return "community/restntList";
		
		
	}
	*/
	
	// 회원 : 식당 상세정보
	
	
		@RequestMapping(value = "/restntDetailProc.do", method = RequestMethod.POST)
		public String restntDetailProc(Model model, String restntId, HttpServletRequest request) {
	
		restnt = restntService.getRestntInfoByRestntId(restntId);
		model.addAttribute("restnt", restnt);
		
		menuInfo = menuService.getMenuListByRestntId(restntId);
		model.addAttribute("menuInfo", menuInfo);
		System.out.println("menuInfo");
		System.out.println(menuInfo);
		
		return "community/restntDetail";

	}
	
}

