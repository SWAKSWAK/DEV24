package com.dev24.admin.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dev24.admin.review.service.ReviewService;
import com.dev24.admin.review.vo.AdminReviewViewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller("admin.reviewController")
@AllArgsConstructor
@RequestMapping("/admin/*")
@Log4j
public class ReviewController {
	private ReviewService reviewService;
	
	/**************************************************
	 * review list print on admin page
	 * *******/
	@GetMapping(value="/reviewList")
	public String reviewList(@ModelAttribute("data") AdminReviewViewVO revo, Model model){
		log.info("reviewList 메서드 호출 성공");
		List<AdminReviewViewVO> list = reviewService.reviewList(revo);
		model.addAttribute("list", list);
		return "admin/reviewList";
	}
}
