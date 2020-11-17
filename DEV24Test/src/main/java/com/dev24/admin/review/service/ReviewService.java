package com.dev24.admin.review.service;

import java.util.List;

import com.dev24.admin.review.vo.AdminReviewViewVO;

public interface ReviewService {
	public List<AdminReviewViewVO> reviewList(AdminReviewViewVO revo);
}
