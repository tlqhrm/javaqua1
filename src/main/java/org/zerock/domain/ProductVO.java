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
	
	
	public void pvoInit() {
		System.out.println(price);
		System.out.println(category1);
		System.out.println(file1);
		strPrice = Integer.toString(price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		strPrice2 = Integer.toString(price+((price*discount)/100)).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		
		
		try {
			file2 = (file1.split(";")[0]);
		} catch (Exception e) {
			file2 = ";";
		}
		
		category1Arr = category1.split(";");
	}
}
