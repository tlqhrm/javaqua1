package org.zerock.domain;

import lombok.Data;

@Data
public class CartVO {
	private int cart_num;
	private int pd_num;
	private String title;
	private int price;
	private int amount;
	private String user_id;
	private String file1;
}
