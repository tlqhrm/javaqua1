package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insertReply(ReplyVO rvo);
	
	public List<ReplyVO> getReplyList(int bd_id);
	  
	public int updateReply(ReplyVO rvo);
	
	public int deleteReply(int re_num);

	public int deleteReplyAll(int bd_id);
	
	
	
	
}
