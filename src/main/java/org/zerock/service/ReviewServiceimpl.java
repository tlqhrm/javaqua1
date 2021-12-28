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
	public List<ReviewVO> review_list(int pd_num, PagingDTO pvo) {
        //int startNum = page*listNumber-(listNumber-1); // 페이징 시작넘버
        //int endNum = startNum+(listNumber-1); // 페이징 끝넘버

		return mapper.review_list(pd_num,pvo.getStartNum(),pvo.getEndNum());
	}	
	
	@Override
	public int review_cnt(int pd_num) { 
		return mapper.review_cnt(pd_num);
	}	
}
