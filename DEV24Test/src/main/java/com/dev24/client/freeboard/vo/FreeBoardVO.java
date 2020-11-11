package com.dev24.client.freeboard.vo;

import lombok.Data;

@Data
public class FreeBoardVO {
	private int fb_num=0;
	private String fb_author="";
	private String fb_title ="";
	private int fb_readcnt=0;
	private String fb_content="";
	private String fb_writeday="";
	private int c_num = 0;
	private String fb_img_url="";
	private int r_cnt=0;	
}
