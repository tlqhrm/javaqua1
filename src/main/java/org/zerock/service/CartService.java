package org.zerock.service;

import java.util.List;

import org.zerock.domain.CartVO;
import org.zerock.domain.Order1VO;

public interface CartService {
	public int cart_add(CartVO cvo);
	
	public List<CartVO> cart_list(String user_id);
	
	public int cart_modify(int cart_num, String mode, String user_id);
	
	public int cartOrder(Order1VO ovo);
}
