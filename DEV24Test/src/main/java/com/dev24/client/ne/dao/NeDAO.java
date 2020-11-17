package com.dev24.client.ne.dao;

import java.util.List;

import com.dev24.client.ne.vo.NeVO;

public interface NeDAO {
	public List<NeVO> neList();
	public NeVO neDetail(int ne_num);
}