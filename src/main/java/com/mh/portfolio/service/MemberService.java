package com.mh.portfolio.service;

import com.mh.portfolio.model.MemberVO;

public interface MemberService {
	
	//회원가입
	public void memberJoin(MemberVO member);
	
	//아이디 중복 검사
	public int idCheck(String memberId);

}
