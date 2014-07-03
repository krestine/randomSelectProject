package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.project.service.MemberService;
import com.project.service.RestntService;

@Controller
public class EvaluateController {
	@Autowired
	private RestntService restntService;
	@Autowired
	private MemberService memberService; 
	@Autowired
	private EvaluateService evaluateService;

	private List<RestntDTO> restnts;
	private MemberDTO memInfo;
	private RestntDTO restnt;
	private MenuDTO menuInfo;
	
	
	private List<EvaluateDTO> memberEvaluates;
	/*
	 * @Autowired
	 * 
	 * /* // 회원 : 식당 리스트
	 * 
	 * @RequestMapping(value = "/evaluateListProc.do", method =
	 * RequestMethod.POST) public String restntListProc(Model model, RestntDTO
	 * restntDto) { List<RestntDTO> restnts = restntService.getRestntList();
	 * model.addAttribute("restnts", restnts);
	 * System.out.println("restntListProc()"); return "evaluate/evaluateList"; }
	 */
	// 평가 페이지
	@RequestMapping(value = "/evaluatemain.do", method = RequestMethod.POST)
	public String evaluatemain(Model model, String memId,
			HttpServletRequest request) {
		System.out.println("evaluatemain()");
		// 세션에서 로그인 정보 가져옴
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		// 로그인 정보의 아이디를 패러미터로 세팅

		List<EvaluateDTO> evaluates = evaluateService
				.getEvaluateListByMemId(loginUser.getMemId());
		model.addAttribute("evaluates", evaluates);
		return "evaluate/evaluate";
	}

	// 식당평가한 목록

	@RequestMapping(value = "/evaluateList.do", method = RequestMethod.POST)
	public String EvaluateListForm(HttpServletRequest request, Model model,
			String memId) {
		System.out.println("evaluateList()");
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		
		System.out.println(loginUser.toString());
		memId = loginUser.getMemId();
		System.out.println(memId);
		memberEvaluates = evaluateService.getEvaluateListByMemId(memId);
		model.addAttribute("memberEvaluates", memberEvaluates);
	System.out.println(memberEvaluates);
		return "evaluate/evaluateList";
	}

	// 평가 수정editOk
	@RequestMapping(value = "edit.do", method = RequestMethod.POST)
	public String edit(Model model, HttpServletRequest request) {
		// 저장해줘..(쿼리문으로 xml에 쓰면돼)

		return "evaluate/edit";
	}

	// 평가 수정editOk
	@RequestMapping(value = "editOk.do", method = RequestMethod.POST)
	public String editOk(Model model, HttpServletRequest request) {
		// 저장해줘..(쿼리문으로 xml에 쓰면돼)

		return "evaluate/editOk";
	}

	@RequestMapping(value = "/evaluateListProc.do", method = RequestMethod.POST)
	public String evaluateListProc(Model model, String memId,
			HttpServletRequest request) {
		System.out.println("evaluateListProc()");

		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		try {
			memId = loginUser.getMemId();
		} catch (Exception e) {
			model.addAttribute("errorMessage", "로그인 해 주세요!");
			return "setting/error";
		}

		System.out.println("평가 리스트 실행");
		try {
			List<EvaluateDTO> evaluates = evaluateService
					.getEvaluateListByMemId(memId);
			model.addAttribute("evaluates", evaluates);
			return "evaluate/evaluateList";

		} catch (Exception e) {
			model.addAttribute("errorMessage",
					"데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");
		}
		return "setting/error";

	}

	// 식당 평가 수정
	@RequestMapping(value = "/updateEvaluateListProc.do", method = RequestMethod.POST)
	public String updateEvaluateListProc(Model model, EvaluateDTO evaluateDto) {
		evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto);
		EvaluateDTO evaluate = (EvaluateDTO) evaluateService
				.getEvaluateListByMemId(evaluateDto.getMemId());
		model.addAttribute("evaluate", evaluate);
		return "evaluateListForm.do";
	}

	// 평가 안한 식당목록
	@RequestMapping(value = "/nEvaluateListForm.do", method = RequestMethod.POST)
	public String nEvaluateListForm(Model model, String memId) {
		System.out.println("nEvaluateListForm()");

		return "evaluate/nEvaluateList";
	}

	// 식당 평가 입력
	@RequestMapping(value = "/nEvaluateListProc.do", method = RequestMethod.POST)
	public String nEvaluateListProc(Model model, EvaluateDTO evaluateDTO) {
		System.out.println("nEvaluateListProc()");
		evaluateService.putScoreByEvaluateTerms(evaluateDTO);
		return "evaluate/nEvaluateListForm.do";
	}
}
