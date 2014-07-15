package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
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
	
	//private List<RestntDTO> restntList;
	private List<SettingDTO> walkRange;
	private List<RestntDTO> restnts;
	
	@RequestMapping("/selectResult.do")
	public String randomSelectMain(Model model, HttpServletRequest request){
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		model.addAttribute("loginUser", loginUser);
		/*restntList = restntService.getRestntList();
		for(RestntDTO restnt : restntList){
			System.out.println(restnt.getRestntId());
		}*/
		
		walkRange = settingService.getWalkRange();
		model.addAttribute("walkRange", walkRange);
		
		//model.addAttribute("restntList", restntList);
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
	String ladderMake(Model model) {

		return "ladderMake";
	}
	
	@RequestMapping(value = "/ajaxConfirmRestnt.do", method = RequestMethod.POST)
	void ajaxConfirmRestnt(HttpServletRequest request,
			HttpServletResponse response, String restntId) throws IOException {
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		
		int lastVisitId = Integer.parseInt(visitService.getLastVisitId());
		System.out.println(restntId);
		VisitDTO visitDto = new VisitDTO((lastVisitId+1)+"", "1", loginUser.getMemId(), restntId);
		visitService.putVisit(visitDto);
		JSONObject json = new JSONObject();
		json.put("restntId", restntId);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toString());
	}
	
	@RequestMapping(value = "/ajaxRandomRestnt.do")
	public void ajaxRandomRestnt(HttpServletRequest request,
			HttpServletResponse response, RestntDTO restntDto )
			throws IOException {
		System.out.println("/ajaxRandomRestnt.do");

		System.out.println(restntDto);
		// 확인
		
		
		// 쿼리 실행
		
		
		restnts = restntService.getRestntListByAdress2(restntDto);
		System.out.println(restnts);

		// 제이슨으로 변환
		JSONArray jsonArray = JSONArray.fromObject(restnts);

		System.out.println("restnts - " + jsonArray);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restnts", jsonArray);

		JSONObject jsonObject = JSONObject.fromObject(map);
		System.out.println("json - " + jsonObject);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toString());
	}
	
	@RequestMapping("visitList.do")
	String visitListProc(Model model) {

		return "visitList";
	}

}
