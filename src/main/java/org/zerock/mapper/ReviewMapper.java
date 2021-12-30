package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.ReviewVO;

public interface ReviewMapper {
	public int write(ReviewVO rvo);
	public int modify(ReviewVO rvo);
	public int delete(ReviewVO rvo);
	public List<ReviewVO> review_list(@Param("pd_num") int pd_num, @Param("pdto") PagingDTO pdto);
	public int review_cnt(int pd_num);
	public ReviewVO mywrite(ReviewVO rvo);
}
