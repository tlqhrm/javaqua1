package org.zerock.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.BoardCriteria;

public interface BoardMapper {

		public int insertBoard(Map map);
		
		public BoardVO readBoard(int bd_id);

		public int paging(BoardCriteria cri);
	
		public List<BoardVO> getBoardList(BoardCriteria cri);
			
		public int updateBoard(BoardVO board);
		
		public int increseStep(BoardVO board);

		public int increseHit(int bd_id);
		
		public int increseReply(int bd_id);
		
		public int minusReply(int bd_id);
		
		public int deleteBoard(int bd_id);
		
		public int changeBoardStatus(BoardVO bvo);

		public int boardHitCheck(Map map);
		
		public int insertBoardHit(Map map);

		public List<BoardVO> noticeList();
}
