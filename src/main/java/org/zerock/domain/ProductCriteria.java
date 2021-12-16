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
	private String criSerTitle; 
	private String criCategory1;
	private String criCategory2;
	
	public ProductCriteria(int page) {
		
		pagePerList = 12;
		pagingCount = 10;		
		
		startPage = (page - 1) * pagePerList +1;
		endPage = startPage + pagePerList -1;
	}

	public void initCri(){
		if(order == null) {
			order = "registdate";
		}

		criSerTitle = "^";
		criCategory1 = "^";
		criCategory2 = "^";
		
		if( serTitle==null || serTitle.equals("null") || serTitle.equals("")){
			if(category1 ==null || category1.equals("null") || category1.equals("") ) {		
				if(category2 ==null || category2.equals("null") || category2.equals("")) {
					listTitle = "전체보기";
				}else {
					criCategory2 = category2;
					listTitle = category2;
				}
			}else {
				criCategory1 = category1; 
				
				if(category1.equals("new")) {
					listTitle = "신상품";
				}else if(category1.equals("best")) {
					listTitle = "베스트";
				}else if (category1.equals("sale")) {
					listTitle = "할인상품";
				}
			}
		}else {
			criSerTitle = serTitle;
			listTitle = "'"+serTitle+"' 검색결과";
		}
	}
}
