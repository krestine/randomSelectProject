
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





	@RequestMapping(value="/evaluateListProc.do", method = RequestMethod.POST)
	public String evaluateListProc(Model model, String memId) {
		List<EvaluateDTO> evaluates = evaluateService.getEvaluateListByMemId(memId);
		model.addAttribute("evaluates", evaluates);
		System.out.println("evaluateListProc()");

		return "evaluate/evaluateList ";
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
		return "nEvaluateListForm.do";
	}
}

