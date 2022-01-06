package org.zerock.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {

		log.warn("Load User By UserName : " + user_id);

		// userName means userid
		MemberVO vo = memberMapper.read(user_id);

		log.warn("queried by member mapper: " + vo);

//		return vo == null ? null : new CustomUser(vo);
		
		if(vo == null) {
			throw new UsernameNotFoundException(user_id);
		}
		return new CustomUser(vo);
	} 

}
