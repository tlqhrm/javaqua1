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
	@PostMapping("/qna_list")
	public List<QnaVO> qna_list(int pd_num, int page, int pagePerList) {
		log.info("qna_list............" );
		
		int totalContnet = qnaservice.qna_cnt(pd_num);
		PagingDTO pvo = new PagingDTO(totalContnet, page, pagePerList, 2);
		log.info(pvo);
		List<QnaVO> qnalist = qnaservice.qna_list(pd_num,pvo);
		
		List rs = new ArrayList();
		rs.add(qnalist);
		rs.add(pvo);
		return rs;
	}
}
