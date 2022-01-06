package org.zerock.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.zerock.domain.MemberVO;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Log4j
@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;

	private MemberVO member;

	public CustomUser(String user_id, String user_pw, 
			Collection<? extends GrantedAuthority> authorities) {
		super(user_id, user_pw, authorities);
	}

	public CustomUser(MemberVO vo) {
		
		
		
		super(vo.getUser_id(), vo.getUser_pw(), vo.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		log.info("------------");
		this.member = vo;
	}
}
