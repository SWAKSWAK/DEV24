package com.dev24.client.purchase.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev24.client.cart.vo.CartVO;
import com.dev24.client.customer.vo.CustomerVO;
import com.dev24.client.pdetail.vo.PdetailVO;
import com.dev24.client.purchase.service.PurchaseService;
import com.dev24.client.purchase.vo.PurchaseVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller("client.purchaseController")
@RequestMapping("/purchase/*")
@Log4j
@AllArgsConstructor
public class PurchaseController {
	private PurchaseService purchaseService;
	
	/*******************
	 * 주문할 상품 주문 화면 출력
	 * *****/
	@RequestMapping(value="/purchaseForm", method= {RequestMethod.GET, RequestMethod.POST})
	//public String purchaseForm(@ModelAttribute Map<String, Integer> map, Model model) {/*@RequestParam("crt_num") Integer crt_num,*/
	public String purchaseForm(@RequestParam("crt_num") Integer crt_num, Model model) {
		log.info("purchaseForm 호출 성공");
		
		// 상품 주문 화면 출력
		/*Map<Integer, Object> map = new HashMap<>();
		CartVO item = new CartVO();
		for(int i=0; i<crt_num_arr.length; i++){
			item = purchaseService.purchaseForm(crt_num_arr[i]);
			map.put(crt_num_arr[i], item);
		}
		
		model.addAttribute("map", map);*/
				
		/*List<CartVO> list = purchaseService.purchaseForm(map);*/
		
		CartVO list = purchaseService.purchaseForm(crt_num);
		model.addAttribute("list", list);
		
		return "purchase/purchaseForm";
	}
	
	
	/****************************
	 * 주문하는 사람 (회원) 정보 출력
	 * **********/
	@ResponseBody
	@GetMapping(value="/{c_num}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CustomerVO> getSenderInfo(@PathVariable("c_num") Integer c_num){
		log.info("getSenderInfo 호출 성공");
		ResponseEntity<CustomerVO> entity = null;
		entity = new ResponseEntity<CustomerVO>(purchaseService.getSenderInfo(c_num), HttpStatus.OK);
		return entity;
	}
	
	/****************************
	 * 구매 테이블 삽입
	 * **********/
	@RequestMapping(value="/purchaseInsert", method= {RequestMethod.POST})
	public String purchaseInsert(PurchaseVO pvo) {
		log.info("purchaseInsert 호출 성공");
		
		int p_num = 0;
		int result = 0;
		String path = "";
		pvo.setC_num(2); // ** 회원번호 임의 설정
		p_num = purchaseService.purchaseInsert(pvo); // p_num반환
		
		if(p_num != 0) {
			/*PdetailController pdcon = new PdetailController();
			path = pdcon.pdetailInsert(pdvo);*/
			PdetailVO pdvo = new PdetailVO();
			pdvo.setP_num(p_num);
			pdvo.setC_num(pvo.getC_num());
			
			log.info("################# pd insert 전: [{}]" + pdvo);
			
			result = purchaseService.pdetailInsert(pdvo);
			
			if(result == 1) {
				path = "purchase/pdetailInsert";
			}else {
				path = "purchase/purchaseForm";
			}
		}else {
			path = "redirect:/purchase/purchaseForm";
		}
		
		//return "purchase/pdetailInsert";
		return path;
	}

}
