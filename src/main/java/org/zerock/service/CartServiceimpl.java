package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CartVO;
import org.zerock.domain.Order1VO;
import org.zerock.mapper.CartMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceimpl implements CartService{
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;

	@Override
	public int cart_add(CartVO cvo) {
		
		//이미 담은 물품인지 판별
		int result = mapper.pdChk(cvo);
		if(result >= 1) {
			return 0;
		}else {
			return mapper.cart_add(cvo);
		}
	}
	
	@Override
	public List<CartVO> cart_list(String user_id) {
		return mapper.cart_list(user_id);
	}
	
	@Override
	public int cart_modify(int cart_num, String mode, String user_id) {
		if( mode.equals("up") ) {
			return mapper.cartUp(cart_num,user_id);
		}else if( mode.equals("down") ) {
			return mapper.cartDown(cart_num,user_id);
		}else if( mode.equals("one_del") ) {
			return mapper.cartOneDel(cart_num,user_id);
		}else if(mode.equals("all_del")) {
			return mapper.cartAllDel(user_id);	
		}else {
			return 0;
		}
	}
	
	@Override
	public int cartOrder(Order1VO ovo) {
		//장바구니 주문전 재고체크

		//order1 테이블 insert 후 od_num 값  얻음
		int result = mapper.insertOd(ovo);
		//cart 테이블 참조하여 order_detail 테이블로 insert
		mapper.insertOdt(ovo);
		mapper.cartAllDel(ovo);	
		return result;	
	}
}
