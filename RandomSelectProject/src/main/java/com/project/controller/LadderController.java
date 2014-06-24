package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LadderController {
	
	@RequestMapping("ladderMake.do")
	public String randomSelectMain(){
		return "ladderMake";
	}
}
