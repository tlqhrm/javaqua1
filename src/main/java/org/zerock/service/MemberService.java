package org.zerock.service;

import org.zerock.domain.BoardVO;
import org.zerock.domain.BoardCriteria;
import org.zerock.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO member);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
		
	public int[] getPages(BoardCriteria cri);

	public MemberVO get(MemberVO member);
	
	public boolean getId(String id);
	
	public boolean getEmail(String email);
	
	public MemberVO selectMember(MemberVO mvo);
}
