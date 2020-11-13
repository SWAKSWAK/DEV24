package com.dev24.client.refund.service;

import org.springframework.stereotype.Service;

import com.dev24.client.mypage.orderhistory.vo.OrderhistoryVO;
import com.dev24.client.purchase.vo.PurchaseVO;
import com.dev24.client.refund.dao.RefundDAO;

import lombok.AllArgsConstructor;

@Service("client.refundService")
@AllArgsConstructor
public class RefundServiceImpl implements RefundService {

	private RefundDAO refundDAO;
	
	// refundForm page - purchase info print
	@Override
	public PurchaseVO getPurchaseInfo(PurchaseVO pvo) {
		PurchaseVO vo = null;
		vo = refundDAO.getPurchaseInfo(pvo);
		return vo;
	}

	// refundForm page - refund items info print
	@Override
	public OrderhistoryVO getRefundItems(OrderhistoryVO ohvo) {
		OrderhistoryVO vo = null;
		vo = refundDAO.getRefundItems(ohvo);
		return vo;
	}

}
