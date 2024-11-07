package com.mh.portfolio.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {

	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberAddr;
	private String memberAddrDetail;
	private String memberGb;
	private long money;
	private long point;
	private Date insertDate;
	private String insertId;
	private Date modifyDate;
	private String modifyId;
	
}
