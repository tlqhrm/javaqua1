package org.zerock.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.BoardService;
import org.zerock.service.ReplyService;

import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping(value= "/reply/*", produces = "application/text; charset=UTF-8")
@AllArgsConstructor
@Log4j
public class ReplyController {
	
	@Autowired
	private ReplyService reService;
	@Autowired
	private BoardService bdService;
	
	@PostMapping("/insertReply")
	public String insertReply(ReplyVO rvo, @SessionAttribute int admin, BoardVO bvo) {
		
		String result = Integer.toString(reService.insertReply(rvo));
		
		System.out.println(result);
		if(result.equals("1")) {
			bdService.intcreseReply(rvo.getBd_id());
		}
		if(bvo.getBd_category2().equals("contact")) {
			if(admin == 1) {
				bvo.setStatus("[답변완료]");
				bdService.changeBoardStatus(bvo);
			}else {
				bvo.setStatus("[답변대기]");
				bdService.changeBoardStatus(bvo);
			}
		}
		log.info(result);
		return result;
		
	}
	
	@PostMapping("/updateReply")
	public String updateReply(ReplyVO rvo) {
		
		String result = Integer.toString(reService.updateReply(rvo));
		
		return result;
	}
	
	@PostMapping("/getReplyList")
	public String getReplyList(int bd_id, Model model) {
		
		log.info(bd_id);
		List<ReplyVO> commentList = new ArrayList<>(reService.getReplyList(bd_id));
		String result = new Gson().toJson(commentList);
//		System.out.println(result);
	
		return result;
		           
	}
	
	@PostMapping("/deleteReply")
	public String deleteReply(int re_num, int bd_id) {
		
		String result = Integer.toString(reService.deleteReply(re_num));
		if(result.equals("1")) {
			bdService.minusReply(bd_id);
		}
		
		return result;
	}
	
	@PostMapping("/deleteReplyAll")
	public int deleteReplyAll(int bd_id) {
		
		int result = reService.deleteReplyAll(bd_id);
		
		return result;
	}
}
