package org.zerock.service;

import java.util.List;
import java.util.Map;

import org.zerock.domain.BoardVO;
import org.zerock.domain.BoardCriteria;

public interface BoardService {
	public Map insertBoard(BoardVO board, String admin);
	
	public BoardVO readBoard(int bd_id, String ip);
	
	public int[] getPages(BoardCriteria cri);

	public List<BoardVO> getBoardList(BoardCriteria cri);
	
	public boolean updateBoard(BoardVO board);
	
	public int intcreseReply(int bd_id);
	
	public boolean deleteBoard(int bd_id);

	public int minusReply(int bd_id);
	
	public int changeBoardStatus(BoardVO bvo);
}
