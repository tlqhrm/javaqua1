package org.zerock.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.ProductVO;
import org.zerock.domain.ProductCriteria;
import org.zerock.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product/*")
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

		cri.initCri2();
		model.addAttribute("paging", paging);
		model.addAttribute("pdList", list);
		model.addAttribute("cri", cri);

		return "/product_list.jsp";
	}
	
	@GetMapping("/writeForm")
	public String writepvoForm(String bd_category2, Model model) {
		
		log.info("writepvoForm............ " + bd_category2);
		
		model.addAttribute("bd_category2",bd_category2);
		return "/pvo_write.jsp";
	}
	  
//	@PostMapping("/write")
//	public String writepvo(ProductVO pvo, Model model,@SessionAttribute("id") String id, MultipartFile file , HttpServletRequest request) {
//		
//		String path2 = "C:\\sts\\spring_study\\ex021\\src\\main\\webapp\\resources\\upload\\pvo";
//		context = request.getServletContext();
//		String path = context.getRealPath("resources/upload/pvo");
//		
//		
//		log.info("-----------------------");
//		log.info("Upload File Name: "+file.getOriginalFilename());
//		log.info("Upload File Size: "+file.getSize());
//		pvo.setFile1(file.getOriginalFilename());
//		
//		File saveFile = new File(path, file.getOriginalFilename());
//		File saveFile2 = new File(path2, file.getOriginalFilename());
//		try {
//			file.transferTo(saveFile);
//			file.transferTo(saveFile2);
//		}catch (Exception e) {
//			log.error(e.getMessage());
//		}
//		
//		
//		log.info("/write.....");
//		pvo.setUser_id(id);
//		
//		service.register(pvo);
//		
//		int bd_id = pvo.getBd_id();
//				
//		return "redirect:/pvo/read?bd_id="+bd_id;
//	}
//	
	@GetMapping("/productDetail")
	public String readpvo(int pd_num,Model model) {
		log.info("read:" + pd_num);
		
		ProductVO pvo = service.productDetail(pd_num);

		pvo.setPrice2(pvo.getPrice() - (pvo.getPrice() / pvo.getDiscount()));

		model.addAttribute("pvo",pvo);
		
		return "/product_detail.jsp";
	}
	@PostMapping("/modifyForm")
	public String modifypvoForm(ProductVO pvo,Model model) {
		log.info("modifyForm:" + pvo);
				
		model.addAttribute("pvo",pvo);
		return "/pvo_update.jsp";
	}
	
//	@PostMapping("/modify")
//	public String modifypvo(ProductVO pvo,Model model, MultipartFile file) {
//		log.info("modify:" + pvo);
//		int bd_id = pvo.getBd_id();
//		
//		boolean result = service.modify(pvo);
//		if(result) {
//		
//			if(pvo.getFile1() == null) {
//					
//			String uploadFolder = "C:\\sts\\spring_study\\ex021\\src\\main\\webapp\\resources\\upload\\pvo";
//			log.info("-----------------------");
//			log.info("Upload File Name: "+file.getOriginalFilename());
//			log.info("Upload File Size: "+file.getSize());
//			pvo.setFile1(file.getOriginalFilename());
//			File saveFile = new File(uploadFolder, file.getOriginalFilename());
//			
//				try {
//					file.transferTo(saveFile);
//				}catch (Exception e) {
//					log.error(e.getMessage());
//				}		
//			}
//			else {
//				log.info("파일변경 X");
//			}	
//			
//			model.addAttribute("pvo",pvo);
//			log.info(bd_id+"번 게시글 수정 완료");
//			return "redirect:/pvo/read?bd_id="+bd_id;
//		}else {
//			log.info(bd_id+"번 게시글 수정 실패");
//		}
//		
//
//		return "redirect:/pvo/read?bd_id="+bd_id;
//	}
//	
//	
//	@PostMapping("/remove")
//	public String remove(ProductVO pvo) {
//		log.info("remove..." + pvo);
//		String bd_category2 = pvo.getBd_category2();
//		service.remove(pvo.getBd_id());
//		log.info("삭제완료..." + pvo + bd_category2);
//		return "redirect:/pvo/list?bd_category2="+bd_category2+"&page=1";
//	}
}
