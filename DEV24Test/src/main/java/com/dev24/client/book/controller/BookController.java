package com.dev24.client.book.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev24.client.book.service.BookService;
import com.dev24.client.book.vo.BookViewVO;
import com.dev24.common.pagination.Pagination;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("book")
@Log4j
@AllArgsConstructor
@SessionAttributes({ "c_id", "c_num" })
public class BookController {

	private BookService bookService;
	
	@RequestMapping(value = {"/{cateOne_num}/{cateTwo_num}", "/{cateOne_num}", ""}, method = RequestMethod.GET)
	public String bookList(
							@PathVariable int cateOne_num,
							@PathVariable int cateTwo_num,
							@RequestParam(required = false, defaultValue = "1") int page,
							Model model
							) {
		
		
		log.info("bookList ȣ�� ����");
		log.info(page);
		// Pagination ��ü ����
		Pagination pagination = new Pagination();
		int bookLength = bookService.getBookListCnt();
		pagination.pagantion(bookLength, page, cateOne_num, cateTwo_num);

		//�� pagination��ü�� ���� bookList() ȣ��
		ArrayList<BookViewVO> bookList = bookService.bookViewList(pagination);
		
		log.info(pagination.toString());
		
		// �ӽ� �α��ο�. ������Ʈ �Ϸ� �� ����
		model.addAttribute("c_id", "swak");
		model.addAttribute("c_num", "2");

		model.addAttribute("pagination", pagination);
		model.addAttribute("bookList", bookList);

		return "book/bookList";
	}

}
