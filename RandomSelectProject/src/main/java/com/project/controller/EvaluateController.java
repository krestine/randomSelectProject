package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.EvaluateDTO;
import com.project.domain.RestntDTO;
import com.project.service.EvaluateService;

@Controller
public class EvaluateController {

	@Autowired
	private EvaluateService evaluateService;
// restntService는 쓰지않을것임. evaluate테이블에 RestntId 내용 추가해서 넣을 것이기 때문에 
//내가 만들것.. 식당평가 목록과 식당평점정보수정 그리고 평가안한 방문리스트와 평점입력 하기만 만들면 되는데 ㅠㅠ 흡..
	private Object evalScore;
	


	
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
	//식당 평점정보 수정
	@RequestMapping(value = "/EvaluateListForm.do", method = RequestMethod.POST)
	public String evaluateInfoUpdateForm(Model model, String evaluateDto) {
		
		EvaluateDTO evaluate = evaluateService.getEvaluateListByMemid(evalScore);
		model.addAttribute("evaluate", evaluate);
		return "EvaluateInfoUpdateForm";
	}
	
	
		
	// 평가안한 방문리스트
	@RequestMapping("/nEvaluateListForm.do")
	public String nEvaluateListForm() {
		System.out.println("nEvaluateListForm()");
		return "history/visitList";
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
