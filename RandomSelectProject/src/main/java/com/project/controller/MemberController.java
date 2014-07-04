package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.dao.MemberMapper;
import com.project.domain.MemberDTO;
import com.project.service.MailService;
import com.project.service.MemberService;

@Controller
public class MemberController {

	@Value("#{mail['mail.urlPath']}")
	private String urlPath;

	@Autowired
	private MailService mailService;

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MemberService memberService;

	// 아이디체크 ajax
	@RequestMapping("idCheck.do")
	public ModelAndView idCheckAjax(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("idCheckAjax");
		ModelAndView view = new ModelAndView("member/memIdAjax");

		String memId = request.getParameter("memId");
		System.out.println("memid=" + memId);

		MemberDTO getId = memberService.getMemIdByMemId(memId);
		System.out.println("getid=" + getId);

		if (getId == null) {
			view.addObject("result", "true");
		} else {
			view.addObject("result", "false");
		}
		return view;
	}

	// 회원가입
	@RequestMapping("registerForm.do")
	public String registerForm(Model model) {
		System.out.println("registerForm()");
		return "member/register";
	}

	@RequestMapping(value = "registerProc.do", method = RequestMethod.POST)
	public String registerProc(Model model, MemberDTO memberDto) {

		/*
		 * MemberDTO userId = memberService.getMyInfoByMemId(memberDto); if
		 * (userId != null) { model.addAttribute("errmessage",
		 * "이미 사용하고 있는 아이디입니다."); return "forward:registerForm.do"; }
		 */
		memberDto.setMemMobile(memberDto.getmPhoneCode() + "-"
				+ memberDto.getmPhoneMid() + "-" + memberDto.getmPhoneEnd());
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
	public String loginProc(Model model, MemberDTO memberDto,
			HttpServletRequest request, HttpSession session) {
		System.out.println("loginProc()");

		session = request.getSession();

		MemberDTO loginUser = memberService
				.getMemberInfoByMemberTerms(memberDto);

		if (loginUser != null) {
			if (!session.isNew()) {
				session = request.getSession(true);
			}
			session.setAttribute("loginUser", loginUser);
			// model.addAttribute("loginUser", loginUser);

			return "forward:main.do";
		} else {
			request.setAttribute("errmessage", "아이디와 비밀번호를 확인해주세요");
			return "forward:loginForm.do";
		}

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

		if (userId == null) {
			model.addAttribute("errmessage", "정보를 다시 확인해주세요");
			return "forward:findIdForm.do";
		}
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
	public String findPasswordProc(Model model, MemberDTO memberDto,
			HttpServletRequest request) {
		System.out.println("findPasswordProc()");
		String userPassword = memberService
				.getMemPasswdByMemberTerms(memberDto);
		if (userPassword == null) {
			model.addAttribute("errmessage", "정보를 다시 확인해주세요");
			return "forward:findPasswordForm.do";
		}

		String fromUser = "6amugeona@gmail.com";
		String toUser = (String) request.getParameter("memId");
		String subject = "[6randomSelect] 요청하신 인증번호입니다.";
		String CD = Math.round(Math.random() * 999999) / 1 + "";
		String text = getEmailText(CD, toUser);

		mailService.sendMail(fromUser, toUser, subject, text);

		model.addAttribute("userMail", toUser);
		model.addAttribute("userPassword", userPassword);
		return "member/findPasswordOk";
	}

	protected String getEmailText(String CD, String toUser) {
		StringBuilder text = new StringBuilder();
		text.append("<h2>[6randomSelect] 인증번호입니다.</h2><br>");
		text.append(CD);
		text.append("<br><a href=" + urlPath + "loginForm.do" + ">로그인</a>");
		return text.toString();
	}

	// 내정보
	@RequestMapping(value = "myInfoForm.do", method = RequestMethod.POST)
	public String myInfoForm(Model model, MemberDTO memberDto) {
		System.out.println("myInfoForm()");
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
		return "forward:myInfoForm.do";
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
	public String logOutForm(HttpSession session) {
		System.out.println("logOutForm()");

		session.removeAttribute("loginUser");
		session.invalidate();

		return "forward:main.do";
	}

}
