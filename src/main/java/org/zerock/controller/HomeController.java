package org.zerock.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductVO;
import org.zerock.service.ProductService;

import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@AllArgsConstructor
@Controller
@RequestMapping( value = "/" , produces = "application/text; charset=UTF-8")
public class HomeController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model) {
		log.info("Welcome home! The client locale is {}.");
		
		ProductCriteria cri = new ProductCriteria();
		cri.setStartPage(1);
		cri.setEndPage(12);
		cri.setCriCategory2("^");
		cri.setCriCategory1("new");
		List<ProductVO> pdList1 = new ArrayList<>(service.getIndexList(cri));
		for(ProductVO pvo : pdList1) {
			pvo.pvoInit();
		}
		
		cri.setCriCategory1("best");
		List<ProductVO> pdList2 = new ArrayList<>(service.getIndexList(cri));
		for(ProductVO pvo : pdList2) {
			pvo.pvoInit();
		}
		
		cri.setCriCategory1("^");
		cri.setCriCategory2("실물 베타");
		List<ProductVO> pdList3 = new ArrayList<>(service.getIndexList(cri));
		for(ProductVO pvo : pdList3) {
			pvo.pvoInit();
		}
		
		cri.setCriCategory2("오란다");
		List<ProductVO> pdList4 = service.getIndexList(cri);
		for(ProductVO pvo : pdList4) {
			pvo.pvoInit();
		}
		
		cri.setEndPage(8);
		cri.setCategory2("금붕어");
		cri.initCategory2();
		List<ProductVO> pdListMd = service.getIndexList(cri);
		for(ProductVO pvo : pdListMd) {
			pvo.pvoInit();
		}
		
		String result1 = new Gson().toJson(pdList1);
		String result2 = new Gson().toJson(pdList2);
		String result3 = new Gson().toJson(pdList3);
		String result4 = new Gson().toJson(pdList4);
		String result5 = new Gson().toJson(pdListMd);

		model.addAttribute("pdList1",result1);
		model.addAttribute("pdList2",result2);
		model.addAttribute("pdList3",result3);
		model.addAttribute("pdList4",result4);
		model.addAttribute("pdListMd",result5);
			
		return "index.jsp";
	}
	
	@ResponseBody
	@PostMapping("/pdListMd")
	public String pdListMd(ProductCriteria cri) {
		
		cri.initCri();
		cri.setStartPage(1);
		cri.setEndPage(8);
		
		List<ProductVO> pdListMd = service.getIndexList(cri);
		for(ProductVO pvo : pdListMd) {
			pvo.pvoInit();
		}
		
		String result = new Gson().toJson(pdListMd);

		System.out.println(result);
		return result;
	}
	
}
