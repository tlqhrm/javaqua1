package org.zerock.service;

import java.util.List;

import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductVO;
import org.zerock.domain.ReviewVO;

public interface ProductService {
	public int register(ProductVO board);
	
	public ProductVO productDetail(int pd_num);

	public int[] getPages(ProductCriteria cri);

	public List<ProductVO> getList(ProductCriteria cri);

	public int productRegist(ProductVO pvo);

	public int productUpdate(ProductVO pvo);

	public int productDelete(int pd_num);

	public List<ProductVO> getIndexList(ProductCriteria cri);

}
