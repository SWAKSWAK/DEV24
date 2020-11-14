package com.dev24.common.pagination;

import lombok.Data;

@Data
public class Pagination {

	private int listRange;	// 한페이지에 출력될 도서의 개수
	private int range 			= 10;	// 한번에 숫자로 보여질 페이지 범위 -1(기본값 5)
	private int page; 					// 현재 목록의 페이지 번호
	private int startPage 		= 1;	// 각 페이지 범위 시작 번호 (기본값 1)
	private int endPage; 				// 각 페이지 범위 끝 번호 (기본값 5)
	private int pageLength; 			// 총 페이지 개수 (where절에 따라 가변)
	private int bookLength; 			// 전체 도서 개수 (where절에 따라 가변)
	private int startRownum; 			// 한페이지에 출력되는 첫번째 상품의 rownum
	private int lastRownum; 			// 한페이지에 출력되는 마지막 상품의 rownum
	private boolean prev; 				// 이전 페이지 여부
	private boolean next;				 // 다음 페이지 여부

	// 카테고리 조건에 맞춰서 페이징 출력을 하기 위함
	private int cateOne_num = 0; // 대분류 코드
	private int cateTwo_num = 0; // 소분류 코드
	
	// 정렬에 따라 츨력하기 위한 정보 (기본값 = "best")
	// dev24 / best / new / lowp / highp
	String sort = "best";
	
	/****************
	 * 등록/미등록/절판 여부를 판단하기 위한 필드
	 * b_state : ""     (모두 조회)
	 * b_state : "null" (등록상품만 조회)
	 * b_state : "unreg"(미등록 상품만 조회)
	 * b_state : "oop"  (out of print/절판 상품만 조회)
	 ****************/
	String b_state = "null";

	/******************************************************************
	 * 페이징 처리를 위한 메소드
	 * 
	 * @param bookLength  : 조건에 해당하는 책의 총 개수
	 * @param startPage   : 화면에 출력될 page 번호의 첫번째 값
	 * @param page        : 현재 페이지
	 * @param cateOne_num : 대분류 코드
	 * @param cateTwo_num : 소분휴 코드
	 ******************************************************************/
	public Pagination(int bookLength, int startPage, int page, int cateOne_num, int cateTwo_num, int listRange, String sort, String b_state) {
		this.page = page;
		this.listRange = listRange;
		this.b_state = b_state;

		// 한 페이지에 출력될 첫번째 상품 rownum
		// 예: 1페이지의 minRownum은 1이므로 (1-1)*10+1==1
		int startRownum = (page - 1) * 10 + 1;
		this.startRownum = startRownum;

		// 한페이지에 출력될 마지막 상품 rownum
		this.lastRownum = startRownum + listRange;

		// 전체 상품 개수
		this.bookLength = bookLength;

		// 페이지 길이
		if (bookLength%10 > 0)
			this.pageLength = bookLength / listRange + 1;
		else
			this.pageLength = bookLength / listRange;

		// QuerySring으로 startPage 값을 받았다면
		if (startPage != 0) {
			this.startPage = startPage;
		}
		
		if(startPage + range <= pageLength)
			this.endPage = startPage + range -1;
		else
			this.endPage = pageLength;
		
		// 이전버튼을 활성화 시킬지 여부
		// startRownum 이 1보다 낮으면 더이상 이전도서가 없다는 뜻
		if (startRownum - 1 < 1)
			this.prev = false;
		else
			this.prev = true;

		// 다음버튼을 활성화 시킬지 여부
		// lastRownum 이 bookLength보다 높으면 다음도서가 없다는 뜻
		if (lastRownum + 1 > bookLength)
			this.next = false;
		else
			this.next = true;

		// 카테고리에 맞게 조회하기 위해 pagination에 카테고리 코드 명시
		// 0일 경우 BookView.xml에서 where절이 작동하지 않음
		this.cateOne_num = cateOne_num;
		this.cateTwo_num = cateTwo_num;
	}
}
