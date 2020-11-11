package com.dev24.client.freeboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev24.client.freeboard.dao.FreeBoardDAO;
import com.dev24.client.freeboard.vo.FreeBoardVO;

import lombok.Setter;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	
	@Setter(onMethod_=@Autowired)
	private FreeBoardDAO freeboardDAO;
	
	@Override
	public List<FreeBoardVO> freeboardList(FreeBoardVO fbvo) {
		List<FreeBoardVO> list = null;
		list = freeboardDAO.freeboardList(fbvo);
		return list;
	}

	@Override
	public int updateFBReadCount(int fb_readcnt) {
		int result = 0;
		result = freeboardDAO.updateFBReadCount(fb_readcnt);
		return result;
	}

	@Override
	public FreeBoardVO freeboardDetail(FreeBoardVO fbvo) {
		FreeBoardVO detail = null;
		detail = freeboardDAO.freeboardDetail(fbvo);
		if(detail!=null) {
			detail.setFb_content(detail.getFb_content().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}

	@Override
	public int freeboardInsert(FreeBoardVO fbvo) {
		int result = 0;
		result = freeboardDAO.freeboardInsert(fbvo);
		return result;
	}

}
