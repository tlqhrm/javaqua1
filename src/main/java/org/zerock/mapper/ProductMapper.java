package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ProductCriteria;
import org.zerock.domain.ProductVO;
import org.zerock.domain.BoardCriteria;

public interface ProductMapper {

//		@Select("select * from tbl_board where bno > 0")
//		@Select("SELECT sysdate from dual")
		public int paging(ProductCriteria cri);
	
		public List<ProductVO> getList(ProductCriteria cri);
			
		public String getTime();
						
		public int insert(BoardVO board);
		
		public void insertSelectKey(BoardVO board);
		
		public BoardVO read(int bd_id);
		
		public int delete(int bd_id);
		
		public int update(BoardVO board);
		
		public int updateCount(int bd_id);
}
