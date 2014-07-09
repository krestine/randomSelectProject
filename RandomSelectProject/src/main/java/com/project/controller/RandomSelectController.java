package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.MemberDTO;
import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;
import com.project.domain.VisitDTO;
import com.project.service.MemberService;
import com.project.service.RestntService;
import com.project.service.SettingService;
import com.project.service.VisitService;

@Controller
public class RandomSelectController {

	@Autowired
	private RestntService restntService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SettingService settingService;
	@Autowired
	private VisitService visitService;
	
	private List<RestntDTO> restntList;
	private List<SettingDTO> walkRange;
	
	@RequestMapping("/selectResult.do")
	public String randomSelectMain(Model model, HttpServletRequest request){
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		model.addAttribute("loginUser", loginUser);
		restntList = restntService.getRestntList();
		for(RestntDTO restnt : restntList){
			System.out.println(restnt.getRestntId());
		}
		
		walkRange = settingService.getWalkRange();
		model.addAttribute("walkRange", walkRange);
		
		model.addAttribute("restntList", restntList);
		return "selectResult";
	}

	@RequestMapping("/main.do")
	String adminMainProc(Model model,HttpServletRequest request) {
		System.out.println("main.do");
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute("loginUser");
		model.addAttribute("loginUser",loginUser);
		return "main";
	}
	
	@RequestMapping("ladderMake.do")
	String adminMainProc(Model model) {

		return "ladderMake";
	}
	
	@RequestMapping(value = "/ajaxConfirmRestnt.do", method = RequestMethod.POST)
	void ajaxRestntInfoUpdate(HttpServletRequest request,
			HttpServletResponse response, String restntId) throws IOException {
		System.out.println("/ajaxRestntInfoUpdate.do");
		
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		
		Date timeNow = new Date(Calendar.getInstance().getTimeInMillis());
		
		int lastVisitId = Integer.parseInt(visitService.getLastVisitId());
		
		VisitDTO visitDto = new VisitDTO(lastVisitId+1+"", timeNow, "1", loginUser.getMemId(), restntId);

		visitService.putVisit(visitDto);
		
		JSONObject json = new JSONObject();
		json.put("restntId", restntId);
		


		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toString());

	}

}
