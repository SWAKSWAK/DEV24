package com.dev24.admin.stock.dao;

import java.util.List;

import com.dev24.admin.stock.vo.StockVO;

public interface StockDAO {
	public List<StockVO> stockList(StockVO svo);
}
