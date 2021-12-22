package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.BoardCriteria;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

//		@Select("select * from tbl_board where bno > 0")
//		@Select("SELECT sysdate from dual")
		public int insert(MemberVO member);
	
		public List<BoardVO> getList(BoardCriteria cri);
			
		public String getTime();
						
		
		public void insertSelectKey(BoardVO board);
		
		public MemberVO get(MemberVO member);
		
		public int delete(Long bno);
		
		public int update(BoardVO board);
		
		public int getId(String id);
		
		public int getEmail(String email);
		
		public MemberVO selectMember(String user_id);
}
