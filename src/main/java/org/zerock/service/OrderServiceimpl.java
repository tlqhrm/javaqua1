package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.OrderDetailVO;
import org.zerock.mapper.OrderMapper;

@Service
public class OrderServiceimpl implements OrderService{
	@Autowired
	private OrderMapper mapper;
	
	@Override
	public int directOrder(OrderDetailVO odvo, int totalprice) {
		
		//재고판별코드실행
		if(odvo.getAmount() <= mapper.stockChk(odvo)) { //재고 있음
			System.out.println(mapper.stockChk(odvo));
			mapper.insertOd(odvo,totalprice); //order1 테이블 insert
			mapper.insertOdt(odvo); //order_detail 테이블 insert
			return 1;
		}else { //재고 없음
			System.out.println(mapper.stockChk(odvo));
			return 0;
		}
	}
}
