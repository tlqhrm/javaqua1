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
	String file_names2;
	String[] files2;
	
	public void pvoInit() {
		strPrice = Integer.toString(price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		strPrice2 = Integer.toString(price+((price*discount)/100)).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		
		if(file1 != null) {
			file1Arr = file1.split(";");
//			for(String file1 : file1Arr) {
//				System.out.println(file1);
//			}
			System.out.println("123123123--------"+file1Arr[0]);
		}
		
		if(category1 != null) {
		category1Arr = category1.split(";");
		}
		
		
		if(file_names2 != null) {
			file1Arr = file_names2.split(";");

		}
	
	}
}
