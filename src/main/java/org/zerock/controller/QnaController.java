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
import org.zerock.domain.PagingDTO;
import org.zerock.domain.ProductVO;
import org.zerock.domain.QnaVO;
import org.zerock.domain.ReviewVO;
import org.zerock.service.ProductService;
import org.zerock.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/qna/*")
@AllArgsConstructor

public class QnaController {
	
	@Autowired
	private ProductService pvservice;
	
	@Autowired
	private QnaService qnaservice;
	
	@GetMapping("/qna_write")
	public String qna_write(int pd_num, Model model) {
		log.info("qna_write............" );
		ProductVO pvo = pvservice.productDetail(pd_num);
		model.addAttribute("pvo", pvo);
		return "/qna_write.jsp";
	}
	
	@GetMapping("/qna_modify")
	public String qna_modify(int pd_num, Model model) {
		log.info("qna_modify............" );
		ProductVO pvo = pvservice.productDetail(pd_num);
		model.addAttribute("pvo", pvo);
		return "/qna_modify.jsp";
	}
	@GetMapping("/qna_list")
	public String qna_list() {
		log.info("get qna_list............ ");		
		return "/mypage_qnalist.jsp";
	}
	
	@ResponseBody
	@PostMapping("/write")
	public String write(QnaVO qvo) {
		log.info("write............" );
	
		if(qnaservice.write(qvo)!=0) {
			return "200";
		}else {
			return "500";
		}
	}
	
	@ResponseBody
	@PostMapping("/modify")
	public String modify(QnaVO qvo) {
		log.info("modify............" );
	
		if(qnaservice.modify(qvo)!=0) {
			return "200";
		}else {
			return "500";
		}
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public String delete(QnaVO qvo) {
		log.info("delete............" );
	
		if(qnaservice.delete(qvo)!=0) {
			return "200";
		}else {
			return "500";
		}
	}
	
	@ResponseBody
	@PostMapping("/mywrite")
	public QnaVO mywrite(QnaVO qvo) {
		log.info("mywrite............" );
		return qnaservice.mywrite(qvo);
	}
	
	@ResponseBody
	@PostMapping("/qna_list")
	public List<QnaVO> qna_list(int pd_num, int page, int pagePerList) {
		log.info("qna_list............" );
		
		int totalContnet = qnaservice.qna_cnt(pd_num);
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 2);
		log.info(pdto);
		List<QnaVO> qnalist = qnaservice.qna_list(pd_num,pdto);
		
		List rs = new ArrayList();
		rs.add(qnalist);
		rs.add(pdto);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/myqna")
	public List<QnaVO> myqna(String user_id, int page, int pagePerList) {
		log.info("myqna............" );
		
		int totalContnet = qnaservice.myqna_cnt(user_id);
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 2);
		log.info(pdto);
		List<QnaVO> myqna = qnaservice.myqna(user_id,pdto);
		
		log.info(myqna);
		
		List rs = new ArrayList();
		rs.add(myqna);
		rs.add(pdto);
		return rs;
	}
}
