package org.zerock.domain;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class BoardCriteria {
	
	private int page;
	private String bd_category2;
	private String id;
	private String serName;
	private String serTitle; 
	private String serContent; 
	private String admin; 
	private String word;
	private String[] serBoard;
		
	private String checker;
	private String[] serSet = new String[3];	
	private int pagePerList;
	private int pagingCount;
	private int startPage;
	private int endPage;
	
	public BoardCriteria(int page, String[] serBoard, String word) {
		System.out.println("0"+this.page);
		this.page = page;
		System.out.println("1"+page);
		System.out.println("2"+this.page);
		this.page = 5;
		System.out.println("3"+this.page);
//		this.serBoard = serBoard;
		
		pagePerList = 10;
		pagingCount = 10;
		
		// 요청된 페이지에 따른 게시물 범위 지정
		startPage = (page - 1) * pagePerList +1;
		endPage = startPage + pagePerList -1;
		
		checker = "%"+word+"%";
		
		if(word == null || word.equals("")) {
			checker = null;
		}
		
		serName = "%쀍1a%";
		serTitle = "%쀍1a%";
		serContent = "%쀍1a%";
		
		try {
			for(int i=0; i<serBoard.length; i++) {
				if(serBoard[i].equals("serContent")) {
					serContent = "%"+word+"%";
				}else if(serBoard[i].equals("serTitle")) {
					serTitle = "%"+word+"%";
				}else if(serBoard[i].equals("serName")) {
					serName = "%"+word+"%";
				}
			}
			
		} catch (NullPointerException e) {
			log.info("검색조건없음");
		}
		
		if(serName.equals("%쀍1a%") && serTitle.equals("%쀍1a%") && serContent.equals("%쀍1a%")) {
			serName = "%%";
			serTitle = "%%";
			serContent = "%%";
		}

		serSet[0] = serName;
		serSet[1] = serTitle;
		serSet[2] = serContent;

	}
	
	
	
	
	
	
}
