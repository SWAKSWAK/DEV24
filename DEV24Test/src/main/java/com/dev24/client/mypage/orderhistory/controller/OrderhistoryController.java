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
import com.dev24.client.refund.service.RefundService;
import com.dev24.client.refund.vo.RefundVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
@AllArgsConstructor
public class OrderhistoryController {
	
	private OrderhistoryService orderhistoryService;
	private RefundService refundService;
	
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
	public String orderstateUpdate(@ModelAttribute("data") OrderhistoryVO ohvo, RefundVO rfvo, HttpSession session) {
		log.info("orderHistory 호출 성공");
		
		String resultData = "";
		int result = 0;
		int refundInsert = 0;
		int c_num = Integer.parseInt((String)session.getAttribute("c_num"));
		rfvo.setC_num(c_num);
		rfvo.setRf_reason("배송 전 주문취소");
		
		result = orderhistoryService.orderstateUpdate(ohvo);

		String pd_orderstate = ohvo.getPd_orderstate();
		log.info("pd_orderstate : "+pd_orderstate);
		if(pd_orderstate.equals("cancel")) {
			//배송예정에서 바로 주문취소 되어도 refund테이블 추가
			refundInsert = refundService.refundInsert(rfvo); 
			
			if(refundInsert == 0) {
				resultData = "FAIL";
			}else {
				resultData = "SUCCESS";
			}
		}else {
			if(result == 0) {
				resultData = "FAIL";
			}else {
				resultData = "SUCCESS";
			}
		}
		
		return resultData;
	}
}
