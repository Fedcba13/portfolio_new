package com.mh.portfolio.mapper;

import com.mh.portfolio.model.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(MemberVO member);

	//아이디 중복 체크
	public int memberIdChk(String memberId);
}
