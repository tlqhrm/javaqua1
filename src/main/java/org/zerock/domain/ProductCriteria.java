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
	private String listTitle;
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

	public void initCri() {
		if(order==null) {
			order = "registdate";
		}
		if(serTitle==null ) {
			serTitle="";
		}
		if(category2==null) {
			category2="^";
		}
		
		
		
		if(category1 == null) {
			category1="%%";
		}else {
			category1 = "%"+category1+"%";
		}
		if(category1.equals("%신상품%")) {
			category1="%new%";
		}else if(category1.equals("%할인상품%")) {
			category1="%sale%";
		}
		else if(category1.equals("%베스트%")) {
			category1="%best%";
		}
		else if(category1.equals("%전체보기%")) {
			category1="%%";
		}
		
	}
	
	public void initCri2() {
		if(category1.equals("%new%")) {
			category1="신상품";
		}else if(category1.equals("%sale%")) {
			category1="할인상품";
		}
		else if(category1.equals("%best%")) {
			category1="베스트";
		}
		else if(category1.equals("%전체보기%")) {
			category1="전체보기";
		}
		else if(category1.equals("%%")) {
			category1="전체보기";
		}
	}
	
	
	public void initCri3() {
		if( serTitle.equals("null") || serTitle==null){
			if(category1.equals("null") || category1 ==null) {
				if(category1.equals("null") || category1 ==null) {
					listTitle = "전체보기";
				}
			}else {
				listTitle = category1;
			}
		}else {
			listTitle = "'"+serTitle+"' 검색결과";
		}
	}
}
