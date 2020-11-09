package com.dev24.client.purchase.dao;

import java.util.List;
import java.util.Map;

import com.dev24.client.cart.vo.CartVO;
import com.dev24.client.purchase.vo.PurchaseVO;

public interface PurchaseDAO {
	public CartVO purchaseForm(int crt_num);
	//public List<CartVO> purchaseForm(Map<String, Integer> map);
	public int purchaseInsert(PurchaseVO pvo);
}
