package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.CartVO;
import org.zerock.mapper.CartMapper;

import lombok.Setter;

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
}
