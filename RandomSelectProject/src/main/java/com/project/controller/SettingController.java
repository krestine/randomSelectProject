package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	private RandomSelectController main;

	@RequestMapping(value = "/settingForm.do", method = RequestMethod.POST)
	String settingForm(Model model, HttpServletRequest request) {
		System.out.println("/settingForm.do");
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		System.out.println(loginUser);
		try {
			if (loginUser.getMemId() != null || loginUser != null) {
				try {

					MemberDTO userInfo = memberService
							.getOptionInfoByMemId(loginUser.getMemId());
					System.out.println("userInfo::" + userInfo);
					String[] userSettings = menuCodeDecoder(userInfo
							.getMemExcMenu());
					/*
					 * System.out.println("디코더 테스트"); for (String str :
					 * userSettings) { System.out.println(str); }
					 */
					model.addAttribute("userInfo", userInfo);
					model.addAttribute("userSettings", userSettings);
					List<SettingDTO> walkRanges = settingService.getWalkRange();
					List<SettingDTO> carRanges = settingService.getCarRange();
					List<SettingDTO> excMenus = settingService.getExcMenu();

					model.addAttribute("walkRanges", walkRanges);
					model.addAttribute("carRanges", carRanges);
					model.addAttribute("excMenus", excMenus);

					return "setting";
				} catch (Exception e) {
					model.addAttribute("errorMessage",
							"데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요.");
					return "error";
				}
			}
		} catch (Exception e) {
			// model.addAttribute("errorMessage", "로그인 해주세요!");
			model.addAttribute("sMsg", " 로그인 해주세요.");
		}
		// return "error";
		return "forward:loginForm.do";
	}

	@RequestMapping(value = "/settingProc.do", method = RequestMethod.POST)
	String settingProc(Model model, MemberDTO memberDto,
			HttpServletRequest request, HttpSession session) {
		// 세션에서 로그인 정보 가져옴
		System.out.println("/settingProc.do");
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");

		String[] menus = request.getParameterValues("menus");
		if (loginUser != null) {
			if (menus != null) {
				for (String str : menus) {
					System.out.println(str);
				}
				System.out.println();
				String memExcMenu = menuCodeEncoder(menus);

				System.out.println("인코딩 결과" + memExcMenu);
				memberDto.setMemExcMenu(memExcMenu);
				menuCode = "00000000000000";

			} else {
				memberDto.setMemExcMenu("00000000000000");

			}

			// 로그인 정보의 아이디를 패러미터로 세팅
			System.out.println(loginUser.getMemId());
			memberDto.setMemId(loginUser.getMemId());
			// 생성된 제외메뉴 코드를 패러미터로 세팅

			// 설정 페이지에서 입력한 값을 숫자로 변환하여 패러미터로 세팅
			memWalkRange = Integer.parseInt(request.getParameter("walkRange"));
			memberDto.setMemWalkRange(memWalkRange);

			// 설정 페이지에서 입력한 값을 숫자로 변환하여 패러미터로 세팅
			memCarRange = 0;
			memberDto.setMemCarRange(memCarRange);
			// 설정 정보 저장 쿼리 실행

			System.out.println(memberDto);
			memberService.setOptionInfoByMemId(memberDto);

			loginUser.setMemExcMenu(memberDto.getMemExcMenu());
			loginUser.setMemWalkRange(memberDto.getMemWalkRange());
			session.setAttribute("loginUser", loginUser);
			model.addAttribute("settingProcCode", "1");
			return settingForm(model, request);

			/*
			 * try{
			 * 
			 * 
			 * 
			 * } catch(Exception e){ model.addAttribute("errorMessage",
			 * "데이터 베이스 오류가 발생했습니다<br> 잠시 후에 다시 시도 해주세요."); }
			 */
		} else {
//			model.addAttribute("errorMessage", "로그인 해주세요!!");
			model.addAttribute("sMsg", " 로그인 해주세요.");
		}

//		return "error";
		return "forward:loginForm.do";
	}

	public String menuCodeEncoder(String[] menus) {
		if (menus != null) {
			for (String str : menus) {
				int index = Integer.parseInt(str);
				stringBuffer = new StringBuffer(menuCode);
				stringBuffer.setCharAt(index, '1');
				menuCode = stringBuffer.toString();

			}

		}

		return menuCode;
	}

	public String[] menuCodeDecoder(String menuCode) {
		stringBuffer = new StringBuffer(menuCode);
		String[] menuArray = new String[14];
		for (Integer i = 0; i < 14; i++) {
			Character indexCode = stringBuffer.charAt(i);

			String excMenuId = i.toString();
			menuArray[i] = (indexCode == '1') ? settingService
					.getExcMenuById(excMenuId) : "선택안함";

		}

		return menuArray;
	}

}
