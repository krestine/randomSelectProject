package com.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DuplicateKeyException;
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

	private SeedX x = new SeedX();

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

	// 회원가입: 이메일 인증 ajax
	@RequestMapping(value = "emailCertifyProc.do", method = RequestMethod.POST)
	public ModelAndView emailCertifyProc(Model model, MemberDTO memberDto,
			HttpServletRequest request) {
		System.out.println("emailCertifyProc()");
		ModelAndView view = new ModelAndView("member/memAjax");

		String fromUser = "6amugeona@gmail.com";
		String toUser = (String) request.getParameter("memId");
		String subject = "[6randomSelect] 가입 이메일 인증번호입니다.";
		// 랜덤으로 인증번호 생성
		String randomCD = Math.round(Math.random() * 99999999) / 1 + "";

		String text = emailCertifyText(randomCD, toUser);

		mailService.sendMail(fromUser, toUser, subject, text);

		System.out.println(toUser);
		if (toUser != null) {
			view.addObject("resultCD", "true");
			System.out.println("인증메일발송");
		} else {
			view.addObject("resultCD", "false");
			System.out.println("메일발송실패");
		}
		System.out.println("randomCD=" + randomCD);
		view.addObject("cfCD", randomCD);

		return view;
	}

	// 인증번호 메일발송내용
	protected String emailCertifyText(String randomCD, String toUser) {
		StringBuilder text = new StringBuilder();
		text.append("<h2>[6randomSelect] 인증번호입니다.</h2><br>");
		text.append(randomCD);
		text.append("<br>인증번호를 입력해주세요.</a>");
		return text.toString();
	}

	// 로그인 : 아이디 찾기 ajax
	@RequestMapping(value = "findIdProc.do", method = RequestMethod.POST)
	public ModelAndView findIdProc(HttpServletRequest request,
			HttpServletResponse response, MemberDTO memberDto, Model model) {
		System.out.println("findIdProc()");

		ModelAndView view = new ModelAndView("member/memAjax");

		String memName = request.getParameter("memName");
		System.out.println("memName=" + memName);

		String memBirth = request.getParameter("memBirth");
		System.out.println("memBirth=" + memBirth);

		String memMobile = request.getParameter("memMobile");
		System.out.println("memMobile=" + memMobile);

		memberDto.setMemName(memName);
		memberDto.setMemBirth(memBirth);
		memberDto.setMemMobile(memMobile);

		System.out.println(memberDto);

		String userId = memberService.getMemIdByMemberTerms(memberDto);

		if (userId == null) {
			view.addObject("idResult", "false");
			System.out.println("정보 불일치");
		} else {
			view.addObject("idResult", "true");
			System.out.println("회원정보 일치");
		}
		System.out.println(userId);
		view.addObject("result", userId);
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

				// ///////////////////////////////////////////////////////////////////////
				String fromUser = "6amugeona@gmail.com";
				String toUser = (String) request.getParameter("memId");
				String subject = "[6randomSelect] 요청하신 인증번호입니다.";
				// 랜덤으로 인증번호 생성
				String randomCD = Math.round(Math.random() * 99999999) / 1 + "";
				System.out.println("randomCD=" + randomCD);
				// 인증번호 암호화
				SeedX x = new SeedX();
				int[] roundKey = x.getSeedRoundKey();
				System.out.println("roundKey=" + roundKey);
				byte[] plainCD = x.stringToPlain(randomCD);
				System.out.println("plainCD=" + plainCD);
				byte[] encruptCD = x.getSeedEncrypt(plainCD, roundKey);
				System.out.println("encruptCD=" + encruptCD);
				String finCD = x.cipherToString(encruptCD);
				System.out.println(" finCD=" + finCD);

				String text = getEmailText(randomCD, toUser);

				mailService.sendMail(fromUser, toUser, subject, text);

				memberDto.setMemId(toUser);
				// 암호화된 CD를 비밀번호로 저장
				memberDto.setTempPw(finCD);
				memberService.setMemPasswdByMemberTerms(memberDto);

			}
		} else {
			view.addObject("pwResult", "incorrectId");
			System.out.println("아이디 없음");
		}

		System.out.println(userId);
		view.addObject("resultCD", userId);
		return view;
	}

	// 임시비밀번호 메일발송내용
	protected String getEmailText(String randomCD, String toUser) {
		StringBuilder text = new StringBuilder();
		text.append("<h2>[6randomSelect] 임시 비밀번호입니다.</h2><br>");
		text.append(randomCD);
		text.append("<br><a href=" + urlPath + "loginForm.do"
				+ ">임시번호로 로그인후 비밀번호를 변경해주세요.</a>");
		return text.toString();
	}

	// //////////////////////////////////////////////////////////

	// 내정보 : 현재비밀번호 확인 ajax
	@RequestMapping("pwInfoCheck.do")
	public ModelAndView pwInfoCheckAjax(HttpServletRequest request,
			HttpServletResponse response, MemberDTO memberDto,
			HttpSession session) {
		System.out.println("pwInfoCheckAjax");

		ModelAndView view = new ModelAndView("member/memAjax");
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		System.out.println("session.loginUser=" + loginUser);

		System.out.println("loginUser.getMemId()=" + loginUser.getMemId());

		String inputPW = request.getParameter("memPasswd");
		System.out.println("입력한 비밀번호=" + inputPW);
		// 입력한 비밀번호 암호화 비교
		SeedX x = new SeedX();
		int[] roundKey = x.getSeedRoundKey();
		System.out.println("roundKey=" + roundKey);
		byte[] plainCD = x.stringToPlain(inputPW);
		System.out.println("plainCD=" + plainCD);
		byte[] encruptCD = x.getSeedEncrypt(plainCD, roundKey);
		System.out.println("encruptCD=" + encruptCD);
		String finCD = x.cipherToString(encruptCD);
		System.out.println(" finCD=" + finCD);

		memberDto.setMemPasswd(finCD);

		// String memPasswd = request.getParameter("memPasswd");
		// System.out.println("memPasswd=" + memPasswd);
		// memberDto.setMemPasswd(memPasswd);

		memberDto.setMemId(loginUser.getMemId());
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
	public String registerProc(HttpServletRequest request, Model model,
			MemberDTO memberDto, HttpSession session) {
		System.out.println("registerProc()");
		try {
			String inputPW = (String) request.getParameter("memPasswd");
			System.out.println("입력한 비밀번호=" + inputPW);

			if (inputPW == "") {
				// if (memberDto.toString().contains("")) {
				System.out.println("''포함된 값");
				return "forward:registerForm.do";
			}

			// 입력한 비밀번호 암호화
			SeedX x = new SeedX();
			int[] roundKey = x.getSeedRoundKey();
			System.out.println("roundKey=" + roundKey);
			byte[] plainCD = x.stringToPlain(inputPW);
			System.out.println("plainCD=" + plainCD);
			byte[] encruptCD = x.getSeedEncrypt(plainCD, roundKey);
			System.out.println("encruptCD=" + encruptCD);
			String finCD = x.cipherToString(encruptCD);
			System.out.println(" finCD=" + finCD);

			memberDto.setMemPasswd(finCD);

			// memberDto.setMemMobile(memberDto.getmPhoneCode() + "-"
			// + memberDto.getmPhoneMid() + "-" + memberDto.getmPhoneEnd());
			System.out.println(memberDto);

			// if (memberDto.toString().contains(null)) {
			// else {
			memberService.putMember(memberDto);

			System.out.println("회원가입완료");
			// }
		} catch (DuplicateKeyException e) {
			System.out.println("DuplicateKeyException");
		}
		model.addAttribute("sMsg", "회원가입을 환영합니다. 로그인 해주세요.");
		// session.removeAttribute("loginUser");
		// session.invalidate();
		return "forward:loginForm.do";
		// return loginForm();
		// return "registerOk";

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

		String inputPW = (String) request.getParameter("memPasswd");
		System.out.println("입력한 비밀번호=" + inputPW);
		// 입력한 비밀번호 암호화 비교
		// SeedX x = new SeedX();
		int[] roundKey = x.getSeedRoundKey();
		System.out.println("roundKey=" + roundKey);
		byte[] plainCD = x.stringToPlain(inputPW);
		System.out.println("plainCD=" + plainCD);
		byte[] encruptCD = x.getSeedEncrypt(plainCD, roundKey);
		System.out.println("encruptCD=" + encruptCD);
		String finCD = x.cipherToString(encruptCD);
		System.out.println(" finCD=" + finCD);

		memberDto.setMemPasswd(finCD);

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
			// return "main";
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

	// @RequestMapping(value = "findIdProc.do", method = RequestMethod.POST)
	// public String findIdProc(Model model, MemberDTO memberDto) {
	// System.out.println("findIdProc()");
	// String userId = memberService.getMemIdByMemberTerms(memberDto);
	//
	// if (userId == null) {
	// model.addAttribute("errmessage", "정보를 다시 확인해주세요");
	// return "forward:findIdForm.do";
	// }
	// model.addAttribute("userId", userId);
	// return "findIdOk";
	// }

	// 비밀번호찾기, 임시비밀번호 변경
	/*
	 * @RequestMapping("findPasswordForm.do") public String findPasswordForm() {
	 * System.out.println("findPasswordForm()"); return "findPassword"; }
	 */

	// @RequestMapping(value = "findPasswordProc.do", method =
	// RequestMethod.POST)
	// public String findPasswordProc(Model model, MemberDTO memberDto,
	// HttpServletRequest request) {
	// System.out.println("findPasswordProc()");
	// String userPassword = memberService
	// .getMemPasswdByMemberTerms(memberDto);
	//
	// if (userPassword == null) {
	// model.addAttribute("errmessage", "정보를 다시 확인해주세요");
	// return "forward:pwCheck.do";
	// }
	//
	// String fromUser = "6amugeona@gmail.com";
	// String toUser = (String) request.getParameter("memId");
	// String subject = "[6randomSelect] 요청하신 인증번호입니다.";
	// // 랜덤으로 인증번호 생성
	// String randomCD = Math.round(Math.random() * 99999999) / 1 + "";
	// System.out.println("randomCD=" + randomCD);
	// // 인증번호 암호화
	// SeedX x = new SeedX();
	// int[] roundKey = x.getSeedRoundKey();
	// System.out.println("roundKey=" + roundKey);
	// byte[] plainCD = x.stringToPlain(randomCD);
	// System.out.println("plainCD=" + plainCD);
	// byte[] encruptCD = x.getSeedEncrypt(plainCD, roundKey);
	// System.out.println("encruptCD=" + encruptCD);
	// String finCD = x.cipherToString(encruptCD);
	// System.out.println(" finCD=" + finCD);
	//
	// String text = getEmailText(randomCD, toUser);
	//
	// mailService.sendMail(fromUser, toUser, subject, text);
	//
	// memberDto.setMemId(toUser);
	// // 암호화된 CD를 비밀번호로 저장
	// memberDto.setTempPw(finCD);
	// memberService.setMemPasswdByMemberTerms(memberDto);
	//
	// model.addAttribute("userMail", toUser);
	// // model.addAttribute("userPassword", userPassword);
	// return "findPasswordOk";
	// }
	//
	// // 임시비밀번호 메일발송내용
	// protected String getEmailText(String randomCD, String toUser) {
	// StringBuilder text = new StringBuilder();
	// text.append("<h2>[6randomSelect] 임시 비밀번호입니다.</h2><br>");
	// text.append(randomCD);
	// text.append("<br><a href=" + urlPath + "loginForm.do"
	// + ">임시번호로 로그인후 비밀번호를 변경해주세요.</a>");
	// return text.toString();
	// }

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
			HttpSession session, HttpServletRequest request) {
		System.out.println("passwordProc()");
		if (session.getAttribute("loginUser") == null) {
			return "forward:loginForm.do";
		}
		MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		System.out.println("loginUser.getMemId()=" + loginUser.getMemId());

		String inputPW = request.getParameter("tempPw");

		System.out.println("새비밀번호=" + inputPW);
		// 입력한 비밀번호 암호화
		SeedX x = new SeedX();
		int[] roundKey = x.getSeedRoundKey();
		System.out.println("roundKey=" + roundKey);
		byte[] plainCD = x.stringToPlain(inputPW);
		System.out.println("plainCD=" + plainCD);
		byte[] encruptCD = x.getSeedEncrypt(plainCD, roundKey);
		System.out.println("encruptCD=" + encruptCD);
		String finCD = x.cipherToString(encruptCD);
		System.out.println(" finCD=" + finCD);

		memberDto.setTempPw(finCD);

		memberDto.setMemId(loginUser.getMemId());
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

		// MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");
		// System.out.println("loginUser.getMemId()=" + loginUser.getMemId());

		MemberDTO loginUser = (MemberDTO) request.getSession().getAttribute(
				"loginUser");
		System.out.println(" loginUser.getMemId()=" + loginUser.getMemId());

		String memMobile = request.getParameter("memMobile");
		System.out.println("새 전화번호=" + memMobile);

		memberDto.setMemId(loginUser.getMemId());
		memberDto.setMemMobile(memMobile);
		System.out.println(memberDto);

		memberService.setMemberInfoByMemberTerms(memberDto);

		model.addAttribute("sMsg", "전화번호가 변경되었습니다.");

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
	public String dropProc(Model model, MemberDTO memberDto,
			HttpSession session, HttpServletRequest request) {
		System.out.println("dropProc()");
		try {
			MemberDTO loginUser = (MemberDTO) request.getSession()
					.getAttribute("loginUser");
			System.out.println(" loginUser.getMemId()=" + loginUser.getMemId());
			memberDto.setMemId(loginUser.getMemId());
			memberService.setLeave(memberDto);
		} catch (NullPointerException e) {
			session.removeAttribute("loginUser");
			session.invalidate();
		}
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
