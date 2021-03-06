package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.ReviewVO;
import org.zerock.mapper.ReviewMapper;

@Service
public class ReviewServiceimpl implements ReviewService{
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public int write(ReviewVO rvo) {
		return mapper.write(rvo);
	}	
	
	@Override
	public int modify(ReviewVO rvo) {
		return mapper.modify(rvo);
	}	
	
	@Override
	public int delete(ReviewVO rvo) {
		return mapper.delete(rvo);
	}	
	
	@Override
	public List<ReviewVO> review_list(int pd_num, PagingDTO pdto) {
        //int startNum = page*listNumber-(listNumber-1); // 페이징 시작넘버
        //int endNum = startNum+(listNumber-1); // 페이징 끝넘버

		return mapper.review_list(pd_num,pdto);
	}	
	
	@Override
	public int review_cnt(int pd_num) { 
		return mapper.review_cnt(pd_num);
	}	
	
	@Override
	public List<ReviewVO> myreview(String user_id,PagingDTO pdto){
		return mapper.myreview(user_id,pdto);
	}
	@Override
	public int myreview_cnt(String user_id) {
		return mapper.myreview_cnt(user_id);
	}
	
	@Override
	public ReviewVO mywrite(ReviewVO rvo) {
		return mapper.mywrite(rvo);
	}
}
