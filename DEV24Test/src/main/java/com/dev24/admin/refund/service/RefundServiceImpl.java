package com.dev24.admin.refund.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dev24.admin.refund.dao.RefundDaoAdmin;
import com.dev24.admin.refund.vo.AdminRefundViewVO;

import lombok.AllArgsConstructor;

@Service("admin.refundService")
@AllArgsConstructor
public class RefundServiceImpl implements RefundService {
	private RefundDaoAdmin refundDaoAdmin;

	@Override
	public List<AdminRefundViewVO> refundList(AdminRefundViewVO rfvo) {
		List<AdminRefundViewVO> list = null;
		list = refundDaoAdmin.refundList(rfvo);
		return list;
	}
	
	
}
