package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.zerock.domain.CartVO;
import org.zerock.domain.Order1VO;
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
	public String direct_order() {
		log.info("direct_order............" );
		
		return "/direct_order.jsp";
	}
	
	@GetMapping("/order_ok")
	public String order_ok() {
		log.info("order_ok............" );
		
		return "/order_ok.jsp";
	}
	
	@GetMapping("/order_list")
	public String order_list(@SessionAttribute("id") String user_id , Model model) {
		log.info("controller............ ");		
		
		List<Order1VO> orderlist = orderService.orderList(user_id);
		List<OrderDetailVO> detail_list = orderService.orderDetailList(user_id);	
		model.addAttribute("orderlist", orderlist);
		model.addAttribute("detail_list", detail_list);
		return "/mypage_orderlist.jsp";
	}
	
	@ResponseBody
	@PostMapping("/directOrder")
	public int directOrder(OrderDetailVO odvo, int totalprice) {
		log.info("directOrder......" );
		
		int result = orderService.directOrder(odvo,totalprice);
		return result;
	}
}
