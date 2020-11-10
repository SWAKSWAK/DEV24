package com.dev24.client.freeboard.service;

import java.util.List;

import com.dev24.client.freeboard.vo.FreeBoardVO;

public interface FreeBoardService {
	List<FreeBoardVO> freeboardList(FreeBoardVO fbvo);
	public int updateFBReadCount(int fb_readcnt);
}
