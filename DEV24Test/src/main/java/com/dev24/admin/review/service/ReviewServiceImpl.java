package com.dev24.admin.review.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dev24.admin.review.dao.ReviewDaoAdmin;
import com.dev24.admin.review.vo.AdminReviewViewVO;

import lombok.AllArgsConstructor;

@Service("admin.reviewService")
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	private ReviewDaoAdmin reviewDaoAdmin;
	
	// review list print
	@Override
	public List<AdminReviewViewVO> reviewList(AdminReviewViewVO revo) {
		List<AdminReviewViewVO> list = null;
		list = reviewDaoAdmin.reviewList(revo);
		return list;
	}

}
