package org.zerock.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.zerock.domain.BoardCriteria;
import org.zerock.domain.BoardVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.OrderDetailVO;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductCriteriaAdmin;
import org.zerock.domain.ProductVO;
import org.zerock.domain.QnaVO;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.ReviewVO;
import org.zerock.etc.ImagePath;
import org.zerock.service.AdminService;
import org.zerock.service.BoardService;
import org.zerock.service.ProductService;
import org.zerock.service.ReplyService;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor

public class AdminController {

	@Autowired
	private AdminService adminservice;
	@Autowired
	private ProductService productService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	
	@GetMapping(value = {"/member",""})
	public String member() {
		log.info("member............" );
		return "/admin/member/member.jsp";
	}
	@GetMapping("/member/member_detail")
	public String member_detail() {
		log.info("member_detail............" );
		return "/admin/member/member_detail.jsp";
	}
	@GetMapping("/product")
	public String product() {
		log.info("product............" );
		return "/admin/product/product.jsp";
	}
	@GetMapping("/order")
	public String order() {
		log.info("order............" );
		return "/admin/order/order.jsp";
	}
	@GetMapping("/board/notice")
	public String notice() {
		log.info("notice............" );
		return "/admin/board/notice.jsp";
	}
	@GetMapping("/board/faq")
	public String faq() {
		log.info("faq............" );
		return "/admin/board/faq.jsp";
	}
	@GetMapping("/board/contact")
	public String contact() {
		log.info("contact............" );
		return "/admin/board/contact.jsp";
	}
	@GetMapping("/board/review")
	public String review() {
		log.info("review............" );
		return "/admin/board/review.jsp";
	}
	@GetMapping("/board/qna")
	public String qna() {
		log.info("qna............" );
		return "/admin/board/qna.jsp";
	}
	@GetMapping("/board/qna_reply")
	public String qna_reply() {
		log.info("qna_reply............" );
		return "/admin/board/qna_reply.jsp";
	}
	
	@ResponseBody
	@PostMapping("/member_list")
	public List<Object> member_list(int page, int pagePerList) {
		int totalContnet = adminservice.member_cnt();
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 10);
		List<MemberVO> member_list = adminservice.member_list(pdto);		
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(member_list);
		rs.add(pdto);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/selectMember")
	public MemberVO selectMember(String user_id) {	
		log.info("selectMember...."+ user_id);
		MemberVO mvo = adminservice.selectMember(user_id);	
		log.info(mvo);
		return mvo;
	}
	
	@ResponseBody
	@PostMapping("/product_list")
	public List<Object> product_list(String cri) throws JsonParseException, JsonMappingException, IOException {
		
		
		log.warn(cri);
		List<ProductVO> list = new ArrayList<>();
		int[] paging = new int[3];
		
		ObjectMapper objectMapper = new ObjectMapper();

		ProductCriteriaAdmin criAdmin = objectMapper.readValue(cri, ProductCriteriaAdmin.class);


		criAdmin.initCri(20);

		
		list = productService.getListAdmin(criAdmin); 
		for(ProductVO lst : list) {
			lst.pvoInit();
		}
		log.info(cri);
		paging = productService.getPagesAdmin(criAdmin);
		
		
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(list);
		rs.add(paging);
		rs.add(criAdmin);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/product_detail")
	public ProductVO product_detail(int pd_num) {
		log.info("product_detail............" );
		ProductVO pvo = adminservice.product_detail(pd_num);	
		return pvo;
	}
	
	@ResponseBody
	@PostMapping("/order_list")
	public List<Object> order_list(int page, int pagePerList) {
		log.info("order_list............" );
		int totalContnet = adminservice.order_cnt();
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 10);
		List<OrderDetailVO> order_list = adminservice.order_list(pdto);		
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(order_list);
		rs.add(pdto);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/status_change")
	public String status_change(int odt_num,String odt_status) {
		log.info("status_change............" );
		if(adminservice.status_change(odt_num,odt_status) != 0) {
			return "200";
		}else {
			return "500";
		}
	}
	@GetMapping("/readBoard")
	public String readBoard(int bd_id ,Model model, Integer page, String test, HttpServletRequest request) {
		
		String ip = request.getRemoteAddr();

		if(page == null) {
			page = 1;
		}

		
		log.info("read:" + bd_id);
		
		BoardVO bvo = boardService.readBoard(bd_id,ip);
		
		List<ReplyVO> commentList = replyService.getReplyList(bd_id);
		model.addAttribute("id",request.getRemoteUser());
		model.addAttribute("bvo",bvo);
		model.addAttribute("page",page);
		model.addAttribute("commentList",commentList);
		

		return "/admin/board/board_detail_admin.jsp";
	}
	@GetMapping("/boardWriteForm")
	public String writeBoardForm(BoardVO bvo,Model model, HttpServletRequest request) {
		
		bvo.setUser_id(request.getRemoteUser());
		log.info("writeBoardForm............ ");
		
		model.addAttribute("bvo",bvo);
		return "/admin/board/board_write_admin.jsp";
	}
	@PostMapping("/boardUpdateForm")
	public String modifyBoardForm(BoardVO bvo,Model model) {
		log.info("modifyForm:" + bvo);
				
		model.addAttribute("bvo",bvo);
		return "/admin/board/board_update_admin.jsp";
	}
	@ResponseBody
	@PostMapping("/notice_list")
	public List<Object> notice_list(int page, int pagePerList, BoardCriteria cri, @Nullable @SessionAttribute("admin") String admin) {
		log.info("notice_list............" );
		int totalContnet = adminservice.notice_cnt();
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 10);
		List<BoardVO> notice_list = adminservice.notice_list(pdto);		
		
		List<BoardVO> list = new ArrayList<>();
		int[] paging = new int[3];
		if(admin == null) admin = "0";
		cri.setAdmin(admin);	

		list = boardService.getBoardList(cri);
		paging = boardService.getPages(cri);
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(notice_list);
		rs.add(pdto);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/faq_list")
	public List<Object> faq_list(int page, int pagePerList) {
		log.info("faq_list............" );
		int totalContnet = adminservice.faq_cnt();
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 10);
		List<BoardVO> faq_list = adminservice.faq_list(pdto);		
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(faq_list);
		rs.add(pdto);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/contact_list")
	public List<Object> contact_list(int page, int pagePerList, String status) {
		log.info("contact_list............" +status);
		int totalContnet = adminservice.contact_cnt(status);
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 10);
		List<BoardVO> contact_list = adminservice.contact_list(pdto,status);		
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(contact_list);
		rs.add(pdto);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/review_list")
	public List<Object> review_list(int page, int pagePerList) {
		log.info("review_list............" );
		int totalContnet = adminservice.review_cnt();
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 10);
		List<ReviewVO> review_list = adminservice.review_list(pdto);		
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(review_list);
		rs.add(pdto);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/qna_list")
	public List<Object> qna_list(int page, int pagePerList) {
		log.info("qna_list............" );
		int totalContnet = adminservice.qna_cnt();
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, 10);
		List<QnaVO> qna_list = adminservice.qna_list(pdto);		
		
		List<Object> rs = new ArrayList<Object>();
		rs.add(qna_list);
		rs.add(pdto);
		return rs;
	}
	
	@ResponseBody
	@PostMapping("/qnaReply")
	public String qnaReply(int qna_num, String reply) {
		log.info("qnaReply............" );
		
		if(adminservice.qnaReply(qna_num,reply)!=0) {
			return "200";
		}else {
			return "500";
		}
	}
	@ResponseBody
	@PostMapping("/deleteBoard")
	public String remove(BoardVO bvo, HttpServletRequest request) {
		log.info("remove..." + bvo);
		boolean result = boardService.deleteBoard(bvo.getBd_id());
			
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
		
		int deleteReply = replyService.deleteReplyAll(bvo.getBd_id());
		
		if(deleteReply > 0) {
			log.info("댓글 "+deleteReply+"개 삭제 성공");
		}else {
			log.info("삭제 할 댓글 없음");
		}
		
		if(result) {
			return "삭제 되었습니다.";
		}else {
			return "삭제 실패했습니다.";
		}
	}
}
