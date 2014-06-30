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
	@RequestMapping(value="/mateListProc.do", method = RequestMethod.POST)
	public String mateListProc(Model model, String memId, HttpServletRequest request) {
		System.out.println("mateListProc()");
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute("loginUser");
		try {
			memId= loginUser.getMemId();
		} catch (Exception e) {
			model.addAttribute("errorMessage", "로그인 해 주세요!");
			return "setting/error";
		}
		try {
			List<MateDTO> mates = mateService.getMateListByMateId();
			model.addAttribute("mates", mates);
			return "community/mateList";
		} catch (Exception e) {
			model.addAttribute("errorMessage", "데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");
		}
		return "setting/error";
	}

	// 회원 : 친구 상세정보
	@RequestMapping(value = "/mateDetailProc.do", method = RequestMethod.POST)
	public String mateDetailProc(Model model, String mateDto) {
		MateDTO mate = mateService.getMateInfoByMateId(mateDto);
		model.addAttribute("mate", mate);
		System.out.println("mateDetailProc()");
		return "community/mateDetail";
	}

	// 회원 : 식당 리스트
	@RequestMapping(value = "/restntListProc.do", method = RequestMethod.POST)
	public String restntListProc(Model model, RestntDTO restntDto) {
		List<RestntDTO> restnts = restntService.getRestntList();
		model.addAttribute("restnts", restnts);
		System.out.println("restntListProc()");
		return "community/restntList";
	}

	// 회원 : 식당 상세정보
	@RequestMapping(value = "/restntDetailProc.do", method = RequestMethod.POST)
	public String restntDetailProc(Model model, String restntId) {
		RestntDTO restnt = restntService.getRestntInfoById(restntId);
		model.addAttribute("restnt", restnt);
		System.out.println("restntDetailProc()");
		return "community/restntDetail";

	}

}
