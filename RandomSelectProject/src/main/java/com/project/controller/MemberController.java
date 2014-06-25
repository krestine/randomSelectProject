package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.domain.MemberDTO;
import com.project.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 회원가입
	@RequestMapping("registerForm.do")
	public String registerForm(Model model) {
		System.out.println("registerForm()");
		return "member/register";
	}

	@RequestMapping(value = "registerProc.do", method = RequestMethod.POST)
	public String registerProc(Model model, MemberDTO memberDto) {
		System.out.println("registerProc()");
		memberService.putMember(memberDto);
		return "member/registerOk";
	}

	// 로그인
	@RequestMapping("loginForm.do")
	public String loginForm() {
		System.out.println("loginForm()");
		return "member/login";
	}

	@RequestMapping(value = "loginProc.do", method = RequestMethod.POST)
	public String loginProc(Model model, MemberDTO memberDto) {
		System.out.println("loginProc()");
		MemberDTO loginUser = memberService
				.getMemberInfoByMemberTerms(memberDto);
		model.addAttribute("loginUser", loginUser);
		return "member/loginOk";
	}

	// 아이디찾기
	@RequestMapping("findIdForm.do")
	public String findIdForm() {
		System.out.println("findIdForm()");
		return "member/findId";
	}

	@RequestMapping(value = "findIdProc.do", method = RequestMethod.POST)
	public String findIdProc(Model model, MemberDTO memberDto) {
		System.out.println("findIdProc()");
		String userId = memberService.getMemIdByMemberTerms(memberDto);
		model.addAttribute("userId", userId);
		return "member/findIdOk";
	}

	// 비밀번호찾기
	@RequestMapping("findPasswordForm.do")
	public String findPasswordForm() {
		System.out.println("findPasswordForm()");
		return "member/findPassword";
	}

	@RequestMapping(value = "findPasswordProc.do", method = RequestMethod.POST)
	public String findPasswordProc(Model model, MemberDTO memberDto) {
		System.out.println("findPasswordProc()");
		String userPassword = memberService
				.getMemPasswdByMemberTerms(memberDto);
		model.addAttribute("userPassword", userPassword);
		return "member/findPasswordOk";
	}

	// 내정보
	@RequestMapping("myInfoForm.do")
	public String myInfoForm(Model model, MemberDTO memberDto) {
		System.out.println("myInfoForm()");
		MemberDTO userInfo = memberService.getMyInfoByMemId(memberDto);
		model.addAttribute("userInfo", userInfo);
		return "mypage/myInfo";
	}

	// 현재 비밀번호 확인 , 정보수정
	@RequestMapping(value = "myInfoProc.do", method = RequestMethod.POST)
	public String myInfoProc(Model model, MemberDTO memberDto) {
		System.out.println("myInfoProc()");

		// 현재비밀번호 확인
		String nowPasswd = memberService.getMemPasswdByMemId(memberDto);
		if (nowPasswd == null) {
			model.addAttribute("errmessage", "아이디,비밀번호 불일치");
			return "mypage/myInfo";
		} else if (Integer.parseInt(nowPasswd) == 1) {
			model.addAttribute("errmessage", "탈퇴한 회원");
			return "mypage/myInfo";
		}

		// 탈퇴하지 않았고 현재비밀번호 일치할때 비밀번호만 변경
		if (memberDto.getMemMobile() == null) {
			memberService.setMemPasswdByMemberTerms(memberDto);
		}
		memberService.setMemberInfoByMemberTerms(memberDto);
		return "/myInfoForm.do";
	}

	// 탈퇴
	@RequestMapping("dropForm.do")
	public String dropForm() {
		System.out.println("dropForm()");
		return "mypage/drop";
	}

	@RequestMapping(value = "dropProc.do", method = RequestMethod.POST)
	public String dropProc(Model model, MemberDTO memberDto) {
		System.out.println("dropProc()");
		memberService.setLeave(memberDto);
		return "mypage/dropOk";
	}

	// 로그아웃
	@RequestMapping("logoutForm.do")
	public String logOutForm() {
		System.out.println("logOutForm()");

		return "member/logout";
	}

}
