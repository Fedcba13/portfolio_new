package com.mh.portfolio.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.mh.portfolio.mapper.MemberMapper;
import com.mh.portfolio.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	MemberMapper memberMapper;
	
	@Value("${security.salt}")
	static private String salt;
	
	@Override
	public void memberJoin(MemberVO member) {
		
		member.setMemberPw(encrypt(member.getMemberPw()));
		
		memberMapper.memberJoin(member);
	}
	
	@Override
	public int idCheck(String memberId) {
		return memberMapper.memberIdChk(memberId);
	}
	
	public static String encrypt(String msg) {
		MessageDigest md;
		StringBuilder builder = new StringBuilder("fail");
		
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update((msg + salt).getBytes());
			
			builder = new StringBuilder();
	        for (byte b: md.digest()) {
	          builder.append(String.format("%02x", b));
	        }
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return builder.toString(); 
	}

}
