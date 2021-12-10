package org.zerock.domain;

import lombok.Data;

@Data
public class PagingDTO {
	
	private int page;
	private int[] startEnd = new int[3];
	private int totalContent;
	private int totalPage;
	private int startPage;
	private int endPage;
	private int pagePerList;
	private int pagingCount;
	
	public PagingDTO() {}
	
	public PagingDTO(int totalContent, int page, int pagePerList, int pagingCount) {
		this.totalContent = totalContent;
		this.page = page;
		this.pagePerList = pagePerList;
		this.pagingCount = pagingCount;
		
		totalPage = totalContent/pagePerList;  // 최종 전체 페이지 갯수
		if(totalContent % pagePerList >0) {
			totalPage++; // 나머지가 있다면 1을 더해줌
		}
		
		// 페이징 범위 계산
		 // 시작과 끝 페이지
		startPage = ((page - 1) / pagingCount) * pagingCount + 1;
		endPage = startPage + pagingCount - 1; 
		
		if (endPage > totalPage) {  
			endPage = totalPage;    
		}
		
		// 결과를 전달해줄 배열
		startEnd[0] = startPage;
		startEnd[1] = endPage;
		startEnd[2] = totalPage;
	}

	
}	
