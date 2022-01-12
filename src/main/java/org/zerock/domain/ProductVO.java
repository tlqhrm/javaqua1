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
	int salescount;
	String registdate;

	
	String[] category1Arr;
	String[] file1Arr;
	int price2;
	String strPrice;
	String strPrice2;
	String file_names2;

	
	public void pvoInit() {
		

		if(discount > 0) {
			price2= (int) Math.ceil(price / (1 - (((double)discount) / 100))) ;
			strPrice2 = Integer.toString(price2).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		}
		if(price != 0) {
			strPrice = Integer.toString(price).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
		}

		
		if(file1 != null) {
			file1Arr = file1.split(";");
		}
		
		if(category1 != null) {
		category1Arr = category1.split(";");
		}
		
		
		if(file_names2 != null) {
			System.out.println("-----------------"+file_names2);
			file1Arr = file_names2.split(";");
		}
//		
//		if(file1Arr == null) {
//			file1Arr = new String [1];
//		}


	}
	
	public void setCategory1() {
		if(category1Arr.length > 0) {
			 category1= "";
			for(String c1 : category1Arr) {
				category1 += c1+";";
			}
		}else{
			category1 = ";";
		}
	}

}
