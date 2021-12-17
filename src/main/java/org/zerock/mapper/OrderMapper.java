package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.OrderDetailVO;

public interface OrderMapper {
	public int stockChk(OrderDetailVO odvo);
	public int insertOd(@Param("odvo") OrderDetailVO odvo, @Param("totalPrice") int totalprice);
	public int insertOdt(OrderDetailVO odvo);
}
