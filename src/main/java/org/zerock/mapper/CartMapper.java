package org.zerock.mapper;

import org.zerock.domain.CartVO;

public interface CartMapper {
	public int cart_add(CartVO cvo);
	public int pdChk(CartVO cvo);
}
