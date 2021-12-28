package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ReviewVO;

public interface ReviewMapper {
	public int write(ReviewVO rvo);
	public List<ReviewVO> review_list(@Param("pd_num") int pd_num, @Param("startNum") int startNum, @Param("endNum") int endNum);
	public int review_cnt(int pd_num);
}
