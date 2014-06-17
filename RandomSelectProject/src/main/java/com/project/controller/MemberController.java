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
	@RequestMapping("/registerForm.do")
	public String registerForm(Model model) {
		System.out.println("registerForm()");
		return "member/register";
	}

	@RequestMapping(value = "/registerProc.do", method = RequestMethod.POST)
	public String registerProc(Model model, MemberDTO memberDTO) {
		System.out.println("registerProc()");
		
		return "member/registerOk";
	}

	// 로그인
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		System.out.println("loginForm()");
		return "member/login";
	}

	@RequestMapping(value = "/loginProc.do", method = RequestMethod.POST)
	public String loginProc() {
		System.out.println("loginProc()");

		return "member/loginOk";
	}

	// 아이디찾기
	@RequestMapping("/findIdForm.do")
	public String findIdForm() {
		System.out.println("findIdForm()");

		return "member/findId";
	}

	@RequestMapping(value = "/findIdProc.do", method = RequestMethod.POST)
	public String findIdProc() {
		System.out.println("findIdProc()");

		return "member/findIdOk";
	}

	// 비밀번호찾기
	@RequestMapping("/findPasswordForm.do")
	public String findPasswordForm() {
		System.out.println("findPasswordForm()");
		return "member/findPassword";
	}

	@RequestMapping(value = "/findPasswordProc.do", method = RequestMethod.POST)
	public String findPasswordProc() {
		System.out.println("findPasswordProc()");

		return "member/findPasswordOk";
	}

	// 내정보
	@RequestMapping("/myInfoForm.do")
	public String myInfoForm() {
		System.out.println("myInfoForm()");

		return "mypage/myInfo";
	}

	// 현재 비밀번호 확인 , 정보수정
	@RequestMapping(value = "/myInfoProc.do", method = RequestMethod.POST)
	public String myInfoProc() {
		System.out.println("myInfoProc()");

		return "mypage/myInfoOk";
	}

	// 탈퇴
	@RequestMapping("/dropForm.do")
	public String dropForm() {
		System.out.println("dropForm()");
		return "mypage/drop";
	}

	@RequestMapping(value = "/dropProc.do", method = RequestMethod.POST)
	public String dropProc() {
		System.out.println("dropProc()");

		return "mypage/dropOk";
	}

}
