package com.project.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;


import com.project.domain.EvaluateDTO;
import com.project.service.EvaluateService;

@Controller
public class EvaluateController {

	@Autowired
	private EvaluateService evaluateService;
// 식당평가한 목록
	@RequestMapping("/evaluateListProc.do")
	public String evaluateListProc() {
		System.out.println("evaluateListProc()");
		return "history/visitList ";
	}

	/*// 식당 정보 추가
	String restntInfoInsert(Model model, RestntDTO restntDto) {
		restntService.putRestnt(restntDto);
		RestntDTO restnt = restntService.getRestntInfoById(restntDto
				.getRestntId());
		model.addAttribute("restnt", restnt);
		return "restntInfo";
	}
*/
	// 식당 평점정보 수정
/*	@RequestMapping(value = "/EvaluateList.do", method = RequestMethod.POST)	
	void evaluateInfoUpdate(Model model, String evaluateDto, Object evaluate) {
			evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto);
			List<EvaluateDTO> evaluate = evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto
					.getRestntId());
			model.addAttribute("evaluate", evaluate);
			
		}
	*/
	

/*	// 식당 평점정보 수정
	@RequestMapping(value = "/EvaluateList.do", method = RequestMethod.POST)
	String evaluateInfoUpdate(Model model, String evaluateDto) {
		evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto);
		@SuppressWarnings("unchecked")
		List<EvaluateDTO> evaluate = evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto);
		model.addAttribute("evaluate", evaluate);
		return "nEvaluate/visitList";
	}*/


	// 평가안한 방문리스트
	@RequestMapping("/nEvaluateListForm.do")
	public String nEvaluateListForm() {
		System.out.println("nEvaluateListForm()");
		return "history/visitList";
	}

	//식당 평점정보 입력
	@RequestMapping("/EvaluateList.do")
	public void putEvaluateByScore(EvaluateDTO evaluateDto) {
	}
	/*	// 회원 리스트에서 아이디 클릭 -> 회원의 평가 정보 리스트 표시 페이지
	@RequestMapping(value = "EvaluateListProc.do", method = RequestMethod.POST)
	String EvaluateListProc(Model model, String memId) {
		List<EvaluateDTO> memberEvaluates = evaluateService
				.getEvaluateListByMemId(memId);
		model.addAttribute("memberEvaluates", memberEvaluates);
		return "EvaluateList";
	}*/
/*	
	@RequestMapping("/mateListProc.do")
	public String mateListProc(){
		System.out.println("mateListProc()");
		return "community/mateList";
	}
	*/
	
}
