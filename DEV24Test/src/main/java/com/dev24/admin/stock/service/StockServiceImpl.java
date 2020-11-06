package com.dev24.admin.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev24.admin.stock.dao.StockDAO;
import com.dev24.admin.stock.vo.StockVO;

import lombok.Setter;

@Service
public class StockServiceImpl implements StockService {
	
	@Setter(onMethod_=@Autowired )
	private StockDAO stockdao;
	
	@Override
	public List<StockVO> stockList(StockVO svo) {
		
		List<StockVO> list = null;
		list = stockdao.stockList(svo);
		return list;
	}

}
