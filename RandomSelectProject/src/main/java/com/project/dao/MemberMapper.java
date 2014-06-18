package com.project.dao;

import java.util.List;

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

	//회원 : 검색 설정
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
}
