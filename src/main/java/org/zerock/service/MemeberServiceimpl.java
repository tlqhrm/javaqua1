package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.zerock.domain.BoardVO;
import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardCriteria;
import org.zerock.domain.MemberVO;

import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class MemeberServiceimpl implements MemberService {
	

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public void register(MemberVO member, AuthVO avo) {
		
		log.info("register......" + member);
		
		mapper.insertAuth(avo);
		mapper.insert(member);
	}

	@Override
	public MemberVO get(MemberVO member) {

		log.info("get........" + member);
		return mapper.get(member);
	}


	@Override
	public boolean remove(Long bno) {
		log.info("remove......" + bno);
		return mapper.delete(bno) == 1;
	}

	@Override
	public int[] getPages(BoardCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean getId(String id) {
		
		return mapper.getId(id) == 1;
		
	}
	
	@Override
	public int getEmail(String email, String user_id) {
		
		int result = mapper.getEmail(email,user_id);
		
		return result ;
		
	}
	
	@Override
	public int getEmail(String email) {
		
		int result = mapper.getEmail2(email);
		
		return result ;
		
	}
	
	@Override
	public MemberVO selectMember(String user_id) {
		return mapper.selectMember(user_id);
	}

	@Override
	public int updateMember(MemberVO mvo) {
		int result = mapper.updateMember(mvo);
		return result;
	}

	@Override
	public MemberVO passwordCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mapper.passwordCheck(mvo);
	}





}
