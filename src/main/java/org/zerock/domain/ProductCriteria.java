package org.zerock.domain;

import lombok.Data;

@Data
public class ProductCriteria {
	
	private int page;
	private String serTitle; 
	private String order;
	private String category1;
	private String category2;
	private String admin; 

	private String[] serSet = new String[3];	
	private String category22;
	private int pagePerList;
	private int pagingCount;
	private int startPage;
	private int endPage;
	
	public ProductCriteria(int page) {
		
		pagePerList = 12;
		pagingCount = 10;		
		
		startPage = (page - 1) * pagePerList +1;
		endPage = startPage + pagePerList -1;
	}
	
	public void setCri(String category1, String category2) {
		this.category1 = category1;
		this.category2 = category2;
	}
	
	public void initCri() {
		if(order==null) {
			order = "registdate";
		}
		if(serTitle==null ) {
			serTitle="%%";
		}else {
			serTitle = "%"+serTitle+"%";
		}
		if(serTitle.equals("전체보기") ||serTitle.equals("all")){
			serTitle="%%";
			category22="전체보기";
		}
		if(category2==null) {
			category2="%%";
			category22="전체보기";
		}else {
			category2 = "%"+category2+"%";
		}
		if(category2.equals("전체보기")) {
			category2="%%";
			category22="전체보기";
		}
		if(category1 == null) {
			category1="%%";
		}else {
			category1 = "%"+category1+"%";
		}
		if(category1.equals("신상품")) {
			category1="new";
		}else if(category1.equals("할인상품")) {
			category1="sale";
		}
		else if(category1.equals("베스트")) {
			category1="best";
		}
	}
	
	
	
	
	
	
}
