package com.dev24.client.mypage.orderhistory.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev24.client.mypage.orderhistory.service.OrderhistoryService;
import com.dev24.client.mypage.orderhistory.vo.OrderhistoryVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
@AllArgsConstructor
public class OrderhistoryController {
	
	private OrderhistoryService orderhistoryService;
	
	/** mypage order history list
	 * @param String */
	@RequestMapping(value="/orderHistory", method= {RequestMethod.GET})
	public String orderHistory(@ModelAttribute("data") OrderhistoryVO ohvo, Model model, HttpSession session) {
		log.info("orderHistory 호출 성공");
		
		// 주문내역 조회
		List<OrderhistoryVO> ohlist = orderhistoryService.orderhistoryList(ohvo);
		model.addAttribute("ohvo", ohlist);
		
		return "mypage/orderHistory";
	}
	
	
	/** mypage - orderstate update
	 * @param String
	 * @ResponseBody */
	@ResponseBody
	@RequestMapping(value="/orderstateUpdate", method= {RequestMethod.GET})
	public String orderstateUpdate(@ModelAttribute("data") OrderhistoryVO ohvo) {
		log.info("orderHistory 호출 성공");
		
		String resultData = "";
		int result = 0;
		result = orderhistoryService.orderstateUpdate(ohvo);
		if(result == 0) {
			resultData = "FAIL";
		}else {
			resultData = "SUCCESS";
		}
		
		return resultData;
	}
}
