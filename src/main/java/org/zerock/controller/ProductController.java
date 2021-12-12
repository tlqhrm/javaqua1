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
import org.zerock.domain.BoardVO;
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductVO;
import org.zerock.domain.BoardCriteria;
import org.zerock.service.BoardService;
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

	
	@GetMapping("/list")
	public String listProduct(ProductCriteria cri, @Nullable @SessionAttribute("admin") String admin,Model model) {
			
		log.info("listProduct");
		List<ProductVO> list = new ArrayList<>();
		System.out.println("1");
		int[] paging = new int[3];
		if(admin == null) admin = "0";
		cri.setAdmin(admin);	
		
		cri.initCri();
		System.out.println("2");
		String category2 = cri.getCategory2();
		String category1 = cri.getCategory1();		
		String category22 = "ㅇ";
		
		System.out.println("3");
		list = service.getList(cri);
		for(ProductVO lst : list) {
			lst.pvoInit();
		}
		
		System.out.println("4");
		paging = service.getPages(cri);
		
		if(category22.equals("전체보기")) {
			category2 = "전체보기";
		}
		if(category1.equals("new")) {
			category1="신상품";
		}else if(category1.equals("sale")) {
			category1="할인상품";
		}
		else if(category1.equals("best")) {
			category1="베스트";
		}
		
		cri.setCri(category1, category2);
		model.addAttribute("paging", paging);
		model.addAttribute("pdList", list);
		model.addAttribute("cri", cri);

		return "/product_list.jsp";
	}
	
	@GetMapping("/writeForm")
	public String writeBoardForm(String bd_category2, Model model) {
		
		log.info("writeBoardForm............ " + bd_category2);
		
		model.addAttribute("bd_category2",bd_category2);
		return "/board_write.jsp";
	}
	  
	@PostMapping("/write")
	public String writeBoard(BoardVO board, Model model,@SessionAttribute("id") String id, MultipartFile file , HttpServletRequest request) {
		
		String path2 = "C:\\sts\\spring_study\\ex021\\src\\main\\webapp\\resources\\upload\\board";
		context = request.getServletContext();
		String path = context.getRealPath("resources/upload/board");
		
		
		log.info("-----------------------");
		log.info("Upload File Name: "+file.getOriginalFilename());
		log.info("Upload File Size: "+file.getSize());
		board.setFile1(file.getOriginalFilename());
		
		File saveFile = new File(path, file.getOriginalFilename());
		File saveFile2 = new File(path2, file.getOriginalFilename());
		try {
			file.transferTo(saveFile);
			file.transferTo(saveFile2);
		}catch (Exception e) {
			log.error(e.getMessage());
		}
		
		
		log.info("/write.....");
		board.setUser_id(id);
		
		service.register(board);
		
		int bd_id = board.getBd_id();
				
		return "redirect:/board/read?bd_id="+bd_id;
	}
	
	@GetMapping("/read")
	public String readBoard(int bd_id,Model model) {
		log.info("read:" + bd_id);
		
		BoardVO bvo = service.get(bd_id);
		model.addAttribute("bvo",bvo);
		
		return "/board_detail.jsp";
	}
	@PostMapping("/modifyForm")
	public String modifyBoardForm(BoardVO board,Model model) {
		log.info("modifyForm:" + board);
				
		model.addAttribute("bvo",board);
		return "/board_update.jsp";
	}
	
	@PostMapping("/modify")
	public String modifyBoard(BoardVO board,Model model, MultipartFile file) {
		log.info("modify:" + board);
		int bd_id = board.getBd_id();
		
		boolean result = service.modify(board);
		if(result) {
		
			if(board.getFile1() == null) {
					
			String uploadFolder = "C:\\sts\\spring_study\\ex021\\src\\main\\webapp\\resources\\upload\\board";
			log.info("-----------------------");
			log.info("Upload File Name: "+file.getOriginalFilename());
			log.info("Upload File Size: "+file.getSize());
			board.setFile1(file.getOriginalFilename());
			File saveFile = new File(uploadFolder, file.getOriginalFilename());
			
				try {
					file.transferTo(saveFile);
				}catch (Exception e) {
					log.error(e.getMessage());
				}		
			}
			else {
				log.info("파일변경 X");
			}	
			
			model.addAttribute("bvo",board);
			log.info(bd_id+"번 게시글 수정 완료");
			return "redirect:/board/read?bd_id="+bd_id;
		}else {
			log.info(bd_id+"번 게시글 수정 실패");
		}
		

		return "redirect:/board/read?bd_id="+bd_id;
	}
	
	
	@PostMapping("/remove")
	public String remove(BoardVO board) {
		log.info("remove..." + board);
		String bd_category2 = board.getBd_category2();
		service.remove(board.getBd_id());
		log.info("삭제완료..." + board + bd_category2);
		return "redirect:/board/list?bd_category2="+bd_category2+"&page=1";
	}
}
