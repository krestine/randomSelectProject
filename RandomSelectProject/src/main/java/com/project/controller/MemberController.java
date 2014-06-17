package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 회원가입
	@RequestMapping("/registerForm.do")
	public String registerForm() {
		System.out.println("registerForm()");
		return "member/register";
	}

	public String registerProc() {
		System.out.println("registerProc()");
		return "member/registerOk";
	}

	// 로그인
	public String loginForm() {
		System.out.println("loginForm()");
		return "member/login";
	}

	public String loginProc() {
		System.out.println("loginProc()");
		return "member/loginOk";
	}

	// 아이디찾기
	public String findIdForm() {
		System.out.println("findIdForm()");
		return "member/findId";
	}

	public String findIdProc() {
		System.out.println("findIdProc()");
		return "member/findIdOk";
	}

	// 비밀번호찾기
	public String findPasswordForm() {
		System.out.println("findPasswordForm()");
		return "member/findPassword";
	}

	public String findPasswordProc() {
		System.out.println("findPasswordProc()");
		return "member/findPasswordOk";
	}

	// 내정보
	public String myInfoForm() {
		System.out.println("myInfoForm()");
		return "mypage/myInfo";
	}
	
	
	//현재 비밀번호 확인 , 정보수정
	public String myInfoProc() {
		System.out.println("myInfoProc()");
		return "mypage/myInfoOk";
	}


	// 탈퇴
	public String droprForm() {
		System.out.println("dropForm()");
		return "mypage/drop";
	}

	public String dropProc() {
		System.out.println("dropProc()");
		return "mypage/dropOk";
	}

}
