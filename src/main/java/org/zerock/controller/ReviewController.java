package org.zerock.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.zerock.domain.Order1VO;
import org.zerock.domain.OrderDetailVO;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.ProductVO;
import org.zerock.domain.ReviewVO;
import org.zerock.service.ProductService;
import org.zerock.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@AllArgsConstructor

public class ReviewController {
	
	@Autowired
	private ProductService pvservice;
	
	@Autowired
	private ReviewService rvservice;
	
	@GetMapping("/review_write")
	public String review_write(int pd_num, Model model) {
		log.info("review_write............" );
		ProductVO pvo = pvservice.productDetail(pd_num);
		model.addAttribute("pvo", pvo);
		log.info(pvo);
		return "/review_write.jsp";
	}
	
	@GetMapping("/review_modify")
	public String review_modify(int pd_num, Model model) {
		log.info("review_modify............" );
		ProductVO pvo = pvservice.productDetail(pd_num);
		model.addAttribute("pvo", pvo);
		return "/review_modify.jsp";
	}
	@GetMapping("/review_list")
	public String review_list() {
		log.info("get review_list............ ");		
		return "/mypage_reviewlist.jsp";
	}
	
	@ResponseBody
	@PostMapping("/write")
	public String write(ReviewVO rvo) {
		log.info("write............" );
	
		if(rvservice.write(rvo)!=0) {
			return "200";
		}else {
			return "500";
		}
	}
	
	@ResponseBody
	@PostMapping("/modify")
	public String modify(ReviewVO rvo) {
		log.info("modify............" );
	
		if(rvservice.modify(rvo)!=0) {
			return "200";
		}else {
			return "500";
		}
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public String delete(ReviewVO rvo) {
		log.info("delete............" );
	
		if(rvservice.delete(rvo)!=0) {
			return "200";
		}else {
			return "500";
		}
	}
	
	@ResponseBody
	@PostMapping("/mywrite")
	public ReviewVO mywrite(ReviewVO rvo) {
		log.info("mywrite............" );
		return rvservice.mywrite(rvo);
	}
	
	@ResponseBody
	@PostMapping("/review_list")
	public List<Object> review_list(int pd_num, int page, int pagePerList) {
		log.info("review_list............" );
		
		int totalContnet = rvservice.review_cnt(pd_num);
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 10);
		log.info(pdto);
		List<ReviewVO> reviewlist = rvservice.review_list(pd_num,pdto);
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(reviewlist);
		rs.add(pdto);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/myreview")
	public List<Object> myreview(String user_id, int page, int pagePerList) {
		log.info("myreview............" );
		
		int totalContnet = rvservice.myreview_cnt(user_id);
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 10);
		log.info(pdto);
		List<ReviewVO> myreview = rvservice.myreview(user_id,pdto);
		
		log.info(myreview);
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(myreview);
		rs.add(pdto);
		return rs;
	}
}
