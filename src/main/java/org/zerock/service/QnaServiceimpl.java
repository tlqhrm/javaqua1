package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.QnaVO;
import org.zerock.domain.ReviewVO;
import org.zerock.mapper.QnaMapper;

@Service
public class QnaServiceimpl implements QnaService{
	@Autowired
	private QnaMapper mapper;
	
	@Override
	public int write(QnaVO qvo) {
		return mapper.write(qvo);
	}	
	@Override
	public int modify(QnaVO qvo) {
		return mapper.modify(qvo);
	}	
	@Override
	public int delete(QnaVO qvo) {
		return mapper.delete(qvo);
	}	
	
	@Override
	public List<QnaVO> qna_list(int pd_num, PagingDTO pdto) {
        //int startNum = page*listNumber-(listNumber-1); // 페이징 시작넘버
        //int endNum = startNum+(listNumber-1); // 페이징 끝넘버

		return mapper.qna_list(pd_num,pdto);
	}		
	@Override
	public int qna_cnt(int pd_num) { 
		return mapper.qna_cnt(pd_num);
	}	
	
	@Override
	public List<QnaVO> myqna(String user_id,PagingDTO pdto){
		return mapper.myqna(user_id,pdto);
	}
	@Override
	public int myqna_cnt(String user_id) {
		return mapper.myqna_cnt(user_id);
	}
	
	@Override
	public QnaVO mywrite(QnaVO qvo) { 
		return mapper.mywrite(qvo);
	}	
}
