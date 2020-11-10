package com.dev24.common.pagination;

import lombok.Data;

@Data
public class Pagination {
	
//	private int rangeSize = 5;		//한 페이지 범위에 보여질 페이지의 개수. 초기값으로 페이지범위를 5로 셋팅
//	private int range;				//각 페이지 범위 시작 번호 
//	private int startList;			//게시판 시작번호
	private int page;				//현재 목록의 페이지 번호
	private int startPage		= 1;//각 페이지 범위 시작 번호 (기본값 1)
	private int endPage			= 5;//각 페이지 범위 끝 번호 (기본값 5)
	private int pageLength;			//총 페이지 개수 (where절에 따라 가변)
	private int bookLength;			//전체 도서 개수 (where절에 따라 가변)
	private int listLength = 15;		//한 페이지당 보여질 리스트의 개수. 초기값으로 목록개수를 15로 셋팅
	private int lastRownum;			//한페이지에 출력되는 마지막 상품의 rownum
	private int startRownum;		//한페이지에 출력되는 첫번째 상품의 rownum
	private boolean prev;			//이전 페이지 여부
	private boolean next;			//다음 페이지 여부
//	
	private int cateOne_num = 0;
	private int cateTwo_num = 0;
	
	public void pagantion(int bookLength, int page, int cateOne_num, int cateTwo_num) {
		this.page = page;
		
		//한 페이지에 출력될 첫번째 상품 rownum
		//예: 1페이지의 minRownum은 1이므로 (1-1)*10+1==1
		int startRownum = (page-1)*10+1;
		this.startRownum = startRownum;
		
		//한페이지에 출력될 마지막 상품 rownum
		int lastRownum = page*10;
		this.lastRownum = lastRownum;
		
		//전체 상품 개수
		this.bookLength = bookLength;
		
		//페이지 길이
		this.pageLength = bookLength/10 + 1;
		
		//이전버튼을 활성화 시킬지 여부
		//startRownum 이 1보다 낮으면 더이상 이전도서가 없다는 뜻
		if (startRownum-1 < 1)
			this.prev = false;
		else
			this.prev = true;
		
		//다음버튼을 활성화 시킬지 여부
		//lastRownum 이 bookLength보다 높으면 다음도서가 없다는 뜻
		if (lastRownum+1 > bookLength)
			this.next = false;
		else
			this.next = true;
			
		//카테고리에 맞게 조회하기 위해 pagination에 카테고리 코드 명시
		//0일 경우 BookView.xml에서 where절이 작동하지 않음
		this.cateOne_num = cateOne_num;
		this.cateTwo_num = cateTwo_num;
	}
	
//	
//	/**
//	 * 페이지 정보 메서드
//	 * @param page : 페이지 정보
//	 * @param range : 현재 페이지 범위 정보
//	 * @param listCnt : 게시물의 총 개수
//	 */
//	public void pageInfo(int page, int range, int listCnt) {
//		
//		this.page = page;
//		this.range = range;
//		this.listCnt = listCnt;
//		
//		//전체 페이지 수  
//		//예: 889개의 상품 수를 10개씩 페이징 한다면 pageCnt 88.9에서 올림한 89가 되어야 한다. 
//		this.pageCnt = (int)Math.ceil(listCnt/listSize);
//		
//		//시작 페이지
//		this.startPage = (range - 1) * rangeSize + 1;
//		
//		//끝 페이지
//		this.endPage = range * rangeSize;
//		
//		//게시판 시작번호
//		this.startList = (page - 1) * listSize;
//		
//		//이전버튼 상태
//		this.prev = range == 1 ? false : true;
//		
//		//다음버튼 상태
//		this.next = endPage > pageCnt ? false : true;
//		if(this.endPage > this.pageCnt) {
//			this.endPage = this.pageCnt;
//			this.next = false;
//		}
//	}
	
}
