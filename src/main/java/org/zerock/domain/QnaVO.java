package org.zerock.domain;

import lombok.Data;

@Data
public class QnaVO {
	private int qna_num;
	private int pd_num;
	private String user_id;
	private String title;
	private String content;
	private String writedate;
	private String status;
	private String reply;
}
