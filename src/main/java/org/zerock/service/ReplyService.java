package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

public interface ReplyService {
	
	
	public int insertReply(ReplyVO rvo);
	
	public List<ReplyVO> getReplyList(int bd_id);
	
	public int updateReply(ReplyVO rvo);
	
	public int deleteReply(int re_num);
	
	public int deleteReplyAll(int bd_id);
}
