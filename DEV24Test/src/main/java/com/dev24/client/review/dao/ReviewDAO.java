package com.dev24.client.review.dao;

import java.util.List;

import com.dev24.client.review.vo.ReviewVO;


public interface ReviewDAO {
	public List<ReviewVO> reviewList(int b_num);
	public ReviewVO getBookInfo(int b_num);
	public int reviewInsert(ReviewVO revo);
}
