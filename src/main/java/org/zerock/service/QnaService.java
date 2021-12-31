package org.zerock.service;

import java.util.List;

import org.zerock.domain.PagingDTO;
import org.zerock.domain.QnaVO;
import org.zerock.domain.ReviewVO;

public interface QnaService {
	public int write(QnaVO qvo);
	public int modify(QnaVO qvo);
	public int delete(QnaVO qvo);
	public List<QnaVO> qna_list(int pd_num,PagingDTO pdto);
	public int qna_cnt(int pd_num);
	public List<QnaVO> myqna(String user_id,PagingDTO pdto);
	public int myqna_cnt(String user_id);
	public QnaVO mywrite(QnaVO qvo);
}
