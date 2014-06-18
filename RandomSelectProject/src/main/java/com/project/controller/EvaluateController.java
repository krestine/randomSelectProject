package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.service.EvaluateService;

@Controller
public class EvaluateController{
	
@Autowired
	private EvaluateService evaluateService;
	 
	//식당평가한 목록
	@RequestMapping("/evaluateListForm.do")
	public String evaluateListForm(){
	System.out.println("evaluateListForm()");
	return "evaluate/visitList ";
	}
	
	//평가안한 방문리스트
	@RequestMapping("/nEvaluateListForm.do")
	public String nEvaluateListForm() {
	System.out.println("nEvaluateListForm()");
	return "nEvaluate/visitList";
	}

	
	
}
