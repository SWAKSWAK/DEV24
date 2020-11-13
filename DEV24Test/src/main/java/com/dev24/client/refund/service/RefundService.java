package com.dev24.client.refund.service;

import com.dev24.client.mypage.orderhistory.vo.OrderhistoryVO;
import com.dev24.client.purchase.vo.PurchaseVO;

public interface RefundService {
	public PurchaseVO getPurchaseInfo(PurchaseVO pvo);
	public OrderhistoryVO getRefundItems(OrderhistoryVO ohvo);
}
