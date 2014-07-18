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
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.EvaluateDTO;
import com.project.domain.MateDTO;
import com.project.domain.MemberDTO;
import com.project.domain.MenuDTO;
import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;
import com.project.service.EvaluateService;
import com.project.service.MateService;
import com.project.service.MemberService;
import com.project.service.MenuService;
import com.project.service.RestntService;

@Controller
public class CommunityController {

	@Autowired
	private MateService mateService;
	@Autowired
	private RestntService restntService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private EvaluateService evaluateService;

	private MemberDTO loginUser;
	private MateDTO mate;
	private List<MateDTO> mates;
	private List<RestntDTO> restnts;
	private MemberDTO memInfo;
	private RestntDTO restnt;
	private MateDTO mateInfo;
	private List<EvaluateDTO> evaluates;
	private EvaluateDTO evaluate;
	private List<MenuDTO> menuInfo;

		
	// 회원 : 친구 리스트
	@RequestMapping(value = "/mateListProc.do", method = RequestMethod.POST)
	public String mateListProc(Model model, MateDTO mateDto, HttpServletRequest request) {

		loginUser = (MemberDTO) request.getSession().getAttribute("loginUser");
		try{
				if (loginUser.getMemId() != null || loginUser != null) { 
		}
			try{
					mateDto.setPageNum(1);
					mateDto.setViewCount(10);
					mateDto.setMemId(loginUser.getMemId());
					System.out.println(mateDto);			
					mates = mateService.mateListPaging(mateDto);
					System.out.println(mates);
					model.addAttribute("mates", mates);					
					
				}catch(Exception e){
					model.addAttribute("errorMessage", "데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");		
					return "setting/error";
				}
				
				}catch (Exception e) {model.addAttribute("errorMessage", "로그인 해주세요!");
				
				return "setting/error";
				}	
				
				return "mateList";	
	}

	// 친구 리스트 ajax

	@RequestMapping(value = "ajaxMateList.do", method = RequestMethod.POST)
	public void ajaxMateList(HttpServletRequest request,
			HttpServletResponse response, MateDTO mateDto) throws IOException {

		System.out.println("/ajaxMateList.do");
		mateDto.setMemId(loginUser.getMemId()); 
		System.out.println(mateDto);
		mates = mateService.mateListPaging(mateDto);

		JSONArray jsonArray = JSONArray.fromObject(mates);
		System.out.println("mates -" + jsonArray);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mates", mates);

		JSONObject jsonObject = JSONObject.fromObject(map);
		System.out.println("json - " + jsonObject);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toString());
	}

	// 친구 상세정보 ajax

	@RequestMapping(value = "ajaxMateDetail.do", method = RequestMethod.POST)
	public void ajaxMateDetail(HttpServletRequest request,
			HttpServletResponse response, MateDTO mateDto, String mateId,
			String memId) throws IOException {
		System.out.println("ajaxMateDetail.do");
		System.out.println(mateId);
		mateInfo = mateService.getMemInfoByMemId(mateId);
		System.out.println(mateInfo);

		System.out.println("memId:" + memId);
		System.out.println("mateId:" + mateId);
		mate = mateService.getMateInfoByMateId(memId, mateId);
		System.out.println(mate);
		// 제이슨으로 변환

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mateInfo", mateInfo);
		map.put("mate", mate);

		JSONObject jsonObject = JSONObject.fromObject(map);
		System.out.println("json - " + jsonObject);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toString());

	}

	// 회원 : 친구 상세정보
	@RequestMapping(value = "/mateDetailProc.do", method = RequestMethod.POST)
	public String mateDetailProc(Model model, String mateId, String memId,
			HttpServletRequest request) {
		// 친구의 상세정보

		mateInfo = mateService.getMemInfoByMemId(mateId);
		System.out.println("mateInfo");
		System.out.println(mateInfo);
		System.out.println("mateInfo 확인");
		model.addAttribute("mateInfo", mateInfo);

		// 친구의 상태정보

		mate = mateService.getMateInfoByMateId(memId, mateId);
		System.out.println(mate);
		model.addAttribute("mate", mate);
		System.out.println(memId);
		System.out.println(mateId);
		System.out.println("mate 확인");
		return "mateDetail";
	}

	// 회원 : 친구들이 평가한 식당 리스트

	@RequestMapping(value = "/restntListProc.do", method = RequestMethod.POST)
	public String restntListProc(Model model, RestntDTO restntDto, HttpServletRequest request) {
		loginUser = (MemberDTO) request.getSession().getAttribute("loginUser");
		try{
				if (loginUser.getMemId() != null || loginUser != null) { 
		}
			try{
					restntDto.setMemId(loginUser.getMemId());
					System.out.println(restntDto);
					restnts = restntService.getEvalRestntListByMateId(restntDto);
					model.addAttribute("restnts", restnts);
					System.out.println(restnts);
					System.out.println("restnts여기?");			
			}catch(Exception e){
				model.addAttribute("errorMessage", "데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");
				
				return "setting/error";
			}
			
			}catch (Exception e) {
				model.addAttribute("errorMessage", "로그인 해주세요!");
			
				return "setting/error";
			}
		return "restntList";
	}

	// 회원 : 식당 상세정보
	@RequestMapping(value = "/restntDetailProc.do", method = RequestMethod.POST)
	public String restntDetailProc(Model model, String restntId) {

		restnt = restntService.getRestntInfoByRestntId(restntId);
		model.addAttribute("restnt", restnt);

		menuInfo = menuService.getMenuListByRestntId(restntId);
		model.addAttribute("menuInfo", menuInfo);
		System.out.println("menuInfo");
		System.out.println(menuInfo);

		return "restntDetail";

	}

	// 회원 : 식당 상세정보 ajax
	@RequestMapping(value = "/ajaxRestntDetail.do", method = RequestMethod.POST)
	public void ajaxResntDetail(HttpServletRequest request,
			HttpServletResponse response, String restntId) throws IOException {

		restnt = restntService.getRestntInfoByRestntId(restntId);
		System.out.println(restnt);

		menuInfo = menuService.getMenuListByRestntId(restntId);
		System.out.println(menuInfo);

		JSONArray jsonArray = JSONArray.fromObject(menuInfo);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("restnt", restnt);
		map.put("menuInfo", jsonArray);

		JSONObject jsonObject = JSONObject.fromObject(map);
		System.out.println("json - " + jsonObject);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toString());

	}
}
