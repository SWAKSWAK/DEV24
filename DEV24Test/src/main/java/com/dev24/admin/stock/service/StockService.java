package com.dev24.admin.stock.service;

import java.util.List;

import com.dev24.admin.stock.vo.StockVO;


public interface StockService {
	public List<StockVO> stockList(StockVO svo);
}
