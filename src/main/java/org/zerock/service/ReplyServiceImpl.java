package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public int insertReply(ReplyVO rvo) {
		log.info("insertReply......");
		
		
		return mapper.insertReply(rvo);
	}

	@Override
	public List<ReplyVO> getReplyList(int bd_id) {
		
		log.info(bd_id);
		List<ReplyVO> result = new ArrayList<>(mapper.getReplyList(bd_id));
		return result;
	}

	@Override
	public int updateReply(ReplyVO rvo) {
		
		
		return mapper.updateReply(rvo);
	}

	@Override
	public int deleteReply(int re_num) {
		
		
		return mapper.deleteReply(re_num);
	}

	@Override
	public int deleteReplyAll(int bd_id) {
		
		
		return mapper.deleteReplyAll(bd_id);
	}
	
}
