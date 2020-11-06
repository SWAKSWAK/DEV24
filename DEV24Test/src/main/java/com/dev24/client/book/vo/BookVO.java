package com.dev24.client.book.vo;

import lombok.Data;

@Data
public class BookVO {
	private int b_num				=0;
	private String b_name			="";
	private String b_date			="";
	private String b_list			="";
	private String b_author			="";
	private String b_pub			="";
	private String b_authorinfo		="";
	private String b_info			="";
	private String b_disct			="";
	private int b_price				=0;
	private int cateOne_num			=0;
	private int cateTwo_num			=0;
}
