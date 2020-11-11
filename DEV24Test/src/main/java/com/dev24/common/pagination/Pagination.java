package com.dev24.common.pagination;

import lombok.Data;

@Data
public class Pagination {
	
//	private int rangeSize = 5;		//�� ������ ������ ������ �������� ����. �ʱⰪ���� ������������ 5�� ����
//	private int range;				//�� ������ ���� ���� ��ȣ 
//	private int startList;			//�Խ��� ���۹�ȣ
	private int page;				//���� ����� ������ ��ȣ
	private int startPage		= 1;//�� ������ ���� ���� ��ȣ (�⺻�� 1)
	private int endPage			= 5;//�� ������ ���� �� ��ȣ (�⺻�� 5)
	private int pageLength;			//�� ������ ���� (where���� ���� ����)
	private int bookLength;			//��ü ���� ���� (where���� ���� ����)
	private int listLength = 15;		//�� �������� ������ ����Ʈ�� ����. �ʱⰪ���� ��ϰ����� 15�� ����
	private int lastRownum;			//���������� ��µǴ� ������ ��ǰ�� rownum
	private int startRownum;		//���������� ��µǴ� ù��° ��ǰ�� rownum
	private boolean prev;			//���� ������ ����
	private boolean next;			//���� ������ ����
//	
	private int cateOne_num = 0;
	private int cateTwo_num = 0;
	
	public void pagantion(int bookLength, int page, int cateOne_num, int cateTwo_num) {
		this.page = page;
		
		//�� �������� ��µ� ù��° ��ǰ rownum
		//��: 1�������� minRownum�� 1�̹Ƿ� (1-1)*10+1==1
		int startRownum = (page-1)*10+1;
		this.startRownum = startRownum;
		
		//���������� ��µ� ������ ��ǰ rownum
		int lastRownum = page*10;
		this.lastRownum = lastRownum;
		
		//��ü ��ǰ ����
		this.bookLength = bookLength;
		
		//������ ����
		this.pageLength = bookLength/10 + 1;
		
		//������ư�� Ȱ��ȭ ��ų�� ����
		//startRownum �� 1���� ������ ���̻� ���������� ���ٴ� ��
		if (startRownum-1 < 1)
			this.prev = false;
		else
			this.prev = true;
		
		//������ư�� Ȱ��ȭ ��ų�� ����
		//lastRownum �� bookLength���� ������ ���������� ���ٴ� ��
		if (lastRownum+1 > bookLength)
			this.next = false;
		else
			this.next = true;
			
		//ī�װ��� �°� ��ȸ�ϱ� ���� pagination�� ī�װ� �ڵ� ���
		//0�� ��� BookView.xml���� where���� �۵����� ����
		this.cateOne_num = cateOne_num;
		this.cateTwo_num = cateTwo_num;
	}
	
//	
//	/**
//	 * ������ ���� �޼���
//	 * @param page : ������ ����
//	 * @param range : ���� ������ ���� ����
//	 * @param listCnt : �Խù��� �� ����
//	 */
//	public void pageInfo(int page, int range, int listCnt) {
//		
//		this.page = page;
//		this.range = range;
//		this.listCnt = listCnt;
//		
//		//��ü ������ ��  
//		//��: 889���� ��ǰ ���� 10���� ����¡ �Ѵٸ� pageCnt 88.9���� �ø��� 89�� �Ǿ�� �Ѵ�. 
//		this.pageCnt = (int)Math.ceil(listCnt/listSize);
//		
//		//���� ������
//		this.startPage = (range - 1) * rangeSize + 1;
//		
//		//�� ������
//		this.endPage = range * rangeSize;
//		
//		//�Խ��� ���۹�ȣ
//		this.startList = (page - 1) * listSize;
//		
//		//������ư ����
//		this.prev = range == 1 ? false : true;
//		
//		//������ư ����
//		this.next = endPage > pageCnt ? false : true;
//		if(this.endPage > this.pageCnt) {
//			this.endPage = this.pageCnt;
//			this.next = false;
//		}
//	}
	
}
