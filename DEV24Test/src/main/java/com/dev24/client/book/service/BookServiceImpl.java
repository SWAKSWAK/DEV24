package com.dev24.client.book.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev24.client.book.dao.BookDAO;
import com.dev24.client.book.vo.BookViewVO;
import com.dev24.common.pagination.Pagination;

import lombok.Setter;

@Service
public class BookServiceImpl implements BookService{

	@Setter(onMethod_=@Autowired)
	private BookDAO bookDAO;
	
	@Override
	public ArrayList<BookViewVO> bookViewList(Pagination pagination) {
		ArrayList<BookViewVO> list = bookDAO.bookViewList(pagination);
		return list;
	}
	
	@Override
	public int getBookListCnt() {
		int result = bookDAO.getBookListCnt();
		return result;
	}
}
