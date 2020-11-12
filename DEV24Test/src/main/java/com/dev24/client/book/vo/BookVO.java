package com.dev24.client.book.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

/*
 * equals와 hashCode 메소드 자동 생성 시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true 부모 클래스 필드 값들도 동일 한지 체크
 * callSuper = false 부모 클래스 필드 값들도 동일 한지 체크안함
 */

@Data
@EqualsAndHashCode(callSuper = false)
public class BookVO {
	private int b_num				=0;
	private String b_name			="";
	private String b_date			="";
	private String b_list			="";
	private String b_author			="";
	private String b_pub			="";
	private String b_authorinfo		="";
	private String b_info			="";
	private String b_state			="";
	private int b_price				=0;
	private int cateOne_num			=0;
	private int cateTwo_num			=0;
	
	//평점
	private double ra_sum			=0.0;
	private double ra_count			=0.0;
	private double ra_avg			= ra_sum * ra_count;
	
	//이미지
	private String listcover_imgurl 	="";
	private String detailcover_imgurl 	="";
	private String detail_imgurl		="";
	
	//물리적인 이미지를 저장하기 위한 도서등록 이미지 파일정보
	//listcover/detailcover/detail 의 key값을 가질 수 있다.
	private MultipartFile listcoverFile;
	private MultipartFile detailcoverFile;
	private MultipartFile detailFile;
}
