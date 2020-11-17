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
		int resultRating = 0;
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
		
		// rating table update after insert into review
		if(result == 1) {
			resultRating = reviewDAO.ratingUpdate(revo); 
		}else {
			resultRating = 0;
		}
		
		return resultRating;
	}
	

	// review delete with image file
	@Transactional
	@Override
	public int reviewDelete(ReviewVO revo) throws Exception {
		int result = 0;
		int resultRating = 0;
		//log.info("revo.getRe_imgurl() > "+revo.getRe_imgurl());
		if(revo.getRe_imgurl() != "") {
			FileUploadUtil.fileDelete(revo.getRe_imgurl());
		}
		result = reviewDAO.reviewDelete(revo);
		
		// rating table update after delete from review
		if(result == 1) {
			resultRating = reviewDAO.ratingMinus(revo); 
		}else {
			resultRating = 0;
		}
		
		return resultRating;
	}

	// review update form print
	@Override
	public ReviewVO reviewUpdateForm(int re_num) {
		ReviewVO revo = null;
		revo = reviewDAO.reviewUpdateForm(re_num);
		return revo;
	}

	// review update
	@Transactional
	@Override
	public int reviewUpdate(ReviewVO revo) throws Exception {
		int result = 0;
		String fileName = "";
		
		// if exsiting image already, 
		if(revo.getRe_imgurl() != "") { 
			// delete image
			FileUploadUtil.fileDelete(revo.getRe_imgurl());

			if(revo.getFile()!=null) {
				//delete exsited one and upload new one again
				revo.setRe_imgurl(FileUploadUtil.fileUpload(revo.getFile(), "review"));
			}
		}else {
			
			// if no-exsiting image, upload image
			if(revo.getFile()!=null) {
				fileName = FileUploadUtil.fileUpload(revo.getFile(), "review");
				revo.setRe_imgurl(fileName);
			}
		}
		
		result = reviewDAO.reviewUpdate(revo);

		return result;
	}
	
	
	
}
