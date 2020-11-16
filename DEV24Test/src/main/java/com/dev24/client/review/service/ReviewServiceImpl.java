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
	public List<ReviewVO> reviewList(ReviewVO revo) {
		List<ReviewVO> list = null;
		list = reviewDAO.reviewList(revo);
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
		String fileName = "";
		if(revo.getFile()==null) {
			result = reviewDAO.reviewInsert(revo);
			
		}else {
			fileName = FileUploadUtil.fileUpload(revo.getFile(), "review");
			
			revo.setRe_imgurl(fileName);
			if(!fileName.isEmpty()) {
				result = reviewDAO.reviewInsert(revo);
			}
		}
		
		return result;
	}

	// rating table update after insert into review
	@Override
	public int ratingUpdate(ReviewVO revo) {
		int result = 0;
		result = reviewDAO.ratingUpdate(revo);
		return result;
	}

	// review delete with image file
	@Override
	public int reviewDelete(int re_num) throws Exception {
		int result = 0;
		ReviewVO revo = new ReviewVO();
		if(revo.getRe_imgurl() != "") {
			FileUploadUtil.fileDelete(revo.getRe_imgurl());
		}
		result = reviewDAO.reviewDelete(re_num);
		return result;
	}

	// review update form print
	@Override
	public ReviewVO reviewUpdateForm(int re_num) {
		ReviewVO revo = null;
		revo = reviewDAO.reviewUpdateForm(re_num);
		return revo;
	}
	
	
	
}
