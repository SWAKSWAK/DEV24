package com.dev24.client.book.service;

import java.util.ArrayList;

import com.dev24.client.book.vo.BookViewVO;
import com.dev24.common.pagination.Pagination;

public interface BookService {
	public ArrayList<BookViewVO> bookViewList(Pagination pagination);
	public int getBookListCnt();
}
