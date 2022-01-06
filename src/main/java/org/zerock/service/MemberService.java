package org.zerock.service;

import org.zerock.domain.BoardVO;
import org.zerock.domain.AuthVO;
import org.zerock.domain.BoardCriteria;
import org.zerock.domain.MemberVO;

public interface MemberService {
	public void register(MemberVO member, AuthVO avo);
	
	public boolean remove(Long bno);
		
	public int[] getPages(BoardCriteria cri);

	public MemberVO get(MemberVO member);
	
	public boolean getId(String id);

	public MemberVO selectMember(String user_id);

	public int updateMember(MemberVO mvo);

	public int getEmail(String email, String user_id);

	public int getEmail(String email);

	public MemberVO passwordCheck(MemberVO mvo);
}
