package com.dev24.client.purchase.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PurchaseVO {
	private int p_num = 0;
	private String p_sender = ""; // 二쇰Ц�옄(�쉶�썝)
	private int p_price = 0; // 二쇰Ц媛�寃�
	private String p_zipcode = ""; // �슦�렪踰덊샇
	private String p_pmethod = ""; // 寃곗젣諛⑸쾿
	private String p_receiver = ""; // �닔�졊�옄
	private String p_address = ""; // 諛곗넚二쇱냼
	private String p_senderphone = ""; // 二쇰Ц�옄 踰덊샇
	private String p_receivephone = ""; // �닔�졊�옄 踰덊샇
	private int c_num = 0; // �쉶�썝踰덊샇
	private String p_buydate = ""; // �벑濡앹씪

}
