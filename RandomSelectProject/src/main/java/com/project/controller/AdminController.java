package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.EvaluateDTO;
import com.project.domain.MemberDTO;
import com.project.domain.MenuDTO;
import com.project.domain.RestntDTO;
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

	// 관리자 메인 페이지
	@RequestMapping(value = "/adminMainProc.do")
	String adminMainProc(Model model) {
		
		return "admin/adminMain";
	}

	// 회원 검색 페이지
	@RequestMapping(value = "/memberSearchForm.do")
	String memberSearchForm(Model model) {
		return "admin/memberSearch";
	}
	@RequestMapping(value = "/memberSearchProc.do", method = RequestMethod.POST)
	String memberSearchProc(String caseCode,String param){
		return "admin/memberList";
		
	}
	
	
	
	
	
	
	// Id로 회원검색
	@RequestMapping(value = "/memberSearchByIdProc.do", method = RequestMethod.POST)
	String memberSearchByIdProc(Model model, String memId) {
		List<MemberDTO> members = memberService.getMemberListById(memId);
		model.addAttribute("members", members);
		return "admin/memberList";
	}

	// 이름으로 회원검색
	@RequestMapping(value = "/memberSearchByNameProc.do", method = RequestMethod.POST)
	String memberSearchByNameProc(Model model, String memName) {
		System.out.println(memName);
		List<MemberDTO> members = memberService.getMemberListByName(memName);
		model.addAttribute("members", members);
		return "admin/memberList";
	}

	// 등급으로 회원 검색
	@RequestMapping(value = "/memberSearchByGradeProc.do", method = RequestMethod.POST)
	String memberSearchByGradeProc(Model model, String memGrade) {
		System.out.println(memGrade);
		List<MemberDTO> members = memberService.getMemberListByGrade(memGrade);
		model.addAttribute("members", members);
		return "admin/memberList";
	}

	// 블랙 으로 회원 검색
	@RequestMapping(value = "/memberSearchByBlackProc.do", method = RequestMethod.POST)
	String memberSearchByBlackProc(Model model, String black) {
		System.out.println(black);
		List<MemberDTO> members = memberService.getMemberListByBlack(black);
		model.addAttribute("members", members);
		return "admin/memberList";
	}

	// 회원 리스트에서 아이디 클릭 -> 회원의 평가 정보 리스트 표시 페이지
	@RequestMapping(value = "/memberEvaluateListProc.do", method = RequestMethod.POST)
	String memberEvaluateListProc(Model model, String memId) {
		List<EvaluateDTO> memberEvaluates =  evaluateService
				.getEvaluateListByMemId(memId);
		model.addAttribute("memberEvaluates", memberEvaluates);
		return "admin/memberEvaluateListAdmin";
	}
	
	// 회원 리스트에서 등급, 블랙 수정내용 입력후 수정 버튼 클릭	
	@RequestMapping(value = "/setMemberInfoProc.do", method = RequestMethod.POST)
	String setMemberInfo(MemberDTO memberDto, Model model){
		System.out.println("수정 버튼 클릭");
		if(memberDto.getBlack()==null){
			memberDto.setBlack("0");
		}
		System.out.println(memberDto);
		String memId = memberDto.getMemId();
		memberService.setMemberInfo(memberDto);
		List<MemberDTO> members = memberService.getMemberListById(memId);
		model.addAttribute("members", members);
		return "admin/memberList";
	} 
	

	// 식당 관리 페이지
	@RequestMapping(value = "/restntManantProc.do")
	String restntManantProc(Model model) {
		return "admin/restntManant";
	}

	// 식당 선택 페이지 주소 필터 : 패러미터, 셀렉트 박스와 관련된 query 문 추가 해야함
	@RequestMapping(value = "/restntSelectForm.do")
	String restntSelectForm(Model model) {
		return "admin/restntSelect";
	}

	// 주소 필터 적용-> 검색 결과 : 식당 리스트
	@RequestMapping(value = "/restntSelectProc.do", method = RequestMethod.POST)
	String restntSelectProc(Model model, String addressCode) {
		List<RestntDTO> restnts = restntService
				.getRestntListByAddressCode(addressCode);
		model.addAttribute("restnts", restnts);
		return "admin/restntListAdmin";

	}

	// 식당 리스트에서 식당 이름 선택 -> 식당 상세 정보 표시
	@RequestMapping(value = "/restntInfoForm.do", method = RequestMethod.POST)
	String restntInfoForm(Model model, String restntId) {
		RestntDTO restnt = restntService.getRestntInfoById(restntId);
		model.addAttribute("restnt", restnt);
		return "admin/restntInfo";
	}

	// 식당 정보 추가
	@RequestMapping(value = "/restntInfoInsert.do", method = RequestMethod.POST)
	String restntInfoInsert(Model model, RestntDTO restntDto) {
		restntService.putRestnt(restntDto);
		RestntDTO restnt = restntService.getRestntInfoById(restntDto
				.getRestntId());
		model.addAttribute("restnt", restnt);
		return "admin/restntInfo";
	}

	// 식당 정보 수정
	@RequestMapping(value = "/restntInfoUpdate.do", method = RequestMethod.POST)
	String restntInfoUpdate(Model model, RestntDTO restntDto) {
		restntService.setRestntById(restntDto);
		RestntDTO restnt = restntService.getRestntInfoById(restntDto
				.getRestntId());
		model.addAttribute("restnt", restnt);
		return "admin/restntInfo";
	}

	// 식당 정보 삭제
	@RequestMapping(value = "/restntInfoDelete.do", method = RequestMethod.POST)
	String restntInfoDelete(Model model, String restntId) {
		restntService.dropRestntById(restntId);
		return "admin/restntInfo";
	}

	// 메뉴 리스트
	@RequestMapping(value = "/menuListProc.do", method = RequestMethod.POST)
	String menuListProc(Model model, MenuDTO menuDto) {
		List<MenuDTO> menus = menuService.getMenuListByRestntId(menuDto);
		model.addAttribute("menus", menus);
		return "admin/menuList";
	}

	// 메뉴 상세 정보표시
	@RequestMapping(value = "/menuManantProc.do", method = RequestMethod.POST)
	String menuManantProc(Model model,String menuId) {
		MenuDTO menu = menuService.getMenuInfoByMenuId(menuId);
		model.addAttribute("menu",  menu);
		return "admin/menuManant";
	}

	// 메뉴 추가
	@RequestMapping(value = "/menuInfoInsert.do", method = RequestMethod.POST)
	String menuInfoInsert(Model model,MenuDTO menuDto) {
		menuService.putMenu(menuDto);
		MenuDTO menu = menuService.getMenuInfoByMenuId(menuDto.getMenuId());
		model.addAttribute("menu",  menu);
		return "admin/menuManant";
	}

	// 메뉴 수정
	@RequestMapping(value = "/menuInfoUpdate.do", method = RequestMethod.POST)
	String menuInfoUpdate(Model model,MenuDTO menuDto) {
		menuService.setMenuByMenuId(menuDto);
		MenuDTO menu = menuService.getMenuInfoByMenuId(menuDto.getMenuId());
		model.addAttribute("menu",  menu);
		return "admin/menuManant";
	}

	// 메뉴 삭제
	@RequestMapping(value = "/menuInfoDelete.do", method = RequestMethod.POST)
	String menuInfoDelete(Model model,String menuId){
		menuService.dropMenuByMenuId(menuId);
		return "admin/menuManant";
	}
}
