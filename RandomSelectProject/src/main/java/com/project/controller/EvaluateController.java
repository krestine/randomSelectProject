
package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.EvaluateDTO;
import com.project.domain.MenuDTO;
import com.project.domain.RestntDTO;
import com.project.service.EvaluateService;

@Controller
public class EvaluateController {

	@Autowired
	private EvaluateService evaluateService;

	// 식당평가한 목록
	@RequestMapping(value="/evaluateListProc.do", method=RequestMethod.POST)
	public String evaluateListProc(Model model, EvaluateDTO evaluateDto ) {
		List<EvaluateDTO> evaluates=evaluateService.getEvaluateListByMemId(evaluateDto);
		Model.addAttribute("evaluates", evaluates);
				System.out.println("evaluateListProc()");
		return "evaluate/evaluateList";
	}
	
	
	// 식당 평점정보 수정
	/*
	 * @RequestMapping(value = "/EvaluateList.do", method = RequestMethod.POST)
	 * void evaluateInfoUpdate(Model model, String evaluateDto, Object evaluate)
	 * { evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto);
	 * List<EvaluateDTO> evaluate = evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto
	 * .getRestntId()); 
	 * model.addAttribute("evaluate", evaluate);
	 * System.out.println("evaluateListProc()");
	 * 
	 * 
	 * }
	 */

	/*
	 * // 식당 평점정보 수정
	 * 
	 * @RequestMapping(value = "/EvaluateList.do", method = RequestMethod.POST)
	 * String evaluateInfoUpdate(Model model, String evaluateDto) {
	 * evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto);
	 * 
	

	// 평가안한 방문리스트
	@RequestMapping("/nEvaluateListForm.do")
	public String nEvaluateListForm() {
		System.out.println("nEvaluateListForm()");
		return "history/visitList";
	}

	// 식당 평점정보 입력
	@RequestMapping("/EvaluateList.do")
	public void putEvaluateByScore(EvaluateDTO evaluateDto) {
	}

	/*
	 * // 회원 리스트에서 아이디 클릭 -> 회원의 평가 정보 리스트 표시 페이지
	 * 
	 * @RequestMapping(value = "EvaluateListProc.do", method =
	 * RequestMethod.POST) String EvaluateListProc(Model model, String memId) {
	 * List<EvaluateDTO> memberEvaluates = evaluateService
	 * .getEvaluateListByMemId(memId); model.addAttribute("memberEvaluates",
	 * memberEvaluates); return "EvaluateList"; }
	 */
	/*
	 * @RequestMapping("/mateListProc.do") public String mateListProc(){
	 * System.out.println("mateListProc()"); return "community/mateList"; }
	 */

	// ////////////////////////////////////////////////////////////////////////////////

	/*// 평가한 식당목록
	@RequestMapping(value = "/evaluateListForm.do", method = RequestMethod.POST)
	public String evaluateListForm(Model model, String memId) {
		
		System.out.println("evaluateListForm()");
		
		
				
		
	
	}
*/
	// 식당 평가 수정
	@RequestMapping(value = "/evaluateListProc.do", method = RequestMethod.POST)
	public String evaluateListProc(Model model, EvaluateDTO evaluateDto) {
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
		return "nEvaluateListForm.do";
	}
}

