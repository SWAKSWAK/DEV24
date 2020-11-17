package com.dev24.client.ne.service;

import java.util.List;

import com.dev24.client.ne.vo.NeVO;

public interface NeService {
	public List<NeVO> neList();
	public NeVO neDetail(int ne_num);
}
