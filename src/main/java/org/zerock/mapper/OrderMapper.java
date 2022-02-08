package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Order1VO;
import org.zerock.domain.OrderDetailVO;

public interface OrderMapper {
	public int stockChk(OrderDetailVO odvo);
	public int insertOd(@Param("odvo") OrderDetailVO odvo, @Param("totalPrice") int totalprice);
	public int insertOdt(OrderDetailVO odvo);
	
	public List<Order1VO> orderList(String user_id);
	public List<OrderDetailVO> orderDetailList(String user_id);
}
