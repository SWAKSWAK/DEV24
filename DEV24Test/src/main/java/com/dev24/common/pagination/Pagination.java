package com.dev24.common.pagination;

import lombok.Data;

@Data
public class Pagination {

	private int listRange;	// ���������� ��µ� ������ ����
	private int range 			= 10;	// �ѹ��� ���ڷ� ������ ������ ���� -1(�⺻�� 10)
	private int page; 					// ���� ����� ������ ��ȣ
	private int startPage 		= 1;	// �� ������ ���� ���� ��ȣ (�⺻�� 1)
	private int endPage; 				// �� ������ ���� �� ��ȣ (�⺻�� 5)
	private int pageLength; 			// �� ������ ���� (where���� ���� ����)
	private int bookLength; 			// ��ü ���� ���� (where���� ���� ����)
	private int startRownum; 			// ���������� ��µǴ� ù��° ��ǰ�� rownum
	private int lastRownum; 			// ���������� ��µǴ� ������ ��ǰ�� rownum
	private boolean prev; 				// ���� ������ ����
	private boolean next;				 // ���� ������ ����

	// ī�װ� ���ǿ� ���缭 ����¡ ����� �ϱ� ����
	private int cateOne_num = 0; // ��з� �ڵ�
	private int cateTwo_num = 0; // �Һз� �ڵ�
	
	// ���Ŀ� ���� �����ϱ� ���� ���� (�⺻�� = "best")
	// dev24 / best / new / lowp / highp
	String b_sort = "best";
	
	/****************
	 * ���/�̵��/���� ���θ� �Ǵ��ϱ� ���� �ʵ�
	 * null �Ǵ� "" �Ǵ� "all"	:��� ��ȸ
	 * "null"				:��ϻ�ǰ�� ��ȸ
	 * "unreg"				:�̵�� ��ǰ�� ��ȸ
	 * "outOfPrint"			:���� ��ǰ�� ��ȸ
	 * "reg or oop"			:��� �� ���� ��� ���
	 ****************/
	String b_stateKeyword = "null";

	/******************************************************************
	 * ����¡ ó���� ���� �޼ҵ�
	 * 
	 * @param bookLength  : ���ǿ� �ش��ϴ� å�� �� ����
	 * @param startPage   : ȭ�鿡 ��µ� page ��ȣ�� ù��° ��
	 * @param page        : ���� ������
	 * @param cateOne_num : ��з� �ڵ�
	 * @param cateTwo_num : �Һ��� �ڵ�
	 ******************************************************************/
	public Pagination(int bookLength, int startPage, int page, int cateOne_num, int cateTwo_num, int listRange, String b_sort, String b_stateKeyword) {
		this.page = page;
		this.listRange = listRange;
		this.b_stateKeyword = b_stateKeyword;
		this.b_sort = b_sort;

		// �� �������� ��µ� ù��° ��ǰ rownum
		// ��: 1�������� minRownum�� 1�̹Ƿ� (1-1)*10+1==1
		int strtRownum = (page - 1) * listRange + 1;
		this.startRownum = strtRownum;

		// ���������� ��µ� ������ ��ǰ rownum
		this.lastRownum = startRownum + listRange;

		// ��ü ��ǰ ����
		this.bookLength = bookLength;

		// ������ ����
		if (bookLength%10 > 0)
			this.pageLength = bookLength / listRange + 1;
		else
			this.pageLength = bookLength / listRange;

		// QuerySring���� startPage ���� �޾Ҵٸ�
		if (startPage != 0) {
			this.startPage = startPage;
		}
		
		if(startPage + range <= pageLength)
			this.endPage = startPage + range -1;
		else
			this.endPage = pageLength;
		
		// ������ư�� Ȱ��ȭ ��ų�� ����
		// startRownum �� 1���� ������ ���̻� ���������� ���ٴ� ��
		if (startRownum - 1 < 1)
			this.prev = false;
		else
			this.prev = true;

		// ������ư�� Ȱ��ȭ ��ų�� ����
		// lastRownum �� bookLength���� ������ ���������� ���ٴ� ��
		if (lastRownum + 1 > bookLength)
			this.next = false;
		else
			this.next = true;

		// ī�װ��� �°� ��ȸ�ϱ� ���� pagination�� ī�װ� �ڵ� ���
		// 0�� ��� BookView.xml���� where���� �۵����� ����
		this.cateOne_num = cateOne_num;
		this.cateTwo_num = cateTwo_num;
	}
}
