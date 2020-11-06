package com.dev24.admin.stock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev24.admin.stock.service.StockService;
import com.dev24.admin.stock.vo.StockVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class StockController {
	
	private StockService stockService;
	
	@RequestMapping(value="/stockList", method=RequestMethod.GET)
	public String stockList(@ModelAttribute("data") StockVO svo, Model model) {
		log.info("stockList »£√‚");
		List<StockVO> stockList = stockService.stockList(svo);
		model.addAttribute("stockList", stockList);
		return "admin/stockList";
	}
}
