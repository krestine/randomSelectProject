package com.project.service;

import com.project.domain.MemberDTO;

public interface MemberService {
	
	// 공통:회원가입
	void putMember(MemberDTO memberDto);

	// 회원:로그인
	MemberDTO getMemberInfoByMemberTerms(MemberDTO memberDto);

	// 회원:아이디찾기
	String getMemIdByMemberTerms(MemberDTO memberDto);

	// 회원:비밀번호찾기
	String getMemPasswdByMemberTerms(MemberDTO memberDto);

	// 회원:내정보
	MemberDTO getMyInfoByMemId(MemberDTO memberDto);

	// 회원:현재비밀번호확인
	String getMemPasswdByMemId(MemberDTO memberDto);

	// 회원:정보수정
	void setMemberInfoByMemberTerms(MemberDTO memberDto);

	// 회원:탈퇴
	void setLeave(MemberDTO memberDto);
	
}
