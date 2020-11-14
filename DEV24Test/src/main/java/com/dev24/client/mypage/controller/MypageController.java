package com.dev24.client.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev24.client.mypage.orderhistory.service.OrderhistoryService;
import com.dev24.client.mypage.orderhistory.vo.OrderhistoryVO;
import com.dev24.client.mypage.refundhistory.service.RefundhistoryService;
import com.dev24.client.mypage.refundhistory.vo.RefundhistoryVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
@AllArgsConstructor
public class MypageController {
	
	private OrderhistoryService orderhistoryService;
	private RefundhistoryService refundhistoryService;
	
	/************************************************
	 *  mypage main print
	 *  ****************/
	@RequestMapping(value="/mypage", method= {RequestMethod.GET})
	public String mypage(OrderhistoryVO ohvo, RefundhistoryVO rfhvo, Model model, HttpSession session) {
		log.info("mypage 호출 성공");
		
		// 주문내역 조회
		List<OrderhistoryVO> ohlist = orderhistoryService.orderhistoryList(ohvo);
		model.addAttribute("ohvo", ohlist);
		
		// 환불내역 조회
		List<RefundhistoryVO> rfhlist = refundhistoryService.refundhistoryList(rfhvo);
		model.addAttribute("rfhvo", rfhlist);
		
		return "mypage/mypage";
	}
//git add test

}
