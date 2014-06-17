package com.project.dao;

import com.project.domain.MemberDTO;

public interface MemberMapper {

	// 회원가입
	void putMember(MemberDTO memberDto);

	// 로그인
	MemberDTO getMemberInfoByMemberTerms(MemberDTO memberDto);

	// 아이디찾기
	String getMemIdByMemberTerms(MemberDTO memberDto);

	// 비밀번호찾기
	String getMemPasswdByMemberTerms(MemberDTO memberDto);

	// 내정보
	MemberDTO getMyInfoByMemId(MemberDTO memberDto);

	// 현재비밀번호확인
	String getMemPasswdByMemId(MemberDTO memberDto);

	// 정보수정
	MemberDTO setMemberInfoByMemberTerms(MemberDTO memberDto);

	// 탈퇴
	MemberDTO putLeave(MemberDTO memberDto);

}
