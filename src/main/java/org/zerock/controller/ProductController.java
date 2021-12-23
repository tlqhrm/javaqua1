package org.zerock.controller;


import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.aop.scope.ScopedProxyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.zerock.domain.ProductVO;
import org.zerock.etc.ImagePath;
import org.zerock.domain.ProductCriteria;
import org.zerock.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value= "/product/*", produces = "application/text; charset=UTF-8")
@AllArgsConstructor
public class ProductController {
	@Autowired
	private ProductService service;
	@Autowired
	private ServletContext context;

	
	@GetMapping("/productList")
	public String listProduct(ProductCriteria cri, @Nullable @SessionAttribute("admin") String admin,Model model) {
		
		log.info("listProduct");
		List<ProductVO> list = new ArrayList<>();
		int[] paging = new int[3];
		if(admin == null) admin = "0";
		cri.setAdmin(admin);	
		
		cri.initCri();


		list = service.getList(cri);
		for(ProductVO lst : list) {
			lst.pvoInit();
		}
		
		paging = service.getPages(cri);
		
		model.addAttribute("paging", paging);
		model.addAttribute("pdList", list);
		model.addAttribute("cri", cri);

		return "/product_list.jsp";
	}
	
	@GetMapping("/productRegistForm")
	public String registForm() {
		
		log.info("ProductRegistForm............ ");
	
		
		return "/product_regist.jsp";
	}
	
	@ResponseBody
	@PostMapping("/productRegist")
	public String writepvo(ProductVO pvo, Model model, MultipartHttpServletRequest mhsr ){


		String category1 = null;
		String[] category1_arr = mhsr.getParameterValues("category1");
		if(category1_arr != null) {
			for( String c1 : category1_arr) {
				if(category1 == null) {
					category1 = (c1+";");
				}else {
					category1 += (c1+";");
				}
			}
		}else {
			category1=";";
		}

		pvo.setCategory1(category1);
		
		pvo.pvoInit();
		
		
		String path = ImagePath.get();
		List<MultipartFile> files = mhsr.getFiles("files");
		StringBuffer sb = new StringBuffer();
		int i = 0;
		for(MultipartFile f : files) {
			String fileName = pvo.getFile1Arr()[i];

			File file = new File(path+"product", fileName);

			if(!file.exists()) {
				if(file.getParentFile().mkdirs()) {
					try {
						file.createNewFile();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				try {
					f.transferTo(file);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			i++;
		}
		log.info(sb);
		String file1 = sb.toString();
		pvo.setFile1(file1);
		
		service.productRegist(pvo);
		
		String pd_num = Integer.toString(pvo.getPd_num());

		return pd_num;
	}
	
	@GetMapping("/productDetail")
	public String readpvo(int pd_num,Model model) {
		log.info("read:" + pd_num);
		
		ProductVO pvo = service.productDetail(pd_num);

		pvo.setPrice2((pvo.getPrice()+(pvo.getPrice()*pvo.getDiscount()))/100);

		
		pvo.pvoInit();
		model.addAttribute("pvo",pvo);
		
		return "/product_detail.jsp";
	}
	@GetMapping("/productUpdateForm")
	public String modifypvoForm(int pd_num,Model model) {
		log.info("productUpdateForm:" + pd_num);
				
		ProductVO pvo = service.productDetail(pd_num);
		pvo.pvoInit();
		model.addAttribute("pvo",pvo);
		return "/product_update.jsp";
	}
	
	@ResponseBody
	@PostMapping("/productUpdate")
	public String productUpdate(ProductVO pvo, Model model, MultipartHttpServletRequest mhsr ){

		String category1 = null;
		String[] category1_arr = mhsr.getParameterValues("category1");
		
		if(category1_arr != null) {
			for( String c1 : category1_arr) {
				if(category1 == null) {
					category1 = (c1+";");
				}else {
					category1 += (c1+";");
				}
			}
		}else {
			category1=";";
		}
		pvo.setCategory1(category1);
		
		pvo.pvoInit();
		
		StringBuffer sb = new StringBuffer();
		
		String path = ImagePath.get();
		
		int i = 0;
		String[] files = mhsr.getParameterValues("files");
		if (files != null) {
			for(String f : files) {
				sb.append(f);
			}
			i = files.length;
		}
		List<MultipartFile> files2 = mhsr.getFiles("files2");
		int files_length = Integer.parseInt(mhsr.getParameter("files_length"));
		

		System.out.println(files_length);
		
		for(MultipartFile f : files2) {
			String fileName = pvo.getFile1Arr()[i];
			File file = new File(path+"product", fileName);
			if(!file.exists()) {
				if(file.getParentFile().mkdirs()) {
					try {
						file.createNewFile();
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				try {
					f.transferTo(file);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			i++;
		}
		log.info(sb);
		String file1 = sb.toString();
		pvo.setFile1(file1);
		
		service.productUpdate(pvo);
		
		String pd_num = Integer.toString(pvo.getPd_num());

		return pd_num;
	}
	
	@ResponseBody
	@PostMapping("/productDelete")
	public String remove(ProductVO pvo) {
		log.info("productDelete..." + pvo);
		pvo.pvoInit();
		String path = ImagePath.get();
		
		
		String[] file1Arr = pvo.getFile1Arr();
		for(int i=0; i<file1Arr.length; i++){
			
			File file = new File(path+"product", file1Arr[i]);
			
			if (file.exists()) {

			      if (file.delete()){

			        log.info("파일 삭제 성공 : "+file1Arr[i]);

			      }else{
			    	  log.info("파일 삭제 실패");
			      }
			}
		}
		int result = service.productDelete(pvo.getPd_num());
		log.info("삭제완료..." + pvo.getPd_num());
		return Integer.toString(result);
	}
}
