package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bd_id;
	private int bd_num;
	private String user_id;
	private String title;
	private String content;
	private String writeDate;
	private String updateDate;
	private int reply;
	private String file1;
	private int group_num;
	private int step;
	private int indent;
	private int hit;
	private String bd_category1;
	private String bd_category2;
	private String status;
	
}
