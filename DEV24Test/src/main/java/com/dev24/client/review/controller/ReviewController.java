package com.dev24.client.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@ResponseBody
	public ResponseEntity<List<ReviewVO>> reviewList(@PathVariable("b_num") Integer b_num, @ModelAttribute("data") ReviewVO revo, Model model){
		log.info("reviewList 호출 성공");
		
		b_num = revo.getB_num();
		log.info("b_num : "+b_num);
		
		ResponseEntity<List<ReviewVO>> entity = null;
		List<ReviewVO> list = null;
		
		revo.setRe_type(revo.getReviewType_sort());
		log.info("reviewType_sort : "+revo.getReviewType_sort());
		
		list = reviewService.reviewList(revo);
		entity = new ResponseEntity<List<ReviewVO>>(list, HttpStatus.OK);
		return entity;
	}

	
	/************************************
	 * review form print
	 * *****************/
	@GetMapping(value="/reviewForm")
	public String reviewForm(@ModelAttribute("data") ReviewVO revo, Model model) {
		log.info("reviewForm success call");
		ReviewVO vo = reviewService.getBookInfo(revo.getB_num());
		model.addAttribute("bookInfo", vo);
		model.addAttribute("pd_num", revo.getPd_num());
		return "review/reviewForm";
	}
	
	/********************************************
	 * review insert
	 * ******************/
	@PostMapping(value="/reviewInsert", produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> reviewInsert(ReviewVO revo, HttpSession session) throws Exception{
		log.info("reviewInsert 호출 성공");
		log.info("ReviewVO : "+ revo);
		int result = 0;
		int resultRating = 0;

		LoginVO lvo = (LoginVO) session.getAttribute("login");
		int c_num = lvo.getC_num();
		log.info(lvo);
		log.info("c_num : "+c_num);
		
		revo.setC_num(c_num);
		
		result = reviewService.reviewInsert(revo);
		
		log.info(revo.getB_num());
		log.info(revo.getRe_score());
		if(result == 1) {
			resultRating = reviewService.ratingUpdate(revo);
		}else {
			resultRating = 0;
		}
		
		return resultRating==1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	/************************************************
	 * delete review
	 * ****************/
	@DeleteMapping(value="/{re_num}", produces= {MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> reviewDelete(@PathVariable("re_num") Integer re_num) throws Exception{
		log.info("reviewDelete 호출 성공");
		log.info("re_num : "+re_num);
		
		int result = 0;
		result = reviewService.reviewDelete(re_num);
		
		return result==1 ? new ResponseEntity<String>("SUCCESS", HttpStatus.OK) : new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	/************************************************
	 * review update form page print
	 * *****************/
	@GetMapping(value="/updateForm")
	public String reviewUpdateForm(@ModelAttribute("data") ReviewVO revo, Model model) {
		log.info("reviewUpdateForm success call");
		ReviewVO bvo = reviewService.getBookInfo(revo.getB_num());
		ReviewVO reup = reviewService.reviewUpdateForm(revo.getRe_num());
		model.addAttribute("bookInfo", bvo);
		model.addAttribute("reup", reup);
		model.addAttribute("pd_num", revo.getPd_num());
		return "review/reviewUpdateForm";
	}
	
	
	
}
