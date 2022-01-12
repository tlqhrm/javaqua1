package org.zerock.controller;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
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
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductCriteriaAdmin;
import org.zerock.domain.ProductVO;
import org.zerock.etc.ImagePath;
import org.zerock.service.ProductService;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

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
	public String listProduct(ProductCriteria cri,Model model) {
		
		log.info("listProduct");
		List<ProductVO> list = new ArrayList<>();
		int[] paging = new int[3];

		cri.initCri(12);


		list = service.getList(cri); 
		for(ProductVO lst : list) {
			lst.pvoInit();
		}
		log.info(cri);
		paging = service.getPages(cri);
		
		model.addAttribute("paging", paging);
		model.addAttribute("pdList", list);
		model.addAttribute("cri", cri);

		return "/product_list.jsp";
	}
	
	@GetMapping("/productRegistForm")
	public String registForm() {
		
		log.info("ProductRegistForm............ ");
	
		
		return "/admin/product/product_regist.jsp";
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
			sb.append(fileName+";");
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
	public String readpvo(int pd_num,Model model, HttpServletRequest requst, HttpServletResponse response) throws UnsupportedEncodingException {
		log.info("read:" + pd_num);
		
		ProductVO pvo = service.productDetail(pd_num);

		pvo.setPrice2((pvo.getPrice()+(pvo.getPrice()*pvo.getDiscount()))/100);	
		pvo.pvoInit();
	
		model.addAttribute("pvo",pvo);
		
		
		//최근본상품
		Map<String,Object> map = new HashMap<>();
		map.put("pd_num", pvo.getPd_num());
		map.put("title",pvo.getTitle());
		map.put("price",pvo.getStrPrice());
		map.put("price2",pvo.getStrPrice2());
		map.put("file1",pvo.getFile1Arr()[0]);
		
		String recentPd = new Gson().toJson(map);
		
		String cName = "pd_num"+pvo.getPd_num();
		Cookie cookie = new Cookie("pd_num" + Integer.toString(pvo.getPd_num()), URLEncoder.encode(recentPd,"UTF-8"));
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24*7);
		response.addCookie(cookie);
		
		Cookie[] cookies = requst.getCookies();

		int count = 0;
		int cookieNum = 10;
		int[] index = new int[12];
		for(int i=0; i< cookies.length; i++) {
			if(cookies[i].getName().contains("pd_num")) {
				index[count] = i ;
				count++;
				if(cookies[i].getName().equals(cName)) {
					cookieNum++;
				}
			}
		}
		if(count >= cookieNum) {
			cookies[index[0]].setMaxAge(0);
			cookies[index[0]].setPath("/");
			response.addCookie(cookies[index[0]]);
		}
		return "/product_detail.jsp";
	}
	@GetMapping("/productUpdateForm")
	public String modifypvoForm(int pd_num,Model model) {
		log.info("productUpdateForm:" + pd_num);
				
		ProductVO pvo = service.productDetail(pd_num);
		pvo.pvoInit();
		model.addAttribute("pvo",pvo);
		return "/admin/product/product_update.jsp";
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
		String[] deletedFiles = mhsr.getParameterValues("deleted_files");
		
		for(MultipartFile f : files2) {
			String fileName = pvo.getFile1Arr()[i];
			sb.append(fileName+";");
		}
		
		
		log.info(sb);
		String file1 = sb.toString();
		pvo.setFile1(file1);
		
		int result = service.productUpdate(pvo);
		
		if(deletedFiles != null) {
			
			log.info(deletedFiles[0]);
			log.info("result : "+result);
			log.info(deletedFiles.length);
			if(result == 1 ) {
				for(int j=0; j<deletedFiles.length; j++){
					log.info(j);
					File file = new File(path+"product", deletedFiles[j]);
					
					if (file.exists()) {
		
					      if (file.delete()){
		
					        log.info("파일 삭제 성공 : "+deletedFiles[j]);
		
					      }else{
					    	  log.info("파일 삭제 실패");
					      }
					}
				}
			}
		}
		if(result == 1) {
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
		}
		
		String pd_num = Integer.toString(pvo.getPd_num());

		return pd_num;
	}
	
	@ResponseBody
	@PostMapping("/productDelete")
	public String remove(ProductVO pvo) {
		log.info("productDelete..." + pvo);
		pvo.pvoInit();
		String path = ImagePath.get();
		
		int result = service.productDelete(pvo.getPd_num());
		
		if(result == 1) {
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
		}
		log.info("삭제완료..." + pvo.getPd_num());
		return Integer.toString(result);
	}
	
	@ResponseBody
	@PostMapping("/productUpdateAll")
	public String productUpdate(String list) throws JsonParseException, JsonMappingException, IOException{
		
		log.warn(list);
		
		ObjectMapper mapper = new ObjectMapper();
		List<ProductVO> data = mapper.readValue(list, new TypeReference<List<ProductVO>>(){});
		
		for(ProductVO lst : data) {
			lst.setCategory1();
		}
		
		int result = service.productUpdateAll(data);

		if(data.size() == result) {
			return "저장 되었습니다.";
		}else {
			return "오류가 발생했습니다.";
		}
		
		
	}
	
}
