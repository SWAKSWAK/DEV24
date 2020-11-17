package com.dev24.client.ne.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev24.client.ne.dao.NeDAO;
import com.dev24.client.ne.vo.NeVO;

import lombok.Setter;

@Service
public class NeServiceImpl implements NeService{
	
	@Setter(onMethod_ = @Autowired)
	private NeDAO neDAO;
	
	@Override
	public List<NeVO> neList() {
		List<NeVO> neList = neDAO.neList();
		return neList;
	}
	
	@Override
	public NeVO neDetail(int ne_num) {
		NeVO nvo = neDAO.neDetail(ne_num);
		return nvo;
	}
}
