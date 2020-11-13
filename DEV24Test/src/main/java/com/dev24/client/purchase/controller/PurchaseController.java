package com.dev24.client.purchase.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
@SessionAttributes({"c_id", "c_num"})
public class PurchaseController {
	private PurchaseService purchaseService;
	
	/*******************
	 * 二쇰Ц �럹�씠吏� 異쒕젰
	 * *****/
	@RequestMapping(value="/purchaseForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String purchaseForm(Model model, HttpSession session) {
		log.info("purchaseForm �샇異� �꽦怨�");
		
		@SuppressWarnings("unchecked")
		List<CartVO> cvoList = (List<CartVO>) session.getAttribute("cvoList");
		
		log.info(cvoList.toString());

		List<CartVO> resultList = purchaseService.purchaseForm(cvoList);
		
		//log.info(resultList.toString());
		
		model.addAttribute("list", resultList);
		
		return "purchase/purchaseForm";
	}
	
	
	/****************************
	 * after payment, pdetail automatically insert according to purchase
	 * **********/
	@ResponseBody
	@PostMapping(value="/purchaseItems", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String purchaseItems(@RequestBody List<Map<String, Object>> cartList, HttpSession session, Model model){
		log.info("purchaseItems �샇異� �꽦怨�");
		log.info(session.getAttribute("c_id").toString());

		CartVO cvo = null;

		List<CartVO> cvoList = new ArrayList<CartVO>();
		
		for (Map<String, Object> m : cartList) {
			cvo = new CartVO();
			int crt_num = Integer.parseInt(m.get("crt_num")+"");
			cvo.setCrt_num(crt_num);
			cvoList.add(cvo);
		}
		
		session.setAttribute("cvoList", cvoList);
		model.addAttribute("cartList", purchaseService.purchaseForm(cvoList));
		return "purchase/purchaseForm";
	}
	
	/****************************
	 * 단일항목 구매를 위한 session 추가 작업
	 * **********/
	@ResponseBody
	@PostMapping(value="/purchaseSingleItem", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String purchaseSingleItem(@RequestBody CartVO cvo, HttpSession session, Model model){
		log.info("purchaseSingleItem �샇異� �꽦怨�");
		log.info(session.getAttribute("c_id").toString());

		List<CartVO> cvoList = new ArrayList<CartVO>();
		cvoList.add(cvo);
		
		session.setAttribute("cvoList", cvoList);
		model.addAttribute("cartList", purchaseService.purchaseForm(cvoList));
		return "purchase/purchaseForm";
	}
	
	
	/****************************
	 * 二쇰Ц�옄 �젙蹂� 異쒕젰
	 * **********/
	@ResponseBody
	@GetMapping(value="/{c_num}", produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CustomerVO> getSenderInfo(@PathVariable("c_num") Integer c_num){
		log.info("getSenderInfo �샇異� �꽦怨�");
		ResponseEntity<CustomerVO> entity = null;
		entity = new ResponseEntity<CustomerVO>(purchaseService.getSenderInfo(c_num), HttpStatus.OK);
		return entity;
	}
	
	/****************************
	 * 二쇰Ц �긽�뭹 援щℓ �궫�엯
	 * **********/
	@RequestMapping(value="/purchaseInsert", method= {RequestMethod.POST, RequestMethod.GET}, produces = "text/plain; charset=utf8")
	@ResponseBody
	public String purchaseInsert(@ModelAttribute("pvo") PurchaseVO pvo, @RequestBody List<Map<String, Object>> pdvoList, HttpSession session, Model model) {
		log.info("purchaseInsert �샇異� �꽦怨�");
		
		int p_num = 0;
		int result = 0;
		String resultData = "";
		
		int c_num = Integer.parseInt(session.getAttribute("c_num")+"");
		
		log.info(pdvoList.get(0).get("p_receiver") + "");
		log.info(pdvoList.get(1).get("p_price") + "");
		log.info(pdvoList.get(2).get("p_zipcode") + "");
		log.info(pdvoList.get(3).get("p_pmethod") + "");
		
		String p_receiver = pdvoList.get(0).get("p_receiver") + "";
		int p_price = Integer.parseInt(pdvoList.get(1).get("p_price")+"");
		String p_zipcode = pdvoList.get(2).get("p_zipcode")+"";
		String p_pmethod = pdvoList.get(3).get("p_pmethod")+"";
		String p_address = pdvoList.get(4).get("p_address")+"";
		String p_sender = pdvoList.get(5).get("p_sender")+"";
		String p_receivephone = pdvoList.get(6).get("p_receivephone")+"";
		String p_senderphone = pdvoList.get(7).get("p_senderphone")+"";
		
		pvo.setP_receiver(p_receiver);
		pvo.setP_price(p_price);
		pvo.setP_zipcode(p_zipcode);
		pvo.setP_pmethod(p_pmethod);
		pvo.setP_address(p_address);
		pvo.setP_sender(p_sender);
		pvo.setP_receivephone(p_receivephone);
		pvo.setP_senderphone(p_senderphone);
		
		log.info(pvo);
		log.info("pdvoList.size() : " + pdvoList.size());
				
		pvo.setC_num(c_num);
		result = purchaseService.purchaseInsert(pvo);
		p_num = purchaseService.getMaxPnum();
		
		log.info("result : "+result);
		log.info("p_num : "+p_num);
		
		session.setAttribute("p_num", p_num);
		model.addAttribute("pdetailList", pdvoList);
		
		if(result != 0) {
			resultData = "/purchase/pdetailInsert";
			
		}else {
			resultData = "/cart/cartList";
		}
		
		return resultData;
	}
	
	
	/****************************
	 * 二쇰Ц �긽�뭹 援щℓ�긽�꽭 �궫�엯
	 * **********/
	@ResponseBody
	@RequestMapping(value="/pdetailInsert", method= {RequestMethod.POST, RequestMethod.GET}, produces = "text/plain; charset=utf8")
	public String pdetailInsert(@RequestBody List<Map<String, Object>> pdvoList, HttpSession session, Model model) {
		log.info("pdetailInsert �샇異� �꽦怨�");
		
		int result = 0;
		PdetailVO pdvo = null;
		String resultData = "";
		
		int c_num = Integer.parseInt(session.getAttribute("c_num")+"");
		int p_num = Integer.parseInt(session.getAttribute("p_num")+"");
		log.info("p_num =>>>>>>" + p_num);
		
		List<PdetailVO> pdetailList = new ArrayList<PdetailVO>();
		
		for (int i=8; i<pdvoList.size(); i++) {
			log.info(pdvoList.get(i).get("b_num")+"");
			log.info(pdvoList.get(i).get("pd_price")+"");
			
			 pdvo = new PdetailVO();
			
			int b_num = Integer.parseInt(pdvoList.get(i).get("b_num")+"");
			int pd_price = Integer.parseInt(pdvoList.get(i).get("pd_price")+"");
			
			pdvo.setB_num(b_num);
			pdvo.setPd_price(pd_price);
			pdvo.setP_num(p_num);
			pdvo.setC_num(c_num);
			
			log.info("################# pd insert : " + pdvo);
			pdetailList.add(pdvo);
		}

		result = purchaseService.pdetailInsert(pdetailList);
		log.info("pdetail result : "+ result);
		if (result == 0) {
			resultData = "FAIL";
		}else {
			resultData = "SUCCESS";
		}
			
		
		return resultData;
	}
	
	
	/************************
	 * 援щℓ�셿猷� �럹�씠吏� 異쒕젰
	 * **********/
	@PostMapping(value="/purchasefinish")
	public String purchasefinish(@ModelAttribute("data") PurchaseVO pvo, Model model) {
		log.info("purchasefinish �샇異� �꽦怨�");
		
		model.addAttribute("pvo", pvo);
		return "purchase/purchasefinish";
	}
	
	@ResponseBody
	@PostMapping(value="/purchasedItemDelete")
	public String purchasedItemDelete(@RequestBody List<Map<String, Integer>> cvoList, HttpSession session, Model model) {
		log.info("purchasedItemDelete �샇異� �꽦怨�");
		
		List<CartVO> cartList = new ArrayList<CartVO>();
		CartVO cvo = new CartVO();
		
		
		for (int i=0; i<cvoList.size(); i++) {
			String s_num = cvoList.get(i).get("crt_num")+"";
			log.info(i+"踰덉㎏ : "+s_num);
			
				if(s_num != null) {
					log.info(i + ": " + s_num);
					cvo = new CartVO();
					int crt_num = Integer.parseInt(s_num);
					cvo.setCrt_num(crt_num);
					cartList.add(cvo);
				}
			}
		
		int result = 0;
		String resultData = "";
		result = purchaseService.purchasedItemDelete(cartList);
		
		if (result == 0) {
			resultData = "FAIL";
		}else {
			resultData = "SUCCESS";
		}
		
		return resultData;
	}
	
	

}
