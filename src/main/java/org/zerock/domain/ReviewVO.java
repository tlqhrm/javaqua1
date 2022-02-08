package org.zerock.domain;

import lombok.Data;

@Data
public class ReviewVO {
	private int rv_num;
	private int pd_num;
	private String user_id;
	private String content;
	private String writedate;
	private String title;
	private String file1;
}
