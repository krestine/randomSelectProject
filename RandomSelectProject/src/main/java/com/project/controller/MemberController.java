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
import org.springframework.web.servlet.ModelAndView;

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

	/*
	 * 회원가입, 로그인, 아이디/비번 찾기 ajax
	 */

	// 회원가입: 아이디 체크 ajax
	@RequestMapping("idCheck.do")
	public ModelAndView idCheckAjax(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("idCheckAjax");
		ModelAndView view = new ModelAndView("member/memAjax");

		String memId = request.getParameter("memId");
		System.out.println("memid=" + memId);

		String getId = memberService.getMemIdByMemId(memId);
		System.out.println("getid=" + getId);

		if (getId == null) {
			view.addObject("result", "true");
			System.out.println("사용가능한 아이디");
		} else {
			view.addObject("result", "false");
			System.out.println("이미 사용하는 아이디");
		}
		return view;
	}

	// 로그인 : 비밀번호 찾기 ajax
	@RequestMapping("pwCheck.do")
	public ModelAndView pwCheckAjax(HttpServletRequest request,
			HttpServletResponse response, MemberDTO memberDto) {
		System.out.println("pwCheckAjax");

		ModelAndView view = new ModelAndView("member/memAjax");

		String memId = request.getParameter("memId");
		System.out.println("memid=" + memId);

		String memBirth = request.getParameter("memBirth");
		System.out.println("memBirth=" + memBirth);

		String memMobile = request.getParameter("memMobile");
		System.out.println("memMobile=" + memMobile);

		memberDto.setMemId(memId);
		memberDto.setMemBirth(memBirth);
		memberDto.setMemMobile(memMobile);

		System.out.println(memberDto);

		String userId = memberService.getMemIdByMemId(memId);
		System.out.println("userId=" + userId);

		String userPassword = memberService
				.getMemPasswdByMemberTerms(memberDto);
		System.out.println("userPassword=" + userPassword);

		if (userId != null) {
			if (userPassword == null) {
				view.addObject("pwResult", "incorrectInfo");
				System.out.println("회원정보 불일치");
			} else {
				view.addObject("pwResult", "true");
				System.out.println("회원정보 일치");
			}
		} else {
			view.addObject("pwResult", "incorrectId");
			System.out.println("아이디 없음");
		}
		return view;
	}

	// 내정보 : 현재비밀번호 확인 ajax
	@RequestMapping("pwInfoCheck.do")
	public ModelAndView pwInfoCheckAjax(HttpServletRequest request,
			HttpServletResponse response, MemberDTO memberDto,
			HttpSession session) {
		System.out.println("pwInfoCheckAjax");

		ModelAndView view = new ModelAndView("member/memAjax");
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		System.out.println("session.loginUser=" + loginUser);

		String memPasswd = request.getParameter("memPasswd");
		System.out.println("memPasswd=" + memPasswd);

		System.out.println("loginUser.getMemId()=" + loginUser.getMemId());

		memberDto.setMemId(loginUser.getMemId());
		memberDto.setMemPasswd(memPasswd);
		System.out.println(memberDto);

		// 현재비밀번호 확인
		String leave = memberService.getMemPasswdByMemId(memberDto);
		System.out.println("leave=" + leave);

		if (leave != null && Integer.parseInt(leave) == 0) {
			view.addObject("result", "true");
			System.out.println("비밀번호 일치");
		} else {
			view.addObject("result", "false");
			System.out.println("비밀번호 불일치");
		}
		return view;
	}

	/*
	 * form->view & view->proc
	 * //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	 */

	// 회원가입
	@RequestMapping("registerForm.do")
	public String registerForm(Model model) {
		System.out.println("registerForm()");
		return "register";
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
		return "registerOk";

	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	// 로그인
	@RequestMapping("loginForm.do")
	public String loginForm() {
		System.out.println("loginForm()");
		return "login";
	}

	@RequestMapping(value = "loginProc.do", method = RequestMethod.POST)
	public String loginProc(Model model, MemberDTO memberDto,
			HttpServletRequest request, HttpSession session) {
		System.out.println("loginProc()");

		session = request.getSession();
		System.out.println(session);

		System.out.println(memberDto);

		MemberDTO loginUser = memberService
				.getMemberInfoByMemberTerms(memberDto);
		System.out.println("loginUser" + loginUser);

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

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	// 아이디 찾기&비밀번호 찾기 폼
	@RequestMapping("findIdForm.do")
	public String findIdForm() {
		System.out.println("findIdForm()");
		return "findId";
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
		return "findIdOk";
	}

	// 비밀번호찾기, 임시비밀번호 변경
	/*
	 * @RequestMapping("findPasswordForm.do") public String findPasswordForm() {
	 * System.out.println("findPasswordForm()"); return "findPassword"; }
	 */

	@RequestMapping(value = "findPasswordProc.do", method = RequestMethod.POST)
	public String findPasswordProc(Model model, MemberDTO memberDto,
			HttpServletRequest request) {
		System.out.println("findPasswordProc()");
		String userPassword = memberService
				.getMemPasswdByMemberTerms(memberDto);

		if (userPassword == null) {
			model.addAttribute("errmessage", "정보를 다시 확인해주세요");
			return "forward:pwCheck.do";
		}

		String fromUser = "6amugeona@gmail.com";
		String toUser = (String) request.getParameter("memId");
		String subject = "[6randomSelect] 요청하신 인증번호입니다.";
		String CD = Math.round(Math.random() * 999999) / 1 + "";
		String text = getEmailText(CD, toUser);

		mailService.sendMail(fromUser, toUser, subject, text);

		memberDto.setMemId(toUser);
		// memberDto.setMemPasswd(userPassword);
		memberDto.setTempPw(CD);
		memberService.setMemberInfoByMemberTerms(memberDto);

		model.addAttribute("userMail", toUser);
		// model.addAttribute("userPassword", userPassword);
		return "findPasswordOk";
	}

	// 임시비밀번호 메일발송내용
	protected String getEmailText(String CD, String toUser) {
		StringBuilder text = new StringBuilder();
		text.append("<h2>[6randomSelect] 임시 비밀번호입니다.</h2><br>");
		text.append(CD);
		text.append("<br><a href=" + urlPath + "loginForm.do"
				+ ">임시번호로 로그인후 비밀번호를 변경해주세요.</a>");
		return text.toString();
	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	// 내정보
	@RequestMapping(value = "myInfoForm.do", method = RequestMethod.POST)
	public String myInfoForm(Model model, MemberDTO memberDto,
			HttpSession session) {
		System.out.println("myInfoForm()");
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		System.out.println("loginUser=" + loginUser);
		MemberDTO myInfo = memberService.getMyInfoByMemId(loginUser.getMemId());
		System.out.println("myInfo=" + myInfo);
		model.addAttribute("myInfo", myInfo);
		return "myInfo";
	}

	// 비밀번호 변경
	@RequestMapping(value = "passwordProc.do", method = RequestMethod.POST)
	public String passwordProc(Model model, MemberDTO memberDto,
			HttpSession session) {
		System.out.println("passwordProc()");

		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		System.out.println("loginUser.getMemId()=" + loginUser.getMemId());

		String temp = memberDto.getTempPw();
		System.out.println("새비밀번호" + temp);

		memberDto.setMemId(loginUser.getMemId());
		memberDto.setTempPw(temp);
		System.out.println(memberDto);

		if (memberDto != null) {
			memberService.setMemPasswdByMemberTerms(memberDto);
			model.addAttribute("sMsg", "비밀번호가 변경되었습니다. 변경된 번호로 로그인 해주세요.");
			session.removeAttribute("loginUser");
			session.invalidate();
			return "forward:loginForm.do";
		}
		return "forward:myInfoForm.do";
	}

	// 전화번호 변경
	@RequestMapping(value = "mobileProc.do", method = RequestMethod.POST)
	public String mobileProc(Model model, MemberDTO memberDto,
			HttpSession session, HttpServletRequest request) {
		System.out.println("mobileProc()");

		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		System.out.println("loginUser.getMemId()=" + loginUser.getMemId());

		String memMobile = request.getParameter("memMobile");
		System.out.println("새 전화번호" + memMobile);

		memberDto.setMemId(loginUser.getMemId());
		memberDto.setMemMobile(memMobile);
		System.out.println(memberDto);

		memberService.setMemberInfoByMemberTerms(memberDto);

		return "forward:myInfoForm.do";
	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	// 탈퇴
	@RequestMapping("dropForm.do")
	public String dropForm() {
		System.out.println("dropForm()");
		return "drop";
	}

	@RequestMapping(value = "dropProc.do", method = RequestMethod.POST)
	public String dropProc(Model model, MemberDTO memberDto, HttpSession session) {
		System.out.println("dropProc()");
		memberService.setLeave(memberDto);
		session.removeAttribute("loginUser");
		session.invalidate();
		return "dropOk";
	}

	// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

	// 로그아웃
	@RequestMapping("logoutForm.do")
	public String logOutForm(HttpSession session) {
		System.out.println("logOutForm()");

		session.removeAttribute("loginUser");
		session.invalidate();

		return "forward:main.do";
	}

}
