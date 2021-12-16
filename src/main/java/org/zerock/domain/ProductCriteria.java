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
					
					initCategory2();
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
	
	public void initCategory2() {
		if(category2.equals("금붕어")) {
			criCategory2 = "랜덤 금붕어||최상급 금붕어||오란다||난주||점보||진주린";
		}else if (category2.equals("베타/구라미")) {
			criCategory2 = "랜덤베타||실물베타||야생베타||구라미";
		}else if (category2.equals("애완새우/달팽이")) {
			criCategory2 = "생이새우||비쉬림프||패각류";
		}
	}
}
