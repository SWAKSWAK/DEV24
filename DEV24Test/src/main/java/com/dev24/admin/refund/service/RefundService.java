package com.dev24.admin.refund.service;

import java.util.List;

import com.dev24.admin.refund.vo.AdminRefundViewVO;

public interface RefundService {
	public List<AdminRefundViewVO> refundList(AdminRefundViewVO rfvo);
}
