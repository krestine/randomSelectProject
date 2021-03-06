package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.MemberMapper;
import com.project.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	// 공통:회원가입
	@Override
	public void putMember(MemberDTO memberDto) {
		memberMapper.putMember(memberDto);
	}

	// 아이디체크 ajax
	public String getMemIdByMemId(String memId) {
		return memberMapper.getMemIdByMemId(memId);
	}

	// 회원:로그인
	@Override
	public MemberDTO getMemberInfoByMemberTerms(MemberDTO memberDto) {
		return memberMapper.getMemberInfoByMemberTerms(memberDto);
	}

	// 회원:아이디찾기
	@Override
	public String getMemIdByMemberTerms(MemberDTO memberDto) {
		return memberMapper.getMemIdByMemberTerms(memberDto);
	}

	// 회원:비밀번호찾기
	@Override
	public String getMemPasswdByMemberTerms(MemberDTO memberDto) {
		return memberMapper.getMemPasswdByMemberTerms(memberDto);
	}

	// 회원:내정보
	@Override
	public MemberDTO getMyInfoByMemId(String memId) {
		return memberMapper.getMyInfoByMemId(memId);
	}

	// 회원:현재비밀번호확인
	@Override
	public String getMemPasswdByMemId(MemberDTO memberDto) {
		return memberMapper.getMemPasswdByMemId(memberDto);
	}

	// 회원:비밀번호만 변경
	@Override
	@Transactional
	public void setMemPasswdByMemberTerms(MemberDTO memberDto) {
		memberMapper.setMemPasswdByMemberTerms(memberDto);
	}

	// 회원:정보수정
	@Override
	@Transactional
	public void setMemberInfoByMemberTerms(MemberDTO memberDto) {
		memberMapper.setMemberInfoByMemberTerms(memberDto);
	}

	// 회원:탈퇴
	@Override
	@Transactional
	public void setLeave(MemberDTO memberDto) {
		memberMapper.setLeave(memberDto);
	}

	// admin

	// 회원 : 검색 설정
	@Transactional
	public void setOptionInfoByMemId(MemberDTO memberDto) {
		memberMapper.setOptionInfoByMemId(memberDto);
	}

	// 관리자 : 아이디로 유저 검색
	@Override
	public List<MemberDTO> getMemberListById(String memId) {

		return memberMapper.getMemberListById(memId);
	}

	// 관리자 : 이름으로 유저 검색
	@Override
	public List<MemberDTO> getMemberListByName(String memName) {

		return memberMapper.getMemberListByName(memName);
	}

	// 관리자 : 등급으로 유저 검색
	@Override
	public List<MemberDTO> getMemberListByGrade(String memGrade) {

		return memberMapper.getMemberListByGrade(memGrade);
	}

	// 관리자 : 블랙으로 유저 검색
	@Override
	public List<MemberDTO> getMemberListByBlack(String black) {

		return memberMapper.getMemberListByBlack(black);
	}

	// 관리자 : 회원 정보 수정
	@Override
	@Transactional
	public void setMemberInfo(MemberDTO memberDto) {
		memberMapper.setMemberInfo(memberDto);

	}

	@Override
	public MemberDTO getOptionInfoByMemId(String memId) {
		// TODO Auto-generated method stub
		return memberMapper.getOptionInfoByMemId(memId);
	}

	@Override
	public void setEvalCountAndMemGrade(MemberDTO memberDto) {
		memberMapper.setEvalCountAndMemGrade(memberDto);
		
	}

}
