package com.dev24.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CommonVO {
	
	/*검색항목을 설정해주기 위한 변수 책제목, 작가명, 등등 (<select id="search" name="search">) 와 같은 jsp 태그에서 참조한다.
	 * select 박스에서 각자의 option 에 값을 지정해주고 그 다음 우리가 만든 mapper.xml 에 설정을 해주면 된다. stock.xml 참조. 
	*/
	private String search="";
	
	/*
	 * 검색단어를 지정해주는 변수 
	*/
	private String keyword="";
	
	/*stock.jsp 에서 중분류별 검색으로 활용하기 위해 선언된 변수 stock.xml 에서 매핑을 하기 위해 있다*/
	private String category="";
	
	
	private String date_start = ""; // 기본값 sysdate
	private String date_end = ""; // 기본값sysdate
	
	private String refundCheck = ""; // 환불여부 기준
	
}
