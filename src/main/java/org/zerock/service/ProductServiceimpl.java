package org.zerock.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductVO;
import org.zerock.domain.BoardCriteria;
import org.zerock.domain.PagingDTO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class ProductServiceimpl implements ProductService {
	

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Override
	public int register(BoardVO board) {
		
		log.info("register......" + board);
		
		return mapper.insert(board);
	}

	@Override
	public BoardVO get(int bd_id) {

		log.info("get........" + bd_id);
		
		mapper.updateCount(bd_id);
		
		return mapper.read(bd_id);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify......" + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(int bd_id) {
		log.info("remove......" + bd_id);
		return mapper.delete(bd_id) == 1;
	}

	@Override
	public List<ProductVO> getList(ProductCriteria cri) {
		
		log.info("getList.........");
		
		return mapper.getList(cri);
	}
	
	@Override
	public int[] getPages(ProductCriteria cri) {
		
		log.info("getPages.........");
		
		int page = cri.getPage();
		int pagePerList = cri.getPagePerList();
		int pagingCount = cri.getPagingCount();
			
		int totalContnet = mapper.paging(cri);
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, pagingCount);
		return pdto.getStartEnd();
	}


	
}
