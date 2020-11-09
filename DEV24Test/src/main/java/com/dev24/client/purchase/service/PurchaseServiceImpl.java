package com.dev24.client.purchase.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.dev24.client.cart.vo.CartVO;
import com.dev24.client.customer.dao.CustomerDAO;
import com.dev24.client.customer.vo.CustomerVO;
import com.dev24.client.pdetail.dao.PdetailDAO;
import com.dev24.client.pdetail.vo.PdetailVO;
import com.dev24.client.purchase.dao.PurchaseDAO;
import com.dev24.client.purchase.vo.PurchaseVO;

import lombok.AllArgsConstructor;

@Service("client.purchaseService")
@AllArgsConstructor
public class PurchaseServiceImpl implements PurchaseService {
	private PurchaseDAO purchaseDAO;
	
	private CustomerDAO customerDAO;
	private PdetailDAO pdetailDAO;

	/*@Override
	public List<CartVO> purchaseForm(Map<String, Integer> map) {
		List<CartVO> list = null;
		list = purchaseDAO.purchaseForm(map);
		return list;
	}*/

	// 구매화면 주문상품 출력
	@Override
	public CartVO purchaseForm(int crt_num) {
		CartVO vo = null;
		vo = purchaseDAO.purchaseForm(crt_num);
		return vo;
	}

	// 구매화면 주문자 정보 출력
	@Override
	public CustomerVO getSenderInfo(int c_num) {
		CustomerVO cvo = null;
		cvo = customerDAO.getSenderInfo(c_num);
		return cvo;
	}

	// 구매 완료 후 삽입
	@Override
	public int purchaseInsert(PurchaseVO pvo) {
		int result = 0;
		result = purchaseDAO.purchaseInsert(pvo);
		return result;
	}

	// 구매 상세 삽입
	@Override
	public int pdetailInsert(PdetailVO pdvo) {
		int result = 0;
		result= pdetailDAO.pdetailInsert(pdvo);
		return result;
	}
	
	

}
