package org.zerock.service;

import java.util.List;

import org.zerock.domain.ProductVO;
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductVO;
import org.zerock.domain.BoardCriteria;

public interface ProductService {
	public int register(ProductVO board);
	
	public ProductVO productDetail(int pd_num);
	
	public boolean modify(ProductVO board);
	
	public boolean remove(int pd_num);
	
	public int[] getPages(ProductCriteria cri);

	public List<ProductVO> getList(ProductCriteria cri);

}
