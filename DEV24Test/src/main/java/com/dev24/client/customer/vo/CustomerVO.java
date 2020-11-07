package com.dev24.client.customer.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerVO {
	private int c_num = 0;
	private String c_phone = "";
	private String c_nickname = "";
	private String c_birthday = "";
	private String c_name = "";
	private String c_id = "";
	private String c_email = "";
	private String c_passwd = "";
	private String c_gender = "";
	private String c_address = "";
	private String c_joindate = "";
	private String c_interest = "";
	private String c_nletter = "";
	
}
