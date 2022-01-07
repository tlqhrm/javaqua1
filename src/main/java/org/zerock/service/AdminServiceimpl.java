package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.domain.OrderDetailVO;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.ProductVO;
import org.zerock.domain.QnaVO;
import org.zerock.domain.ReviewVO;
import org.zerock.mapper.AdminMapper;

@Service
public class AdminServiceimpl implements AdminService{
	@Autowired
	private AdminMapper mapper;
	
	
	@Override
	public List<MemberVO> member_list(PagingDTO pdto) {
		return mapper.member_list(pdto);
	}	
	@Override
	public int member_cnt() { 
		return mapper.member_cnt();
	}	
	
	
	@Override
	public List<ProductVO> product_list(PagingDTO pdto) {
		return mapper.product_list(pdto);
	}	
	@Override
	public int product_cnt() { 
		return mapper.product_cnt();
	}	
	@Override
	public ProductVO product_detail(int pd_num) { 
		return mapper.product_detail(pd_num);
	}	
	
	
	@Override
	public List<OrderDetailVO> order_list(PagingDTO pdto) {
		return mapper.order_list(pdto);
	}	
	@Override
	public int order_cnt() { 
		return mapper.order_cnt();
	}	
	
	@Override
	public List<ReviewVO> review_list(PagingDTO pdto) {
		return mapper.review_list(pdto);
	}	
	@Override
	public int review_cnt() { 
		return mapper.review_cnt();
	}	
	
	@Override
	public List<QnaVO> qna_list(PagingDTO pdto) {
		return mapper.qna_list(pdto);
	}	
	@Override
	public int qna_cnt() { 
		return mapper.qna_cnt();
	}	
	@Override
	public int qnaReply(int qna_num,String reply) { 
		return mapper.qnaReply(qna_num,reply);
	}	
}