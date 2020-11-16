package com.dev24.client.review.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dev24.client.review.dao.ReviewDAO;
import com.dev24.client.review.vo.ReviewVO;
import com.dev24.common.file.FileUploadUtil;

import lombok.AllArgsConstructor;

@Service("client.reviewService")
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	private ReviewDAO reviewDAO;

	// review list print on book detail page
	@Override
	public List<ReviewVO> reviewList(int b_num) {
		List<ReviewVO> list = null;
		list = reviewDAO.reviewList(b_num);
		return list;
	}

	// at review form page, book info print
	@Override
	public ReviewVO getBookInfo(int b_num) {
		ReviewVO revo = reviewDAO.getBookInfo(b_num);
		return revo;
	}

	// review insert
	@Transactional
	@Override
	public int reviewInsert(ReviewVO revo) throws Exception {
		int result = 0;
		/*String fileName = FileUploadUtil.fileUpload(revo.getFile(), "review");
		
		if(!fileName.isEmpty()) {
			result = reviewDAO.reviewInsert(revo);
		}*/
		result = reviewDAO.reviewInsert(revo);
		return result;
	}
	
	
	
}
