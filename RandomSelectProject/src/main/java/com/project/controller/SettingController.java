package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;





import com.project.domain.MemberDTO;
import com.project.domain.SettingDTO;
import com.project.service.MemberService;
import com.project.service.SettingService;

public class SettingController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SettingService settingService;
	
	@RequestMapping(value = "/settingForm.do")
	String settingForm(Model model){
		List<SettingDTO> walkRanges = settingService.getWalkRange();
		List<SettingDTO> carRanges = settingService.getCarRange();
		List<SettingDTO> excMenus = settingService.getExcMenu();
		model.addAttribute("walkRanges", walkRanges);
		model.addAttribute("carRanges", carRanges);
		model.addAttribute("excMenus", excMenus);
		
		return "setting/setting";
	}
	
	@RequestMapping(value = "/settingProc.do", method = RequestMethod.POST)
	String settingProc(Model model, MemberDTO memberDto){
		memberService.setOptionInfoByMemId(memberDto);
		return "setting/setting";
	}
	

}
