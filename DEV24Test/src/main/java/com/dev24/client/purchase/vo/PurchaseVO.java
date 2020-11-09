package com.dev24.client.purchase.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseVO {
	private int p_num = 0;
	private String p_sender = ""; // 주문자(회원)
	private int p_price = 0; // 주문가격
	private String p_zipcode = ""; // 우편번호
	private String p_pmethod = ""; // 결제방법
	private String p_receiver = ""; // 수령자
	private String p_address = ""; // 배송주소
	private String p_senderphone = ""; // 주문자 번호
	private String p_receivephone = ""; // 수령자 번호
	private int c_num = 0; // 회원번호
	private String p_buydate = ""; // 등록일
	

}
