package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.OrderDetailVO;
import org.zerock.domain.ProductVO;
import org.zerock.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {
	@Autowired
	private OrderService orderService;

	@GetMapping("/direct_order")
	public String direct_order(ProductVO pvo) {
		log.info("direct_order............" );
		
		return "/direct_order.jsp";
	}
	
	@GetMapping("/order_ok")
	public String order_ok() {
		log.info("order_ok............" );
		
		return "/order_ok.jsp";
	}
	
	@ResponseBody
	@PostMapping("/directOrder")
	public int directOrder(OrderDetailVO odvo, int totalprice) {
		log.info("directOrder......" );
		
		int result = orderService.directOrder(odvo,totalprice);
		return result;
	}
}
