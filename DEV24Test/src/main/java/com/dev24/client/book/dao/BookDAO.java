package com.dev24.client.book.dao;

import java.util.ArrayList;

import com.dev24.client.book.vo.BookViewVO;
import com.dev24.common.pagination.Pagination;

public interface BookDAO {
	
	public ArrayList<BookViewVO> bookViewList(Pagination pagination);
	public int getBookListCnt();
}
