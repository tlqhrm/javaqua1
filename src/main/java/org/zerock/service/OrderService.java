package org.zerock.service;

import org.zerock.domain.OrderDetailVO;

public interface OrderService {
	public int directOrder(OrderDetailVO odvo, int totalprice);
}
