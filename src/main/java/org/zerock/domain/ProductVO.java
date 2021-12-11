package org.zerock.domain;

import lombok.Data;

@Data
public class ProductVO {
	int pd_num;
	String category1;
	String category2;
	String title;
	int price;
	String content;
	String file1;
	int stock;
	int readcount;
	int discount;
	int salesount;
	String registdate;

	
	String[] category1Arr;
	String[] file1Arr;
	String file2;
	String content2;
	int price2;
	String strPrice;
	String strPrice2;
	
	
	public ProductVO(int price,String category1, String file1) {
		this.strPrice = Integer.toString(price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		this.strPrice2 = Integer.toString(price+((price*discount)/100)).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		try {
			this.file2 = (file1.split(";")[0]);
		} catch (Exception e) {
			this.file2 = ";";
		}
		
		this.category1Arr = category1.split(";");
	}
}
