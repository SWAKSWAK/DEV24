package com.dev24.client.customer.dao;

import com.dev24.client.customer.vo.CustomerVO;

public interface CustomerDAO {
	// ���� ȭ�鿡�� �ֹ��� ���� ���
	public CustomerVO getSenderInfo(int c_num);
}
