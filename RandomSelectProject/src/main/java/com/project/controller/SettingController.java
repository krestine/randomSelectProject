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

	@RequestMapping(value = "/settingForm.do", method = RequestMethod.POST)
	String settingForm(Model model,HttpServletRequest request) {
		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute("member");
		if(loginUser!=null){
		List<SettingDTO> walkRanges = settingService.getWalkRange();
		List<SettingDTO> carRanges = settingService.getCarRange();
		List<SettingDTO> excMenus = settingService.getExcMenu();
		model.addAttribute("walkRanges", walkRanges);
		model.addAttribute("carRanges", carRanges);
		model.addAttribute("excMenus", excMenus);

		return "setting/setting";
		}
		model.addAttribute("errorMessage", "로그인 해라");
		return "setting/error";
		
	}

	@RequestMapping(value = "/settingProc.do", method = RequestMethod.POST)
	String settingProc(Model model, MemberDTO memberDto,
			HttpServletRequest request) {
		System.out.println("settingProc.do 실행");
		System.out.println(menuCode);
		String[] menus = request.getParameterValues("menus");
		for (String str : menus) {
			System.out.println(str);
			menuCodeEncoder(str);
		}
		/* memberService.setOptionInfoByMemId(memberDto); */
		return "randomSelect/main";
	}

	public String menuCodeEncoder(String str) {
		int index = Integer.parseInt(str);
		stringBuffer = new StringBuffer(menuCode);
		stringBuffer.setCharAt(index, '1');
		menuCode = stringBuffer.toString();
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
