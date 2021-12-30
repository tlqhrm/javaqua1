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
	private int startNum;
	private int endNum;
	
	public PagingDTO() {}
	
	public PagingDTO(int totalContent, int page, int pagePerList, int pagingCount) {
		this.totalContent = totalContent; //총 데이터 수
		this.page = page; //현제 페이지 숫자
		this.pagePerList = pagePerList; //한 화면에 보여줄 데이터 개수
		this.pagingCount = pagingCount; //한 화면에 보여줄 페이징 개수
		
		totalPage = totalContent/pagePerList;  // 최종 전체 페이지 갯수
		if(totalContent % pagePerList >0) {
			totalPage++; // 나머지가 있다면 1을 더해줌
		}
		
		//보여줄 데이터 범위 지정
		startNum = page*pagePerList-(pagePerList-1);
        endNum = startNum+(pagePerList-1); 
		
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
