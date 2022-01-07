package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;
import org.zerock.domain.OrderDetailVO;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.ProductVO;
import org.zerock.domain.QnaVO;
import org.zerock.domain.ReviewVO;

public interface AdminService {
	public List<MemberVO> member_list(PagingDTO pdto);
	public int member_cnt();
	
	public List<ProductVO> product_list(PagingDTO pdto);
	public int product_cnt();
	public ProductVO product_detail(int pd_num);
	
	public List<OrderDetailVO> order_list(PagingDTO pdto);
	public int order_cnt();
	
	public List<ReviewVO> review_list(PagingDTO pdto);
	public int review_cnt();
	
	public List<QnaVO> qna_list(PagingDTO pdto);
	public int qna_cnt();
	public int qnaReply(int qna_num,String reply);
}