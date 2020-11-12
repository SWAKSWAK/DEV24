package com.dev24.client.mypage.refundhistory.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
@AllArgsConstructor
public class RefundhistoryController {

	/** ���������� ȯ�ҳ�����ȸ ��� */
	@RequestMapping(value="/refundHistory", method= {RequestMethod.GET})
	public String orderHistory(Model model, HttpSession session) {
		log.info("refundHistory ȣ�� ����");
		
		return "mypage/refundHistory";
	}
}
