package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductVO;
import org.zerock.domain.ReviewVO;

public interface ProductMapper {

//		@Select("select * from tbl_board where bno > 0")
//		@Select("SELECT sysdate from dual")
		public int paging(ProductCriteria cri);
	
		public List<ProductVO> getList(ProductCriteria cri);
			
		public String getTime();
						
		public int insert(ProductVO board);
		
		public void insertSelectKey(ProductVO board);
		
		public ProductVO productDetail(int pd_num);
		
		public int delete(int pd_num);
		
		public int update(ProductVO board);
		
		public int updateCount(int pd_num);

		public int productRegist(ProductVO pvo);

		public int productUpdate(ProductVO pvo);

		public int stockChk(@Param("pd_num") int pd_num, @Param("cart_amount") int cart_amount);

		public int productDelete(int pd_num);
		
}
