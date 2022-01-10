package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductCriteriaAdmin;
import org.zerock.domain.ProductVO;
import org.zerock.domain.ReviewVO;
import org.zerock.mapper.ProductMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class ProductServiceimpl implements ProductService {
	

	@Setter(onMethod_ = @Autowired)
	private ProductMapper mapper;
	
	@Override
	public int register(ProductVO pvo) {
		
		log.info("register......" + pvo);
		
		return mapper.insert(pvo);
	}

	@Override
	public ProductVO productDetail(int pd_num) {

		log.info("get........" + pd_num);
		
		mapper.updateCount(pd_num);
		
		return mapper.productDetail(pd_num);
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

	@Override
	public int productRegist(ProductVO pvo) {
		int result = mapper.productRegist(pvo);
		return result;
	}

	@Override
	public int productUpdate(ProductVO pvo) {
		int result = mapper.productUpdate(pvo);
		return result;
	}

	@Override
	public int productDelete(int pd_num) {

		int result = mapper.productDelete(pd_num);
		return result;
	}

	@Override
	public List<ProductVO> getIndexList(ProductCriteria cri) {
		// TODO Auto-generated method stub
		return mapper.getIndexList(cri);
	}

	@Override
	public List<ProductVO> getListAdmin(ProductCriteriaAdmin cri) {
			log.info("getList.........");
		
		return mapper.getListAdmin(cri);
	}

	@Override
	public int[] getPagesAdmin(ProductCriteriaAdmin cri) {
		log.info("getPages.........");
		
		int page = cri.getPage();
		int pagePerList = cri.getPagePerList();
		int pagingCount = cri.getPagingCount();
			
		int totalContnet = mapper.pagingAdmin(cri);
		PagingDTO pdto = new PagingDTO(totalContnet, page, pagePerList, pagingCount);
		return pdto.getStartEnd();
	}

	@Override
	public int productUpdateAll(List<ProductVO> data) {
		int result = 0;
		for(ProductVO pvo : data) {
			mapper.productUpdateAll(pvo);
			result ++;
		}
		
		return result;
	}



}
