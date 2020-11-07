package com.dev24.client.customer.dao;

import com.dev24.client.customer.vo.CustomerVO;

public interface CustomerDAO {
	// 구매 화면에서 주문자 정보 출력
	public CustomerVO getSenderInfo(int c_num);
}
