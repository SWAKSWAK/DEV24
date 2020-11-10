package com.dev24.admin.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev24.admin.admin.dao.AdminIndexDAO;
import com.dev24.admin.admin.vo.AdminIndexVO;

import lombok.Setter;

@Service
public class AdminIndexServiceImpl implements AdminIndexService {
	
	@Setter(onMethod_=@Autowired )
	private AdminIndexDAO adminIndexDAO;

	@Override
	public int pCount() {
		int result = 0;
		result = adminIndexDAO.pCount();
		return result;
	}
	
	@Override
	public AdminIndexVO adminIndex() {
		AdminIndexVO adminIndex = new AdminIndexVO();
		adminIndex.setP_cnt(pCount());
		adminIndex.setStk_cnt(stkCount());
		adminIndex.setRf_cnt(rfCount());
		adminIndex.setSal_cnt(salCount());
		adminIndex.setRev_cnt(revCount());
		adminIndex.setQna_cnt(qnaCount());
		return adminIndex;
	}

	@Override
	public int stkCount() {
		int result = 0;
		result = adminIndexDAO.stkCount();
		return result;
	}

	@Override
	public int rfCount() {
		int result = 0;
		result = adminIndexDAO.rfCount();
		return result;
	}

	@Override
	public int salCount() {
		int result = 0;
		result = adminIndexDAO.salCount();
		return result;
	}

	@Override
	public int revCount() {
		int result = 0;
		result = adminIndexDAO.revCount();
		return result;
	}

	@Override
	public int qnaCount() {
		int result = 0;
		result = adminIndexDAO.qnaCount();
		return result;
	}

	
	


}
