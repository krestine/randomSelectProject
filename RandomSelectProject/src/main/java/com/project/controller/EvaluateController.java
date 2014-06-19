package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.EvaluateDTO;
import com.project.service.EvaluateService;

@Controller
public class EvaluateController {

	@Autowired
	private EvaluateService evaluateService;

	// 식당평가한 목록
	@RequestMapping("/evaluateListForm.do")
	public String evaluateListForm() {
		System.out.println("evaluateListForm()");
		return "evaluate/visitList ";
	}

	// 식당 평점정보 수정
	@RequestMapping(value = "/EvaluateList.do", method = RequestMethod.POST)
	String evaluateInfoUpdate(Model model, EvaluateDTO evaluateDto) {
		evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto);
		List<EvaluateDTO> evaluate = evaluateService.setEvaluateInfoByEvaluateTerms(evaluateDto.getEvalId());
		model.addAttribute("evaluate", evaluate);
		return "nEvaluate/visitList";
	}

	// 평가안한 방문리스트
	@RequestMapping("/nEvaluateListForm.do")
	public String nEvaluateListForm() {
		System.out.println("nEvaluateListForm()");
		return "nEvaluate/visitList";
	}
}
