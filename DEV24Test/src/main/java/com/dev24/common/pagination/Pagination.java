package com.dev24.common.pagination;

import lombok.Data;

@Data
public class Pagination {
	
	private int listSize = 10;		//�� �������� ������ ����Ʈ�� ����. �ʱⰪ���� ��ϰ����� 10���� ����
	private int rangeSize = 10;		//�� ������ ������ ������ �������� ����. �ʱⰪ���� ������������ 10���� ����
	private int page;				//���� ����� ������ ��ȣ
	private int range;				//�� ������ ���� ���� ��ȣ 
	private int listCnt;			//��ü ���ù��� ����
	private int pageCnt;			//��ü ������ ������ ����
	private int startPage;			//�� ������ ���� ���� ��ȣ
	private int startList;
	private int endPage;			//�� ������ ���� �� ��ȣ
	private boolean prev;			//���� ������ ����
	private boolean next;			//���� ������ ����
	
	/**
	 * ������ ���� �޼���
	 * @param page : ������ ����
	 * @param range : ���� ������ ���� ����
	 * @param listCnt : �Խù��� �� ����
	 */
	public void pageInfo(int page, int range, int listCnt) {
		
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		//��ü ������ ��
		this.pageCnt = (int)Math.ceil(listCnt/listSize);
		
		//���� ������
		this.startPage = (range - 1) * rangeSize + 1;
		
		//�� ������
		this.endPage = range * rangeSize;
		
		//�Խ��� ���۹�ȣ
		this.startList = (page - 1) * listSize;
		
		//������ư ����
		this.prev = range == 1 ? false : true;
		
		//������ư ����
		this.next = endPage > pageCnt ? false : true;
		if(this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
	
}
