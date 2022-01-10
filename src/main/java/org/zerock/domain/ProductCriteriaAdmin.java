package org.zerock.domain;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class ProductCriteriaAdmin {
	
	private int page;
	private String serTitle; 
	private String order;
	private String category1;
	private String category2;
	private String minPrice;
	private String maxPrice;
	private String minStock;
	private String maxStock;
	
	
	
	private String[] category1Arr;
	private int pagePerList;
	private int pagingCount;
	private int startPage;
	private int endPage;
	private String criSerTitle; 
	private String criCategory1;
	private String criCategory2;
	
	
	public ProductCriteriaAdmin() {}


	public void initCri(int pagePerList){
		
		criSerTitle = "^";
		criCategory1 = "^";
		
		

		if(category1Arr.length > 0) {
			log.warn(category1Arr);
			criCategory1 = "";
			for(int i=0; i<category1Arr.length; i++) {	
				if(i<category1Arr.length-1) {
					criCategory1 += category1Arr[i]+"|";
				}else {
					criCategory1 += category1Arr[i];
				}

			}
			
		}else {
			category1 = ";";
		}

		if(page > 0) {
			this.pagePerList = pagePerList;
			pagingCount = 10;		
			
			startPage = (page - 1) * pagePerList +1;
			endPage = startPage + pagePerList -1;
		}

		if(order == null || order.equals("")) {
			order = "registdate";
		}

		
		if(category2.equals("") || category2.equals("select")) {
			criCategory2 = "^";
		
		}else {
			criCategory2 = category2;
		}
		
		if(!serTitle.equals("")) {
			criSerTitle = serTitle;
		}
	}
	
	public void initCategory2() {
		if(category2.equals("금붕어")) {
			criCategory2 = "^랜덤 금붕어|^최상급 금붕어|^오란다|^난주|^점보|^진주린";
		}else if (category2.equals("베타/구라미")) {
			criCategory2 = "^랜덤 베타|^실물 베타|^야생 베타|^구라미";
		}else if (category2.equals("애완새우/달팽이")) {
			criCategory2 = "^생이새우|^비쉬림프|^패각류";
		}
	}
}
