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
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.EvaluateDTO;
import com.project.domain.MemberDTO;
import com.project.domain.MenuDTO;
import com.project.domain.RestntDTO;
import com.project.domain.SettingDTO;
import com.project.service.EvaluateService;
import com.project.service.MemberService;
import com.project.service.MenuService;
import com.project.service.RestntService;
import com.project.service.SettingService;

@Controller
public class AdminController {

	@Autowired
	private EvaluateService evaluateService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private RestntService restntService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private SettingService settingService;

	private List<MemberDTO> members;
	private List<RestntDTO> restnts;
	private RestntDTO restnt;
	private List<MenuDTO> menus;
	private MenuDTO menu;
	private List<EvaluateDTO> memberEvaluates;
	List<String> grades;
	private List<String> adress1;
	private List<String> adress2;
	private List<String> adress3;
	private SettingDTO settingDto;
	private StringBuffer stringBuffer;
	private List<SettingDTO> excMenus;
	private String lastId;
	private String newId;
	private String adressCode;
	private RestntDTO restntDto;

	// 관리자 메인 페이지
	@RequestMapping(value = "/adminMainProc.do")
	String adminMainProc(Model model) {

		return "adminMain";
	}

	// 회원 검색 페이지
	@RequestMapping(value = "/memberSearchForm.do")
	String memberSearchForm(Model model) {
		return "memberSearch";
	}

	@RequestMapping(value = "/memberSearchProc.do", method = RequestMethod.POST)
	String memberSearchProc(int caseCode, String param, Model model) {
		switch (caseCode) {
		// 아이디 검색
		case 1:
			members = memberService.getMemberListById(param);
			model.addAttribute("members", members);
			break;

		// 이름으로 검색
		case 2:
			members = memberService.getMemberListByName(param);
			model.addAttribute("members", members);
			break;

		// 등급으로 검색
		case 3:
			members = memberService.getMemberListByGrade(param);
			model.addAttribute("members", members);
			break;

		// 블랙리스트 검색
		case 4:
			members = memberService.getMemberListByBlack(param);
			model.addAttribute("members", members);
			break;

		default:
			model.addAttribute("errorMessage", "검색 오류 발생");
			return "setting/error";
		}
		grades = settingService.getGradeValue();
		model.addAttribute("grades", grades);
		return "memberList";

	}

	// 회원 리스트에서 아이디 클릭 -> 회원의 평가 정보 리스트 표시 페이지
	@RequestMapping(value = "/memberEvaluateListProc.do", method = RequestMethod.POST)
	String memberEvaluateListProc(Model model, HashMap<String, Object> memId) {
		memberEvaluates = evaluateService.getEvaluateListByMemId(memId);
		model.addAttribute("memberEvaluates", memberEvaluates);
		return "admin/memberEvaluateListAdmin";
	}

	// 회원 리스트에서 등급, 블랙 수정내용 입력후 수정 버튼 클릭
	@RequestMapping(value = "/setMemberInfoProc.do", method = RequestMethod.POST)
	String setMemberInfo(MemberDTO memberDto, Model model) {
		System.out.println("수정 버튼 클릭");
		if (memberDto.getBlack() == null) {
			memberDto.setBlack("0");
		}
		System.out.println(memberDto);
		String memId = memberDto.getMemId();
		memberService.setMemberInfo(memberDto);
		members = memberService.getMemberListById(memId);
		model.addAttribute("members", members);
		return "memberList";
	}

	// 식당 관리 페이지
	@RequestMapping(value = "/restntManantProc.do")
	String restntManantProc(Model model, Integer caseCode, SettingDTO settingDto) {
		if (caseCode == null) {
			caseCode = 0;
		}
		switch (caseCode) {
		case 0:
			adress1 = settingService.getAdress1();
			List<SettingDTO> restntCates = settingService.getExcMenu();
			model.addAttribute("adress1", adress1);
			model.addAttribute("restntCates", restntCates);
			break;

		case 1:
			adress1 = settingService.getAdress1();
			adress2 = settingService.getAdress2(settingDto);

			model.addAttribute("adress1", adress1);
			model.addAttribute("adress2", adress2);
			model.addAttribute("code", settingDto);
			break;

		case 2:
			adress1 = settingService.getAdress1();
			adress2 = settingService.getAdress2(settingDto);
			adress3 = settingService.getAdress3(settingDto);
			model.addAttribute("adress1", adress1);
			model.addAttribute("adress2", adress2);
			model.addAttribute("adress3", adress3);
			model.addAttribute("code", settingDto);
			break;

		case 3:

			adress1 = settingService.getAdress1();
			adress2 = settingService.getAdress2(settingDto);
			adress3 = settingService.getAdress3(settingDto);
			System.out.println("////////세팅 디티오//////////");
			System.out.println(settingDto);

			restnts = restntService.getRestntListByAddr(settingDto);
			System.out.println("/////////쿼리 결과 테스트//////////");
			for (RestntDTO restnt : restnts) {
				System.out.println(restnt);
			}

			model.addAttribute("adress1", adress1);
			model.addAttribute("adress2", adress2);
			model.addAttribute("adress3", adress3);
			model.addAttribute("restnts", restnts);
			model.addAttribute("code", settingDto);
			break;
		default:
			model.addAttribute("errorMessage", "검색 오류 발생");
			return "setting/error";
		}

		model.addAttribute("choice", settingDto);
		return "restntManant";
	}

	/*
	 * // 식당 선택 페이지 주소 필터 : 패러미터, 셀렉트 박스와 관련된 query 문 추가 해야함
	 * 
	 * @RequestMapping(value = "/restntSelectForm.do") String
	 * restntSelectForm(Model model) { return "admin/restntSelect"; }
	 */

	/*
	 * // 주소 필터 적용-> 검색 결과 : 식당 리스트
	 * 
	 * @RequestMapping(value = "/restntSelectProc.do", method =
	 * RequestMethod.POST) String restntSelectProc(Model model, String
	 * addressCode) { restnts =
	 * restntService.getRestntListByAddressCode(addressCode);
	 * model.addAttribute("restnts", restnts); return "admin/restntListAdmin";
	 * 
	 * }
	 */

	// 식당 리스트에서 식당 이름 선택 -> 식당 상세 정보 표시
	@RequestMapping(value = "/restntInfoForm.do", method = RequestMethod.POST)
	String restntInfoForm(Model model, String restntId, Integer caseCode,
			SettingDTO settingDto) {
		System.out.println("/restntInfoForm.do");
		System.out.println(settingDto);
		System.out.println(restntId);
		adress1 = settingService.getAdress1();
		adress2 = settingService.getAdress2(settingDto);
		adress3 = settingService.getAdress3(settingDto);

		/* restnts = restntService.getRestntListByAddr(settingDto); */
		/* System.out.println("/////////쿼리 결과 테스트//////////"); */

		menus = menuService.getMenuListByRestntId(restntId);
		model.addAttribute("menus", menus);

		model.addAttribute("adress1", adress1);
		model.addAttribute("adress2", adress2);
		model.addAttribute("adress3", adress3);
		/* model.addAttribute("restnts", restnts); */
		/* model.addAttribute("code", settingDto); */

		/* model.addAttribute("choice", settingDto); */
		restnt = restntService.getRestntInfoById(restntId);
		List<SettingDTO> excMenus = settingService.getExcMenu();

		model.addAttribute("restnt", restnt);
		model.addAttribute("excMenus", excMenus);
		return "admin/restntInfo";
	}

	// 식당 정보 추가 작성 폼
	@RequestMapping(value = "/restntInfoInsertForm.do", method = RequestMethod.POST)
	String restntInfoInsertForm(Model model, RestntDTO restntDto,
			Integer caseCode, SettingDTO settingDto) {
		System.out.println("////////세팅 디티오//////////");

		System.out.println(settingDto);
		System.out.println("////레스토랑 디티오/////");
		restntDto.setRestntId(null);
		restntDto.setRestntCate(null);
		restntDto.setRestntName(null);
		restntDto.setRestntEval(null);
		restntDto.setRestntTel(null);
		restntDto.setAdress4(null);

		adress1 = settingService.getAdress1();
		adress2 = settingService.getAdress2(settingDto);
		adress3 = settingService.getAdress3(settingDto);

		model.addAttribute("adress1", adress1);
		model.addAttribute("adress2", adress2);
		model.addAttribute("adress3", adress3);
		model.addAttribute("restnt", restntDto);
		excMenus = settingService.getExcMenu();

		model.addAttribute("excMenus", excMenus);
		return "admin/restntInfo";
	}

	// 식당 정보 추가
	@RequestMapping(value = "/restntInfoInsert.do", method = RequestMethod.POST)
	String restntInfoInsert(Model model, RestntDTO restntDto,
			SettingDTO settingDto) {
		System.out.println(restntDto);
		adressCode = restntService.getAdressCode(restntDto);
		System.out.println(adressCode);
		lastId = restntService.getLastRestntId(restntDto);
		System.out.println(lastId);

		newId = restntIdGen(lastId, adressCode);
		restntDto.setRestntId(newId);
		System.out.println(restntDto);
		restntService.putRestnt(restntDto);
		restnt = restntService.getRestntInfoById(restntDto.getRestntId());
		adress1 = settingService.getAdress1();
		adress2 = settingService.getAdress2(settingDto);
		adress3 = settingService.getAdress3(settingDto);

		model.addAttribute("adress1", adress1);
		model.addAttribute("adress2", adress2);
		model.addAttribute("adress3", adress3);
		model.addAttribute("restnt", restntDto);
		model.addAttribute("restnt", restnt);
		excMenus = settingService.getExcMenu();

		model.addAttribute("excMenus", excMenus);
		return "admin/restntInfo";

	}

	// 식당 정보 수정
	@RequestMapping(value = "/restntInfoUpdate.do", method = RequestMethod.POST)
	String restntInfoUpdate(Model model, RestntDTO restntDto,
			SettingDTO settingDto) {

		System.out.println(restntDto);
		restntService.setRestntById(restntDto);

		restnt = restntService.getRestntInfoById(restntDto.getRestntId());

		model.addAttribute("restnt", restnt);

		model.addAttribute("test", "수정");

		excMenus = settingService.getExcMenu();
		adress1 = settingService.getAdress1();
		adress2 = settingService.getAdress2(settingDto);
		adress3 = settingService.getAdress3(settingDto);

		model.addAttribute("adress1", adress1);
		model.addAttribute("adress2", adress2);
		model.addAttribute("adress3", adress3);
		model.addAttribute("restnts", restnts);
		model.addAttribute("code", settingDto);
		model.addAttribute("excMenus", excMenus);
		return "admin/restntInfo";
	}

	// 식당 정보 삭제
	@RequestMapping(value = "/restntInfoDelete.do", method = RequestMethod.POST)
	String restntInfoDelete(Model model, String restntId) {
		restntService.dropRestntById(restntId);
		model.addAttribute("test", "삭제");
		Integer caseCode = null;

		return restntManantProc(model, caseCode, settingDto);
	}

	// 메뉴 리스트
	@RequestMapping(value = "/menuListProc.do", method = RequestMethod.POST)
	String menuListProc(Model model, String restntId) {
		menus = menuService.getMenuListByRestntId(restntId);
		model.addAttribute("menus", menus);
		return "admin/menuList";
	}

	// 메뉴 상세 정보표시
	@RequestMapping(value = "/menuManantProc.do", method = RequestMethod.POST)
	String menuManantProc(Model model, String menuId) {
		menu = menuService.getMenuInfoByMenuId(menuId);
		model.addAttribute("menu", menu);
		return "admin/menuManant";
	}

	// 메뉴 추가
	@RequestMapping(value = "/menuInfoInsert.do", method = RequestMethod.POST)
	String menuInfoInsert(Model model, MenuDTO menuDto) {
		menuService.putMenu(menuDto);
		menu = menuService.getMenuInfoByMenuId(menuDto.getMenuId());
		model.addAttribute("menu", menu);
		return "admin/menuManant";
	}

	// 메뉴 수정
	@RequestMapping(value = "/menuInfoUpdate.do", method = RequestMethod.POST)
	String menuInfoUpdate(Model model, MenuDTO menuDto) {
		menuService.setMenuByMenuId(menuDto);
		menu = menuService.getMenuInfoByMenuId(menuDto.getMenuId());
		model.addAttribute("menu", menu);

		return "admin/menuManant";
	}

	// 메뉴 삭제
	@RequestMapping(value = "/menuInfoDelete.do", method = RequestMethod.POST)
	String menuInfoDelete(Model model, String menuId) {
		menuService.dropMenuByMenuId(menuId);
		return "admin/menuManant";
	}

	// 새 식당 등록시 아이디 생성 메소드
	String restntIdGen(String lastId, String adressCode) {
		if (lastId != null) {

			stringBuffer = new StringBuffer(lastId);
			String sequenceStr = stringBuffer.substring(17, 22);
			System.out.println(sequenceStr);
			Integer sequenceNum = Integer.parseInt(sequenceStr) + 1;
			System.out.println(sequenceNum);
			String sequenceFormat = String.format("%05d", sequenceNum);
			System.out.println(sequenceFormat);

			return stringBuffer.replace(17, 22, sequenceFormat).toString();
		} else {
			return adressCode + "," + "R00001";
		}

	}

	@RequestMapping(value = "/ajaxAdress2.do")
	public void ajaxAdress2(HttpServletRequest request,
			HttpServletResponse response, SettingDTO settingDto, String adress1)
			throws IOException {
		// 값 받아오는 부분
		/*
		 * String adress1 = request.getParameter("adress1");
		 */
		System.out.println("/ajaxAdress2.do");
		System.out.println(adress1);
		settingDto.setAdress1(adress1);

		System.out.println(settingDto);

		// 쿼리 실행부분
		adress2 = settingService.getAdress2(settingDto);

		System.out.println(adress2);

		// 쿼리 실행 결과를 JSON 형식으로 변환하는 부분
		JSONObject json = new JSONObject();
		json.put("adress2", adress2);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println(json.toString());
		out.print(json.toString());
	}

	@RequestMapping(value = "/ajaxAdress3.do")
	public void ajaxAdress3(HttpServletRequest request,
			HttpServletResponse response, SettingDTO settingDto)
			throws IOException {
		System.out.println("/ajaxAdress3.do");
		String adress1 = request.getParameter("adress1");
		String adress2 = request.getParameter("adress2");
		System.out.println(adress1);
		System.out.println(adress2);

		settingDto.setAdress1(adress1);
		settingDto.setAdress2(adress2);
		System.out.println(settingDto);
		adress3 = settingService.getAdress3(settingDto);
		System.out.println(adress3);

		JSONObject json = new JSONObject();
		json.put("adress3", adress3);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println(json.toString());
		out.print(json.toString());
	}

	@RequestMapping(value = "/ajaxRestntList.do")
	public void ajaxRestntList(HttpServletRequest request,
			HttpServletResponse response, SettingDTO settingDto)
			throws IOException {
		System.out.println("/ajaxRestntList.do");

		// 패러미터 설정
		String adress1 = request.getParameter("adress1");
		String adress2 = request.getParameter("adress2");
		String adress3 = request.getParameter("adress3");

		// 확인
		System.out.println(adress1);
		System.out.println(adress2);
		System.out.println(adress3);

		settingDto.setAdress1(adress1);
		settingDto.setAdress2(adress2);
		settingDto.setAdress3(adress3);
		System.out.println(settingDto);

		// 쿼리 실행
		restnts = restntService.getRestntListByAddr(settingDto);
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

	@RequestMapping(value = "/ajaxRestntInfo.do")
	public void ajaxRestntInfo(HttpServletRequest request,
			HttpServletResponse response, SettingDTO settingDto)
			throws IOException {
		System.out.println("/ajaxRestntInfo.do");

		String restntId = request.getParameter("restntId");
		System.out.println(restntId);
		restnt = restntService.getRestntInfoById(restntId);
		System.out.println(restnt);

		// 제이슨으로 변환

		JSONObject jsonObject = JSONObject.fromObject(restnt);
		System.out.println("json - " + jsonObject);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toString());
	}

	@RequestMapping(value = "/ajaxMenuList.do")
	public void ajaxMenuList(HttpServletRequest request,
			HttpServletResponse response, SettingDTO settingDto)
			throws IOException {
		System.out.println("/ajaxMenuList.do");

		String restntId = request.getParameter("restntId");
		System.out.println(restntId);
		menus = menuService.getMenuListByRestntId(restntId);
		System.out.println(menus);

		// 제이슨으로 변환

		JSONArray jsonArray = JSONArray.fromObject(menus);

		System.out.println("menus - " + jsonArray);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menus", jsonArray);

		JSONObject jsonObject = JSONObject.fromObject(map);
		System.out.println("json - " + jsonObject);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toString());
	}

	@RequestMapping(value = "/ajaxRestntInfoUpdate.do", method = RequestMethod.POST)
	void ajaxRestntInfoUpdate(HttpServletRequest request,
			HttpServletResponse response, RestntDTO restntDto) throws IOException {
		System.out.println("/ajaxRestntInfoUpdate.do");
		
		System.out.println(restntDto);
		restntService.setRestntById(restntDto);

		restnt = restntService.getRestntInfoById(restntDto.getRestntId());
		System.out.println(restnt);

		// 제이슨으로 변환

		JSONObject jsonObject = JSONObject.fromObject(restnt);
		System.out.println("json - " + jsonObject);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(jsonObject.toString());

	}
	
	@RequestMapping(value = "/ajaxRestntInfoDelete.do", method = RequestMethod.POST)
	void ajaxRestntInfoDelete(HttpServletRequest request,
			HttpServletResponse response, RestntDTO restntDto, SettingDTO settingDto) throws IOException {
		System.out.println("/ajaxRestntInfoDelete.do");
		
		System.out.println(restntDto);
		
		settingDto.setAdress1(restntDto.getAdress1());
		settingDto.setAdress2(restntDto.getAdress2());
		settingDto.setAdress3(restntDto.getAdress3());
		
		System.out.println(settingDto);
		
		System.out.println("쿼리 실행");
		restntService.dropRestntById(restntDto.getRestntId());
		
		System.out.println("주소 정보");
		
		
		System.out.println("쿼리 실행 후 식당 리스트 쿼리");
		restnts = restntService.getRestntListByAddr(settingDto);
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
	@RequestMapping(value = "/ajaxRestntInfoInsert.do", method = RequestMethod.POST)
	void ajaxRestntInfoInsert(HttpServletRequest request,
			HttpServletResponse response, RestntDTO restntDto,SettingDTO settingDto) throws IOException {
		System.out.println("/ajaxRestntInfoInsert.do");
		
		System.out.println(restntDto);
		
		settingDto.setAdress1(restntDto.getAdress1());
		settingDto.setAdress2(restntDto.getAdress2());
		settingDto.setAdress3(restntDto.getAdress3());
		
		System.out.println(settingDto);
	
		
		
		
		
		adressCode = restntService.getAdressCode(restntDto);
		System.out.println(adressCode);
		lastId = restntService.getLastRestntId(restntDto);
		System.out.println(lastId);

		newId = restntIdGen(lastId, adressCode);
		restntDto.setRestntId(newId);
		System.out.println(restntDto);
		
		System.out.println("추가 쿼리 실행");
		restntService.putRestnt(restntDto);
		
		
		
		
		
		
		
		
		System.out.println("추가 쿼리 실행 후 식당 리스트 쿼리");
		restnts = restntService.getRestntListByAddr(settingDto);
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

}
