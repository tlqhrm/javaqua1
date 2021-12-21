package org.zerock.service;

import java.util.List;

import org.zerock.domain.Order1VO;
import org.zerock.domain.OrderDetailVO;

public interface OrderService {
	public int directOrder(OrderDetailVO odvo, int totalprice);
	public List<Order1VO> orderList(String user_id);
	public List<OrderDetailVO> orderDetailList(String user_id);
}
