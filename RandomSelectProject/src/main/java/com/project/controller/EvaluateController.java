
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
import com.project.domain.MemberDTO;
import com.project.domain.MenuDTO;
import com.project.domain.RestntDTO;
import com.project.service.EvaluateService;

@Controller
public class EvaluateController {

	@Autowired
	private EvaluateService evaluateService;
	
	// 회원 리스트에서 아이디 클릭 -> 회원의 평가 정보 리스트 표시 페이지
			@RequestMapping(value = "/memberEvaluateListProc.do", method = RequestMethod.POST)
			String memberEvaluateListProc(Model model, String memId, List<EvaluateDTO> RestntEvaluates) {
				RestntEvaluates = evaluateService.getEvaluateListByMemId(memId);
				model.addAttribute("RestntEvaluates", RestntEvaluates);
				return "admin/memberEvaluateListAdmin";
			}

		/*	// 회원 리스트에서 등급, 블랙 수정내용 입력후 수정 버튼 클릭
			@RequestMapping(value = "/setMemberInfoProc.do", method = RequestMethod.POST)
			String setMemberInfo(MemberDTO memberDto, Model model) {
				System.out.println("수정 버튼 클릭");
				if (memberDto.getBlack() == null) {
					memberDto.setBlack("0");
				}
				System.out.println(memberDto);
				String memId = memberDto.getMemId();
				memberService.setMemberInfo(memberDto);
				members = memberService.getMemberListById(memId);
				model.addAttribute("members", members);
				return "admin/memberList";
			}
		*/

	
	
	// 식당평가한 목록
	
		@RequestMapping(value = "/evaluateListForm.do", method = RequestMethod.POST)
		public String EvaluateListForm(Model model, String box, String memId) {
			System.out.println("evaluateListForm()");
		
			return "evaluate/edit";
		}
	
		
		//평가 수정editOk
		@RequestMapping(value="editOk.do", method = RequestMethod.POST)
		public String editOk(Model model, HttpServletRequest request) {
		//저장해줘..(쿼리문으로 xml에 쓰면돼)
			
			return "evaluate/editOk";
			}
		
	@RequestMapping(value="/evaluateListProc.do", method = RequestMethod.POST)
	public String evaluateListProc(Model model, String memId, HttpServletRequest request) {
		System.out.println("evaluateListProc()");

		
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute("loginUser");
		try {
			memId = loginUser.getMemId();
		} catch (Exception e) {
			model.addAttribute("errorMessage",
					"로그인 해 주세요!");
			return "setting/error";
		}
		
		System.out.println("평가 리스트 실행");
		try {
			List<EvaluateDTO> evaluates = evaluateService.getEvaluateListByMemId(memId);
			model.addAttribute("evaluates", evaluates);
			return "evaluate/evaluateList";
		
		} catch (Exception e) {
			model.addAttribute("errorMessage", "데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");
		}
		return "setting/error";
		


		
	}

	// 식당 평가 수정
	@RequestMapping(value = "/updateEvaluateListProc.do", method = RequestMethod.POST)
	public String updateEvaluateListProc(Model model, EvaluateDTO evaluateDto) {
		evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto);
		EvaluateDTO evaluate=(EvaluateDTO) evaluateService.getEvaluateListByMemId(evaluateDto.getMemId());
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

