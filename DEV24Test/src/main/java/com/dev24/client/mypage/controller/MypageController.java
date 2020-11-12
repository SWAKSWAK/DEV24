package com.dev24.client.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev24.client.mypage.orderhistory.service.OrderhistoryService;
import com.dev24.client.mypage.orderhistory.vo.OrderhistoryVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/mypage/*")
@Log4j
@AllArgsConstructor
public class MypageController {
	
	private OrderhistoryService orderhistoryService;
	
	/** ���������� ���� ��� */
	@RequestMapping(value="/mypage", method= {RequestMethod.GET})
	public String mypage(@ModelAttribute("data") OrderhistoryVO ohvo, Model model, HttpSession session) {
		log.info("mypage ȣ�� ����");
		
		// �ֹ����� ��ȸ
		List<OrderhistoryVO> ohlist = orderhistoryService.orderhistoryList(ohvo);
		model.addAttribute("ohvo", ohlist);
		
		return "mypage/mypage";
	}


}
