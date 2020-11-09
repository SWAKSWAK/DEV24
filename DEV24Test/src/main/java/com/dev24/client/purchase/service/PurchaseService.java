package com.dev24.client.purchase.service;

import java.util.List;
import java.util.Map;

import com.dev24.client.cart.vo.CartVO;
import com.dev24.client.customer.vo.CustomerVO;
import com.dev24.client.pdetail.vo.PdetailVO;
import com.dev24.client.purchase.vo.PurchaseVO;

public interface PurchaseService {
	public CartVO purchaseForm(int crt_num);
	//public List<CartVO> purchaseForm(Map<String, Integer> map);
	
	// 구매화면 주문자 정보 출력
	public CustomerVO getSenderInfo(int c_num);
	
	public int purchaseInsert(PurchaseVO pvo);
	public int pdetailInsert(PdetailVO pdvo);
	
}
