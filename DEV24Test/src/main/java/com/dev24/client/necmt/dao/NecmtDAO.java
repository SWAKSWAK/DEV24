package com.dev24.client.necmt.dao;

import java.util.List;

import com.dev24.client.necmt.vo.NecmtVO;

public interface NecmtDAO {
	public List<NecmtVO> necmtList(int ne_num);
}
