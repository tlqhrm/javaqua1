package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.PagingDTO;
import org.zerock.domain.QnaVO;

public interface QnaMapper {
	public int write(QnaVO qvo);
	public int modify(QnaVO qvo);
	public int delete(QnaVO qvo);
	public List<QnaVO> qna_list(@Param("pd_num") int pd_num, @Param("pdto") PagingDTO pdto);
	public int qna_cnt(int pd_num);
	public List<QnaVO> myqna(@Param("user_id") String user_id, @Param("pdto") PagingDTO pdto);
	public int myqna_cnt(String user_id);
	public QnaVO mywrite(QnaVO qvo);
}
