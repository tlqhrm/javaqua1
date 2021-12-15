package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.zerock.domain.BoardVO;
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
	public void register(MemberVO member) {
		
		log.info("register......" + member);
		
		mapper.insert(member);
	}

	@Override
	public MemberVO get(MemberVO member) {

		log.info("get........" + member);
		return mapper.get(member);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify......" + board);
		return mapper.update(board) == 1;
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
	public boolean getEmail(String email) {
		
		return mapper.getEmail(email) !=0 ;
		
	}
}
