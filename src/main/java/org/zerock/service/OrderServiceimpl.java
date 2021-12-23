package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CartVO;
import org.zerock.domain.Order1VO;
import org.zerock.domain.OrderDetailVO;
import org.zerock.mapper.OrderMapper;
import org.zerock.mapper.ProductMapper;

@Service
public class OrderServiceimpl implements OrderService{
	@Autowired
	private OrderMapper mapper;
	@Autowired 
	private ProductMapper pmapper;
	@Override
	public int directOrder(OrderDetailVO odvo, int totalprice) {
		
		//재고판별코드실행
		if(odvo.getAmount() <= mapper.stockChk(odvo)) { //재고 있음
			mapper.insertOd(odvo,totalprice); //order1 테이블 insert
			mapper.insertOdt(odvo); //order_detail 테이블 insert

			pmapper.salesCountPlus(odvo.getPd_num(),odvo.getAmount());


			return 1;
		}else { //재고 없음
			return 0;
		}
	}
	
	@Override
	public List<Order1VO> orderList(String user_id) {
		return mapper.orderList(user_id);
	}
	@Override
	public List<OrderDetailVO> orderDetailList(String user_id) {
		return mapper.orderDetailList(user_id);
	}
}
