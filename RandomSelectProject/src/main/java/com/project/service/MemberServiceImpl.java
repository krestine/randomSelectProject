package com.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.MemberMapper;
import com.project.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	// 회원가입
	@Override
	public void putMember(MemberDTO memberDto) {
		// TODO Auto-generated method stub

	}

	// 로그인
	@Override
	public MemberDTO getMemberInfoByMemberTerms(MemberDTO memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	// 아이디찾기
	@Override
	public String getMemIdByMemberTerms(MemberDTO memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	// 비밀번호찾기
	@Override
	public String getMemPasswdByMemberTerms(MemberDTO memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	// 내정보
	@Override
	public MemberDTO getMyInfoByMemId(MemberDTO memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	// 현재비밀번호확인
	@Override
	public String getMemPasswdByMemId(MemberDTO memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	// 정보수정
	@Override
	public MemberDTO setMemberInfoByMemberTerms(MemberDTO memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

	// 탈퇴
	@Override
	public MemberDTO putLeave(MemberDTO memberDto) {
		// TODO Auto-generated method stub
		return null;
	}

}
