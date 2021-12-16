package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.CartVO;
import org.zerock.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping( value = "/cart/*" , produces = "application/text; charset=UTF-8")
@AllArgsConstructor
public class CartController {
	@Autowired
	private CartService cartService;
	
	@ResponseBody
	@PostMapping("/cart_add")
	public String cart_add(CartVO cvo) {
		log.info("controller............ "+ cvo );
		if(cartService.cart_add(cvo) == 1) {
			return "장바구니에 물품을 추가했습니다.";
		}else {
			return "이미 담은 물품입니다";
		}
		
	}
}
