package com.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.velocity.runtime.directive.Evaluate;
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
	private Object evaluateList;

	// 평가 페이지(evaluate.jsp)
	@RequestMapping(value = "/evaluatemain.do", method = RequestMethod.POST)
	public String evaluatemain(Model model, String memId,
			HttpServletRequest request) {
		System.out.println("evaluatemain()");
		// 세션에서 로그인 정보 가져옴
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		// 로그인 정보의 아이디를 패러미터로 세팅

		List<EvaluateDTO> evaluates = evaluateService
				.getnEvaluateListByMemId(loginUser.getMemId());
		model.addAttribute("evaluates", evaluates);
		return "evaluate";
	}

	// 식당평가한 목록(evaluateList.jsp)
	@RequestMapping(value = "evaluateList.do")
	public String evaluateListForm(HttpServletRequest request, Model model, EvaluateDTO evaluateDto) {
		System.out.println("evaluateList()");
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		System.out.println("패러미터로 받은 DTO:" + evaluateDto);
		
		String memId = loginUser.getMemId();
		System.out.println("회원아이디 :: 컨트롤러에서 멤아이디" + memId);

		Integer viewCount = 10;
		evaluateDto.setViewCount(viewCount);
		evaluateDto.setMemId(memId);
		
		if(evaluateDto.getPageNum() == null){
			evaluateDto.setPageNum(1);
		}
		
		
		List<EvaluateDTO> ev = evaluateService.getEvaluateListByMemId(evaluateDto);

		// 총 리스트 수
		Integer listcount = evaluateService.getListCount(memId);
		System.out.println("count는 " + listcount);
		Integer pageCount = (int) Math.ceil((listcount/viewCount));
		Integer pageNum = evaluateDto.getPageNum();
		String pageCountStr = pageCount.toString();
		// 게시글 리스트
		
		model.addAttribute("boardList", ev);
		model.addAttribute("pageCount", pageCountStr);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("memId", memId);
		System.out.println("evaluateContorller:" + memId);
		return "evaluateList";
	}

	// 평가 안한 식당목록(nEvaluateList.jsp)
	@RequestMapping(value = "nEvaluateListForm.do")
	public String nEvaluateListForm(HttpServletRequest request, Model model,
			String memId) {
		System.out.println("nEvaluateListForm()");
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");

		System.out.println(loginUser.toString());
		memId = loginUser.getMemId();
		System.out.println(memId);
		memberEvaluates = evaluateService.getnEvaluateListByMemId(memId);
		model.addAttribute("memberEvaluates", memberEvaluates);
		System.out.println(memberEvaluates);
		return "nEvaluateList";
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
			return "error";
		}

		System.out.println("평가 리스트 실행");
		try {
			
		} catch (Exception e) {
			model.addAttribute("errorMessage",
					"데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");
		}
		return "error";

	}

	// 식당 평가 수정(evaluateList.nEvaluateList에서 사용)
	@RequestMapping(value = "edit.do", method = RequestMethod.POST)
	public String setScoreByEvaluateTerms(Model model, EvaluateDTO evaluateDto,
			String evalId, String memId, String score,
			HttpServletRequest request) {
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");

		System.out.println("memID edit::" + memId);
		System.out.println("evalId deit::" + evalId);
		evaluateDto.setMemId(loginUser.getMemId());
		evaluateDto.setEvalId(evalId);
		evaluateDto.setScore(score);
		evaluateService.setScoreByEvaluateTerms(evaluateDto);

		System.out.println("이벨아이디, 멤아이디::" + evalId + " & " + memId);

		System.out.println("edit()");
		return "forward:/evaluateList.do";

	}

	// 삭제(evaluateList.jsp에서 만 사용)
	@RequestMapping(value = "delete.do")
	public String deleteData(HttpServletRequest request, String memId,
			String evalId) {
		System.out.println("memID 딜리트::" + memId);
		System.out.println("evalId 딜리트::" + evalId);
		Map<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("evalId", evalId);
		evaluateService.deleteData(map);
		System.out.println("memID 딜리트::" + memId);
		System.out.println("evalId 딜리트::" + evalId);
		return "redirect:/nEvaluateListForm.do";

	}

	// nEvaluateList에서 수정
	@RequestMapping(value = "editOk.do", method = RequestMethod.POST)
	public String setScoreByEvaluateTerms1(Model model,
			EvaluateDTO evaluateDto, String evalId, String memId, String score,
			HttpServletRequest request) {
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");

		System.out.println("memID edit::" + memId);
		System.out.println("evalId deit::" + evalId);
		
		
		// 점수 수정 쿼리 실행
		evaluateDto.setMemId(loginUser.getMemId());
		evaluateDto.setEvalId(evalId);
		evaluateDto.setScore(score);
		
		evaluateService.setScoreByEvaluateTerms(evaluateDto);

		

		System.out.println("edit()");
		return "forward: /evaluateList.do";

	}

}