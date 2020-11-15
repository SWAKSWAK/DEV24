package com.dev24.client.book.dao;

import java.util.ArrayList;
import java.util.List;

import com.dev24.client.book.vo.BookVO;
import com.dev24.common.pagination.Pagination;

public interface BookDAO {
	
	//select
	public ArrayList<BookVO> bookList(Pagination pagination);
	public int getBookListCnt(BookVO bvo);
	public BookVO bookDetail(int b_num);
	
	//insert
	public int bookNumber();
	public int bookInsert(BookVO bvo);
	
	//merge into
	public int mergeBookData(List<BookVO> list);
	public int mergeBookImgData(List<BookVO> list);
}
