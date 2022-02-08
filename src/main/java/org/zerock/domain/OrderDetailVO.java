package org.zerock.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	private int odt_num;
	private int pd_num;
	private int od_num;
	private String user_id;
	private int amount;
	private int price;
	private String orderdate;
	private String odt_status;
	private String title;
	private String file1;
	private String review;
}
