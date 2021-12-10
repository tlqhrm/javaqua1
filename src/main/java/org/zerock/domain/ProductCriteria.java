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
	
	public void setCri(String serTitle, String order, String category1, String category2) {
		this.serTitle = serTitle;
		this.order = order;
		this.category1 = category1;
		this.category2 = category2;
	}
	
	
	
	
	
	
}
