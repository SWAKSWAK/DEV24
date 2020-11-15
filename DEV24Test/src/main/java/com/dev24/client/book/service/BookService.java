package com.dev24.client.book.service;

import java.util.ArrayList;

import com.dev24.client.book.vo.BookVO;
import com.dev24.common.pagination.Pagination;

public interface BookService {
	public ArrayList<BookVO> bookList(Pagination pagination);
	public int getBookListCnt(BookVO bvo);
	public int bookInsert(BookVO bvo) throws Exception;
	public BookVO bookDetail(int b_num);
}
