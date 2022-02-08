package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private int user_num;
	private String user_id;
	private String name;
	private String user_pw;
	private String user_email;
	private String user_address;
	private String user_address2;
	private String user_phone;
	
	
	private List<AuthVO> authList;
}
