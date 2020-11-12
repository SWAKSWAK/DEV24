package com.dev24.client.mypage.orderhistory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev24.client.mypage.orderhistory.dao.OrderhistoryDAO;
import com.dev24.client.mypage.orderhistory.vo.OrderhistoryVO;

import lombok.Setter;

@Service
public class OrderhistoryServiceImpl implements OrderhistoryService {
	
	@Setter(onMethod_ = @Autowired)
	private OrderhistoryDAO orderhistoryDAO;

	// 주문내역조회
	@Override
	public List<OrderhistoryVO> orderhistoryList(OrderhistoryVO ohvo) {
		List<OrderhistoryVO> list = null;
		list = orderhistoryDAO.orderhistoryList(ohvo);
		return list;
	}

}
