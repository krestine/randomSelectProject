package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.crsh.shell.impl.command.system.repl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.MemberDTO;
import com.project.domain.SettingDTO;
import com.project.service.MemberService;
import com.project.service.SettingService;

@Controller
public class SettingController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private SettingService settingService;

	private String menuCode = "00000000000000";
	private StringBuffer stringBuffer;
	private int memWalkRange;
	private int memCarRange;
	private String memExcMenu;

	@RequestMapping(value = "/settingForm.do", method = RequestMethod.POST)
	String settingForm(Model model, HttpServletRequest request) {
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		try {
			if (loginUser.getMemId() != null || loginUser != null) {
				try {

					String userInfo = memberService
							.getOptionInfoByMemId(loginUser.getMemId());
					System.out.println(userInfo);
					String[] userSettings = menuCodeDecoder(userInfo);
					/*
					 * System.out.println("디코더 테스트"); for (String str :
					 * userSettings) { System.out.println(str); }
					 */
					model.addAttribute("userSettings", userSettings);
					List<SettingDTO> walkRanges = settingService.getWalkRange();
					List<SettingDTO> carRanges = settingService.getCarRange();
					List<SettingDTO> excMenus = settingService.getExcMenu();
					model.addAttribute("walkRanges", walkRanges);
					model.addAttribute("carRanges", carRanges);
					model.addAttribute("excMenus", excMenus);

					return "setting/setting";
				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");
					return "setting/error";
				}

			}
		} catch (Exception e) {
			model.addAttribute("errorMessage", "로그인 해주세요!");

		}
		return "setting/error";
	}

	@RequestMapping(value = "/settingProc.do", method = RequestMethod.POST)
	String settingProc(Model model, MemberDTO memberDto,
			HttpServletRequest request) {
		// 세션에서 로그인 정보 가져옴
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");

		String[] menus = request.getParameterValues("menus");
		memExcMenu = menuCodeEncoder(menus);

		// 로그인 정보의 아이디를 패러미터로 세팅
		memberDto.setMemId(loginUser.getMemId());
		// 생성된 제외메뉴 코드를 패러미터로 세팅
		memberDto.setMemExcMenu(memExcMenu);

		// 설정 페이지에서 입력한 값을 숫자로 변환하여 패러미터로 세팅
		memWalkRange = Integer.parseInt(request.getParameter("walkRange"));
		memberDto.setMemWalkRange(memWalkRange);

		// 설정 페이지에서 입력한 값을 숫자로 변환하여 패러미터로 세팅
		memCarRange = Integer.parseInt(request.getParameter("carRange"));
		memberDto.setMemCarRange(memCarRange);
		// 설정 정보 저장 쿼리 실행
		try {
			memberService.setOptionInfoByMemId(memberDto);
			return settingForm(model, request);
		} catch (Exception e) {
			model.addAttribute("errorMessage",
					"데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");
		}
		return "setting/error";

	}

	public String menuCodeEncoder(String[] menus) {
		if (menus != null) {
			for (String str : menus) {
				int index = Integer.parseInt(str);
				stringBuffer = new StringBuffer(menuCode);
				stringBuffer.setCharAt(index, '1');
				menuCode = stringBuffer.toString();
				System.out.println(menuCode);
			}

		}
		System.out.println("메뉴코드 테스트");
		System.out.println(menuCode);
		return menuCode;
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
