package org.zerock.service;

import java.util.List;

import org.zerock.domain.PagingDTO;
import org.zerock.domain.ReviewVO;

public interface ReviewService {
	public int write(ReviewVO rvo);
	public int modify(ReviewVO rvo);
	public int delete(ReviewVO rvo);
	public List<ReviewVO> review_list(int pd_num,PagingDTO pdto);
	public int review_cnt(int pd_num);
	public List<ReviewVO> myreview(String user_id,PagingDTO pdto);
	public int myreview_cnt(String user_id);
	public ReviewVO mywrite(ReviewVO rvo);
}
