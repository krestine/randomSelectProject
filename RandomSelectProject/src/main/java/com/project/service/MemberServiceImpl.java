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
		memberMapper.putMember(memberDto);
	}

	// 로그인
	@Override
	public MemberDTO getMemberInfoByMemberTerms(MemberDTO memberDto) {
		return memberMapper.getMemberInfoByMemberTerms(memberDto);
	}

	// 아이디찾기
	@Override
	public String getMemIdByMemberTerms(MemberDTO memberDto) {
		return memberMapper.getMemIdByMemberTerms(memberDto);
	}

	// 비밀번호찾기
	@Override
	public String getMemPasswdByMemberTerms(MemberDTO memberDto) {
		return memberMapper.getMemPasswdByMemberTerms(memberDto);
	}

	// 내정보
	@Override
	public MemberDTO getMyInfoByMemId(MemberDTO memberDto) {
		return memberMapper.getMyInfoByMemId(memberDto);
	}

	// 현재비밀번호확인
	@Override
	public String getMemPasswdByMemId(MemberDTO memberDto) {
		return memberMapper.getMemPasswdByMemId(memberDto);
	}

	// 정보수정
	@Override
	public MemberDTO setMemberInfoByMemberTerms(MemberDTO memberDto) {
		return memberMapper.setMemberInfoByMemberTerms(memberDto);
	}

	// 탈퇴
	@Override
	public MemberDTO putLeave(MemberDTO memberDto) {
		return memberMapper.putLeave(memberDto);
	}

}
