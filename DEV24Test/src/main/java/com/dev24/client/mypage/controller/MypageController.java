package com.dev24.client.mypage.controller;

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
public class MypageController {
	
	
	/** ���������� ���� ��� */
	@RequestMapping(value="/mypage", method= {RequestMethod.GET})
	public String mypage(Model model, HttpSession session) {
		log.info("mypage ȣ�� ����");
		
		return "mypage/mypage";
	}
}
