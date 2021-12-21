package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.CartVO;
import org.zerock.domain.Order1VO;
import org.zerock.domain.OrderDetailVO;

public interface CartMapper {
	public int cart_add(CartVO cvo);
	public int pdChk(CartVO cvo);
	public List<CartVO> cart_list(String user_id);
	
	public int cartUp(@Param("cart_num") int cart_num, @Param("user_id") String user_id);
	public int cartDown(@Param("cart_num") int cart_num, @Param("user_id") String user_id);
	public int cartOneDel(@Param("cart_num") int cart_num, @Param("user_id") String user_id);
	public int cartAllDel(String user_id);
	public int cartAllDel(Order1VO ovo);
	
	public int insertOd(Order1VO ovo);
	public int insertOdt(Order1VO ovo);
}
