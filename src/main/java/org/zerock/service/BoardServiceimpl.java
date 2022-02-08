package org.zerock.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.BoardCriteria;
import org.zerock.domain.PagingDTO;
import org.zerock.mapper.BoardMapper;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.BeanUtil;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class BoardServiceimpl implements BoardService {
	

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	@Override
	public Map insertBoard(BoardVO board, String admin) {
		
		log.info("register......" + board);
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map map = objectMapper.convertValue(board, Map.class);
		
		map.put("admin", admin);
		
		
		System.out.println(admin);
		System.out.println(board.getBd_category2());
		int result = mapper.insertBoard(map);
		
		map.put("result",result);

		System.out.println(map.get("admin"));
		System.out.println(map.get("bd_category2"));
		
		if(board.getGroup_num() > 0) {
		mapper.increseStep(board);
		}
		return map;
	}

	@Override
	public BoardVO readBoard(int bd_id, String ip) {

		log.info("get........" + bd_id);
		
		
		Map<String,Object> map = new HashMap();
		
		map.put("bd_id", bd_id);
		map.put("ip",ip);
		
		if(mapper.boardHitCheck(map) == 0) {
			mapper.increseHit(bd_id);
			mapper.insertBoardHit(map);
		}
		return mapper.readBoard(bd_id);
	}

	@Override
	public List<BoardVO> getBoardList(BoardCriteria cri) {
		
		log.info("getList.........");
		
		
		
		return mapper.getBoardList(cri);
	}
	
	@Override
	public int[] getPages(BoardCriteria cri) {
		
		log.info("getPages.........");
		
		int page = cri.getPage();
		int pagePerList = cri.getPagePerList();
		int pagingCount = cri.getPagingCount();
		
		
		int totalContnet = mapper.paging(cri);
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, pagingCount);
		return pdto.getStartEnd();
	}
	
	@Override
	public boolean updateBoard(BoardVO board) {
		
		log.info("modify......" + board);
		return mapper.updateBoard(board) == 1;
	}

	@Override
	public int intcreseReply(int bd_id) {
		
		return mapper.increseReply(bd_id);
	}
	
	@Override
	public int minusReply(int bd_id) {
		
		return mapper.minusReply(bd_id);
	}
	

	@Override
	public boolean deleteBoard(int bd_id) {
		log.info("remove......" + bd_id);
		return mapper.deleteBoard(bd_id) == 1;
	}

	@Override
	public int changeBoardStatus(BoardVO bvo) {
		
			
		return mapper.changeBoardStatus(bvo);
	}

	@Override
	public List<BoardVO> noticeList() {
		
		return mapper.noticeList();
	}
	
}
