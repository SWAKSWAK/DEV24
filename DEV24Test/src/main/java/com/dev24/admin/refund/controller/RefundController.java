package com.dev24.admin.refund.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev24.admin.refund.service.RefundService;
import com.dev24.admin.refund.vo.AdminRefundViewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller("admin.refundController")
@AllArgsConstructor
@RequestMapping("/admin/*")
@Log4j
public class RefundController {
	private RefundService refundService;
	
	@GetMapping(value="/refundList")
	public String refundList(@ModelAttribute("data") AdminRefundViewVO rfvo, Model model) {
		log.info("refundList 호출성공");
		
		List<AdminRefundViewVO> list = refundService.refundList(rfvo);
		model.addAttribute("list", list);
		return "admin/refundList";
	}
	
}
