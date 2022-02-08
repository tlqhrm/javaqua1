package org.zerock.domain;

import lombok.Data;

@Data
public class Order1VO {
	private int od_num;
	private String user_id;
	private String orderdate;
	private String od_status;
	private int totalprice;
}
