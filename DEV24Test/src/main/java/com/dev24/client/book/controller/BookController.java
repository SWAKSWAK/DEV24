package com.dev24.client.book.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev24.client.book.service.BookService;
import com.dev24.client.book.vo.BookVO;
import com.dev24.client.book.vo.BookViewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("book/*")
@AllArgsConstructor
public class BookController {

	private BookService bookService;

	@RequestMapping(value="/1", method = RequestMethod.GET)
	public String bookList(@ModelAttribute("data") BookVO bvo, Model model) {
		ArrayList<BookViewVO> bookList = bookService.bookViewList();
		model.addAttribute("bookList", bookList);
		
		return "book/bookList";
	}

}
