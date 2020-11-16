package com.dev24.client.review.controller;

import java.util.List;

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

import com.dev24.client.login.vo.LoginVO;
import com.dev24.client.review.service.ReviewService;
import com.dev24.client.review.vo.ReviewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller("client.reviewController")
@AllArgsConstructor
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	private ReviewService reviewService;
	
	/************************************
	 * review list print on book detail page
	 * *****************/
	@RequestMapping(value="/all/{b_num}", method = {RequestMethod.GET, RequestMethod.POST}, produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public String reviewList(@PathVariable("b_num") Integer b_num, Model model){
		log.info("reviewList 호출 성공");
		
		// model값과 상태값(HttpStatus) 추출
		//ResponseEntity<List<ReviewVO>> entity = null;
		List<ReviewVO> list = null;
		
		list = reviewService.reviewList(b_num);
		model.addAttribute("revolist", list);
		//entity = new ResponseEntity<List<ReviewVO>>(list, HttpStatus.OK);
		return "review/all/"+b_num;
	}
	/*public String reviewList(@PathVariable("b_num") int b_num, Model model){   @ModelAttribute("data") ReviewVO revo,
		log.info("reviewList success call");
		
		// model값과 상태값(HttpStatus) 추출
		List<ReviewVO> list = null;
		list = reviewService.reviewList(b_num);
		model.addAttribute("revolist", list);
		
		return "review/all/"+b_num;
	}*/
	
	
	
	/************************************
	 * review form print
	 * *****************/
	@GetMapping(value="/reviewForm")
	public String reviewForm(@ModelAttribute("data") ReviewVO revo, HttpSession session, Model model) {
		log.info("reviewForm success call");
		ReviewVO vo = reviewService.getBookInfo(revo.getB_num());
		model.addAttribute("bookInfo", vo);
		model.addAttribute("pd_num", revo.getPd_num());
		return "review/reviewForm";
	}
	
	/********************************************
	 * review insert
	 * ******************/
	@PostMapping(value="/reviewInsert", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> reviewInsert(@RequestBody ReviewVO revo, HttpSession session) throws Exception{
		log.info("reviewInsert 호출 성공");
		log.info("ReviewVO : "+ revo);
		int result = 0;

		LoginVO lvo = (LoginVO) session.getAttribute("login");
		int c_num = lvo.getC_num();
		log.info(lvo);
		log.info("c_num : "+c_num);
		
		revo.setC_num(c_num);
		
		//int b_num = revo.getB_num();
		
		result = reviewService.reviewInsert(revo);

		return result==1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	/*public String reviewInsert(@ModelAttribute("data") ReviewVO revo, Model model, HttpSession session) throws Exception {
		log.info("reviewInsert success call!");
		
		int result = 0;
		String url = "";
		LoginVO lvo = (LoginVO) session.getAttribute("login");
		int c_num = lvo.getC_num();
		log.info(lvo);
		log.info("c_num : "+c_num);
		revo.setC_num(c_num);
		
		int b_num = revo.getB_num();
		
		result = reviewService.reviewInsert(revo);
		if(result != 0) {
			url = "/all/"+b_num;
		}else {
			url = "review/reviewForm";
		}
		
		return url;
	}*/
	
	
}
