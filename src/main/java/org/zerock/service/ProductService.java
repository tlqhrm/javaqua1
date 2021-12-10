package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductVO;
import org.zerock.domain.BoardCriteria;

public interface ProductService {
	public int register(BoardVO board);
	
	public BoardVO get(int bd_id);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(int bd_id);
	

	
	public int[] getPages(ProductCriteria cri);

	public List<ProductVO> getList(ProductCriteria cri);

}
