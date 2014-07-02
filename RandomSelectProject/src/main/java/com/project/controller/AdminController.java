package com.project.controller;

import java.util.List;

import net.wimpi.telnetd.io.terminal.ansi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		return "admin/memberList";

	}

	// 회원 리스트에서 아이디 클릭 -> 회원의 평가 정보 리스트 표시 페이지
	@RequestMapping(value = "/memberEvaluateListProc.do", method = RequestMethod.POST)
	String memberEvaluateListProc(Model model, String memId) {
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
		return "admin/memberList";
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
			model.addAttribute("adress1", adress1);

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
		restnts = restntService.getRestntListByAddressCode(addressCode);
		model.addAttribute("restnts", restnts);
		return "admin/restntListAdmin";

	}

	// 식당 리스트에서 식당 이름 선택 -> 식당 상세 정보 표시
	@RequestMapping(value = "/restntInfoForm.do", method = RequestMethod.POST)
	String restntInfoForm(Model model, String restntId) {
		restnt = restntService.getRestntInfoById(restntId);
		List<SettingDTO> excMenus = settingService.getExcMenu();

		model.addAttribute("restnt", restnt);
		model.addAttribute("excMenus", excMenus);
		return "admin/restntInfo";
	}

	@RequestMapping(value = "/restntInfoInsertForm.do", method = RequestMethod.POST)
	String restntInfoInsertForm(Model model) {

		List<SettingDTO> excMenus = settingService.getExcMenu();

		model.addAttribute("excMenus", excMenus);
		return "admin/restntInfo";
	}

	// 식당 정보 추가
	@RequestMapping(value = "/restntInfoInsert.do", method = RequestMethod.POST)
	String restntInfoInsert(Model model, RestntDTO restntDto) {
		/*
		 * restntService.putRestnt(restntDto); restnt =
		 * restntService.getRestntInfoById(restntDto.getRestntId());
		 * model.addAttribute("restnt", restnt);
		 */
		/* return "admin/restntInfo"; */
		model.addAttribute("test", "추가");
		return "admin/restntSelect";
	}

	// 식당 정보 수정
	@RequestMapping(value = "/restntInfoUpdate.do", method = RequestMethod.POST)
	String restntInfoUpdate(Model model, RestntDTO restntDto) {
		restntService.setRestntById(restntDto);
		restnt = restntService.getRestntInfoById(restntDto.getRestntId());
		model.addAttribute("restnt", restnt);
		model.addAttribute("test", "수정");
		List<SettingDTO> excMenus = settingService.getExcMenu();
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
	String menuListProc(Model model, MenuDTO menuDto) {
		menus = menuService.getMenuListByRestntId(menuDto);
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
}
