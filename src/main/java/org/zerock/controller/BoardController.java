package org.zerock.controller;


import java.io.File;
import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ReplyVO;
import org.zerock.etc.ImagePath;
import org.zerock.service.BoardService;
import org.zerock.service.ReplyService;

import com.google.gson.Gson;

import org.zerock.domain.BoardCriteria;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	@Autowired
	private BoardService bdService;
	@Autowired
	private ReplyService reService;


	
	@GetMapping("/boardWriteForm")
	public String writeBoardForm(BoardVO bvo, Model model) {		
		log.info("writeBoardForm............ " );
		
		model.addAttribute("bvo",bvo);
		return "/board_write.jsp";
	}
	
	
	@PostMapping("/boardWrite")
	public String writeBoard(BoardVO bvo, Model model,@Nullable @SessionAttribute("admin") String admin, MultipartFile file , HttpServletRequest request) {		
		String path = ImagePath.get();
		bvo.setUser_id(request.getRemoteUser());
				
		if(admin == null) admin = "0";
		Map map;
		log.info(path);
		log.info("-----------------------");
		log.info("Upload File Name: "+file.getOriginalFilename());
		log.info("Upload File Size: "+file.getSize());
		if(file.getSize() > 0) {
			log.info(file);
			String uuid = UUID.randomUUID().toString();
			String fileName = uuid+file.getOriginalFilename();
			System.out.println(fileName);
			bvo.setFile1(fileName);
			
			File saveFile = new File(path+"board", fileName);
						
			log.info("/write.....");
			
			
			map = bdService.insertBoard(bvo,admin);
			if((int)map.get("result") == 1) {
				try {
					file.transferTo(saveFile);
				}catch (Exception e) {
					log.error(e.getMessage());
				}
			}
		}else {
			log.info(bvo);
			map = bdService.insertBoard(bvo,admin);
		}
		int bd_id = (int) map.get("bd_id");
				

		return "redirect:/board/readBoard?bd_id="+bd_id;

		
	}
	
	@GetMapping("/readBoard")
	public String readBoard(int bd_id ,Model model, Integer page, String test, HttpServletRequest request) {		
		String ip = request.getRemoteAddr();

		if(page == null) {
			page = 1;
		}
			
		log.info("read:" + bd_id);
		
		BoardVO bvo = bdService.readBoard(bd_id,ip);
		
		List<ReplyVO> commentList = reService.getReplyList(bd_id);
		
		model.addAttribute("id",request.getRemoteUser());
		model.addAttribute("bvo",bvo);
		model.addAttribute("page",page);
		model.addAttribute("commentList",commentList);
		
		return "/board_detail.jsp";
	}
	
	@GetMapping("/boardList")
	public String listBoard(BoardCriteria cri,@Nullable @SessionAttribute("admin") String admin,Model model, HttpServletRequest request) {
		
		log.info(cri.getBd_category2()+" List");
		List<BoardVO> list = new ArrayList<>();
		int[] paging = new int[3];
		if(admin == null) admin = "0";
		cri.setAdmin(admin);					
		cri.setId(request.getRemoteUser());
		
		list = bdService.getBoardList(cri);
		paging = bdService.getPages(cri);
		
		log.info(paging);
		model.addAttribute("paging", paging);
		model.addAttribute("bdList", list);
		model.addAttribute("bdCri", cri);

		return "/board_list.jsp";
	}
	
	
	@PostMapping("/boardUpdateForm")
	public String modifyBoardForm(BoardVO bvo,Model model) {
		log.info("modifyForm:" + bvo);

		model.addAttribute("bvo",bvo);
		return "/board_update.jsp";
	}
	
	@PostMapping("/boardUpdate")
	public String modifyBoard(BoardVO bvo,Model model, MultipartFile file) {
		log.info("modify:" + bvo);
		
		String path = ImagePath.get();		
		String ogFileName = bvo.getFile1();
		File ogFile = new File(path+"board\\"+ogFileName);		
		String fileName = null;
		String uuid = UUID.randomUUID().toString();
		if(file.getSize() > 0) {
			log.warn(file);
			log.warn(bvo.getFile1());
			log.warn(bvo.getFile1().length());
			System.out.println("---------------"+ogFileName);
			 fileName = uuid+file.getOriginalFilename();
			bvo.setFile1(fileName);
		}
		int bd_id = bvo.getBd_id();		
		boolean result = bdService.updateBoard(bvo);
		
		if(result) {
		
			if(file.getSize() > 0) {
					
			
			log.info("-----------------------");
			log.info("Upload File Name: "+fileName);
			log.info("Upload File Size: "+file.getSize());
			bvo.setFile1(file.getOriginalFilename());
			File saveFile = new File(path+"board", fileName);
			
				try {
					file.transferTo(saveFile);
					
					if (ogFile.exists()) {

					      if (ogFile.delete()){

					        log.info("기존 파일 삭제  : "+ogFileName);

					      }else{
					    	  log.info("파일 삭제 실패");
					      }
					}
				}catch (Exception e) {
					log.error(e.getMessage());
				}		
			}
			else {
				log.info("파일변경 X");
			}	
			
			model.addAttribute("bvo",bvo);
			log.info(bd_id+"번 게시글 수정 완료");
			return "redirect:/board/readBoard?bd_id="+bd_id;
		}else {
			log.info(bd_id+"번 게시글 수정 실패");
			return "redirect:/board/readBoard?bd_id="+bd_id;
		}
			
	}
	
	@PostMapping("/deleteBoard")
	public String remove(BoardVO bvo, HttpServletRequest request) {
		log.info("remove..." + bvo);
		bdService.deleteBoard(bvo.getBd_id());
			
		String file_name = bvo.getFile1();

		if(file_name.length() > 0){
			
			String path = ImagePath.get();
		
			File file = new File(path+"board\\"+file_name);
			
			if (file.exists()) {

			      if (file.delete()){

			        log.info("파일 삭제 성공 : "+file_name);

			      }else{
			    	  log.info("파일 삭제 실패");
			      }
			}
		}else{
		    
			log.info("삭제 할 파일이 없습니다.");
		}
		
		int deleteReply = reService.deleteReplyAll(bvo.getBd_id());
		
		if(deleteReply > 0) {
			log.info("댓글 "+deleteReply+"개 삭제 성공");
		}else {
			log.info("삭제 할 댓글 없음");
		}
				
		return "redirect:/board/boardList?bd_category2=contact&page=1";
	}
	
	@ResponseBody
	@PostMapping("/noticeList")
	public List<BoardVO> noticeList(){
		
		 List<BoardVO>result = bdService.noticeList();
		log.warn(result);
		return result;
		
	}
}
