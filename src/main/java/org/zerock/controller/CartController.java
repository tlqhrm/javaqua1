package org.zerock.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.zerock.service.CartService;

import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping( value = "/cart/*")
@AllArgsConstructor
public class CartController {
	@Autowired
	private CartService cartService;
	
	@ResponseBody
	@PostMapping( value = "/cart_add", produces = "application/text; charset=UTF-8")
	public String cart_add(CartVO cvo) {
		log.info("controller............ "+ cvo);
		if(cartService.cart_add(cvo) == 1) {
			return "장바구니에 물품을 추가했습니다.";
		}else {
			return "이미 담은 물품입니다";
		}	
	}
	
	@GetMapping("/cart_list")
	public String cart_list(HttpServletRequest request, Model model) {
		log.info("controller............ ");		
		
		HttpSession session = request.getSession();
		

		String user_id = (String) session.getAttribute("id");
		
//		if(user_id == null) {
//			return "/login.jsp";	
//		}
		
		List<CartVO> list = cartService.cart_list(user_id);
		
		model.addAttribute("cartList", list);
		return "/basket.jsp";
	}
	
	@ResponseBody
	@PostMapping("/cart_list")
	public List<CartVO> cart_list(String user_id) {
		log.info("cart_list............ ");		
				
		List<CartVO> list = cartService.cart_list(user_id);
		return list;
	}
	
	@GetMapping("/cart_order")
	public String cart_order(HttpServletRequest request , Model model) {
		log.info("cart_order............" );
		String user_id = request.getRemoteUser();
		List<CartVO> list = cartService.cart_list(user_id);
		model.addAttribute("cartList", list);
		return "/cart_order.jsp";
	}
	 
	@ResponseBody
	@PostMapping("/cart_modify")
	public String cart_modify(int cart_num, String mode , String user_id) {
		log.info("controller............");
		
		if(cartService.cart_modify(cart_num,mode,user_id)!=0) {
			return "200";
		}else {
			return "500";
		}
	}
	
	@ResponseBody
	@PostMapping("/cartOrder")
	public String cartOrder(Order1VO ovo) {
		log.info("cartOrder......" );
		if(cartService.cartOrder(ovo)!=0) {
			return "200";
		}else {
			return "500";
		}
	}
}
