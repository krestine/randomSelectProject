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

import com.project.domain.EvaluateDTO;
import com.project.domain.LatLngDTO;
import com.project.domain.MemberDTO;
import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;
import com.project.domain.VisitDTO;
import com.project.service.EvaluateService;
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
	@Autowired
	private EvaluateService evalService;
	
	//private List<RestntDTO> restntList;
	private List<SettingDTO> walkRange;
	private List<RestntDTO> restnts;
	private List<VisitDTO> visits;
	private StringBuffer stringBuffer;
	private String menuCode = "00000000000000";
	
	public static final double latitudePer100m = 0.00089904586958998;
	public static final double longitudePer100m = 0.00139478242579723;
	
	@RequestMapping(value="/selectResult.do", method=RequestMethod.POST)
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
			HttpServletResponse response, String restntId, String restntName) throws IOException {
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		
		int lastVisitId;
		Object tempLastVisitId = visitService.getLastVisitId();
		if(tempLastVisitId==null){
			lastVisitId = 0;
		}else{
			lastVisitId = (int) tempLastVisitId;
		}
		System.out.println(restntId);
		VisitDTO visitDto = new VisitDTO((lastVisitId+1)+"", "1", loginUser.getMemId(), restntId, restntName);
		visitService.putVisit(visitDto);
		
		int lastEvalId;
		Object tempLastEvalId = evalService.getLastEvalId();
		if(tempLastEvalId==null){
			lastEvalId = 0;
		}else{
			lastEvalId = (int) tempLastEvalId;
		}

		EvaluateDTO evalDto = new EvaluateDTO((lastEvalId+1)+"", "-1", loginUser.getMemId(), restntId, restntName);
		Integer evalCount = evalService.countEvalByMemIdAndResntId(evalDto);
		if((int)evalCount==0){
			evalService.putEval(evalDto);
		}
		
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
		
		LatLngDTO latLngDto = new LatLngDTO();
		int sRadius = Integer.parseInt(restntDto.getAdress3());
		double latitude = Double.parseDouble(restntDto.getLatitude());
		double longitude = Double.parseDouble(restntDto.getLongitude());
		latLngDto.setMinLat(latitude - sRadius/100*latitudePer100m);
		latLngDto.setMaxLat(latitude + sRadius/100*latitudePer100m);
		latLngDto.setMinLng(longitude - sRadius/100*longitudePer100m);
		latLngDto.setMaxLng(longitude + sRadius/100*longitudePer100m);
		String excMenu = restntDto.getAdress4();
		
		System.out.println("/ajaxRandomRestnt.do");

		System.out.println(restntDto);
		// 확인
		
		
		// 쿼리 실행
		
		
		//restnts = restntService.getRestntListByAdress2(restntDto);
		restnts = restntService.getRestntListByLatLng(latLngDto);
		
		String[] excMenuArray = new String[14];
		excMenuArray = menuCodeDecoder(excMenu);
		
			for(int i=0;i<14;i++){
				for(int j=0;j<restnts.size();j++){
					if(restnts.get(j).getRestntCate().trim().compareTo(excMenuArray[i].trim())==0){
						restnts.remove(j);
						j--;
					}
				}
			}
		
		// 제이슨으로 변환
		JSONArray jsonArray = JSONArray.fromObject(restnts);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restnts", jsonArray);

		JSONObject jsonObject = JSONObject.fromObject(map);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toString());
	}
	
	
	@RequestMapping(value = "/ajaxRandomRestntDetail.do")
	public void ajaxRandomRestntDetail(HttpServletRequest request,
			HttpServletResponse response, String restntId )
			throws IOException {

		System.out.println(restntId);
		RestntDTO restnt = restntService.getRestntInfoById(restntId);
		System.out.println(restnt);

		JSONObject jsonObject = JSONObject.fromObject(restnt);
		System.out.println("json - " + jsonObject);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toString());
	}
		
	@RequestMapping(value = "/deleteVisitInfo.do", method = RequestMethod.POST)
	String deleteVisitInfo(VisitDTO visitDto, Model model, HttpServletRequest request) {
		String visitId = visitDto.getVisitId();
		visitService.dropVisitById(visitId);
		
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		model.addAttribute("loginUser", loginUser);
		
		System.out.println("login User : " + loginUser.getMemId());
		
		visits = visitService.getVisitInfoByMemId(loginUser.getMemId());
		model.addAttribute("visits", visits);
		
		return "visitList";
	}
	
	@RequestMapping("/visitList.do")
	String visitListProc(Model model, HttpServletRequest request) {
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		model.addAttribute("loginUser", loginUser);
		
		System.out.println("login User : " + loginUser.getMemId());
		
		visits = visitService.getVisitInfoByMemId(loginUser.getMemId());
		model.addAttribute("visits", visits);
		
		return "visitList";
	}

	public String[] menuCodeDecoder(String menuCode) {
		stringBuffer = new StringBuffer(menuCode);
		String[] menuArray = new String[14];
		for (Integer i = 0; i < 14; i++) {
			Character indexCode = stringBuffer.charAt(i);
			System.out.println(indexCode);
			String excMenuId = i.toString();
			menuArray[i] = (indexCode == '1') ? settingService
					.getExcMenuById(excMenuId) : "선택안함";
			System.out.println(menuArray[i]);
		}
		
		return menuArray;
	}
	
}
