package com.mh.portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mh.portfolio.mapper.MemberMapper;
import com.mh.portfolio.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public void memberJoin(MemberVO member) {
		memberMapper.memberJoin(member);
	}
	
	@Override
	public int idCheck(String memberId) {
		return memberMapper.memberIdChk(memberId);
	}

}
