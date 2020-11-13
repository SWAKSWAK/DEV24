package com.dev24.client.refund.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev24.client.mypage.orderhistory.vo.OrderhistoryVO;
import com.dev24.client.purchase.vo.PurchaseVO;
import com.dev24.client.refund.service.RefundService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller("client.refundController")
@AllArgsConstructor
@RequestMapping("/refund/*")
@Log4j
public class RefundController {
	
	private RefundService refundService;
	
	/** go to refundForm page **/
	@RequestMapping(value="/refundForm", method= {RequestMethod.GET})
	public String refundForm(@ModelAttribute("data1") PurchaseVO pvo, @ModelAttribute("data2") OrderhistoryVO ohvo, Model model) {
		log.info("refundForm 호출 성공");
		
		PurchaseVO purchase = null;
		purchase = refundService.getPurchaseInfo(pvo);
		
		OrderhistoryVO book = null;
		book = refundService.getRefundItems(ohvo);

		log.info(book);
		log.info("ohvo.getB_num() => "+ohvo.getB_num());
		log.info("ohvo.getP_num() => "+ohvo.getP_num());
		model.addAttribute("pvo", purchase);
		model.addAttribute("ohvo", book);
		
		return "refund/refundForm";
	}
}
