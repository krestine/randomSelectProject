package com.project.service;

import java.util.List;

import com.project.domain.MemberDTO;

public interface MemberService {

	// 공통:회원가입
	void putMember(MemberDTO memberDto);

	// 아이디체크 ajax
	String getMemIdByMemId(String memId);

	// 회원:로그인
	MemberDTO getMemberInfoByMemberTerms(MemberDTO memberDto);

	// 회원:아이디찾기
	String getMemIdByMemberTerms(MemberDTO memberDto);

	// 회원:비밀번호찾기
	String getMemPasswdByMemberTerms(MemberDTO memberDto);

	// 회원:내정보
	MemberDTO getMyInfoByMemId(String memId);

	// 회원:현재비밀번호확인
	String getMemPasswdByMemId(MemberDTO memberDto);

	// 회원:비밀번호만 변경
	void setMemPasswdByMemberTerms(MemberDTO memberDto);

	// 회원:정보수정
	void setMemberInfoByMemberTerms(MemberDTO memberDto);

	// 회원:탈퇴
	void setLeave(MemberDTO memberDto);

	// admin

	// 회원 : 검색 설정
	void setOptionInfoByMemId(MemberDTO memberDto);

	// 관리자 : 아이디로 유저 검색
	List<MemberDTO> getMemberListById(String memId);

	// 관리자 : 이름으로 유저 검색
	List<MemberDTO> getMemberListByName(String memName);

	// 관리자 : 등급으로 유저 검색
	List<MemberDTO> getMemberListByGrade(String memGrade);

	// 관리자 : 블랙으로 유저 검색
	List<MemberDTO> getMemberListByBlack(String black);

	// 관리자 : 회원 정보 수정
	void setMemberInfo(MemberDTO memberDto);

	// 회원 : 설정 정보 불러오기 /
	MemberDTO getOptionInfoByMemId(String memId);
	
	void setEvalCountAndMemGrade(MemberDTO memberDto);

}
