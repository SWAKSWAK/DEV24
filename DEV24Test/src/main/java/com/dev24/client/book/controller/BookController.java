package com.dev24.client.book.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dev24.client.book.service.BookService;
import com.dev24.client.book.vo.BookVO;
import com.dev24.client.book.vo.BookViewVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("book/*")
@AllArgsConstructor
@SessionAttributes({"c_id", "c_num"})

public class BookController {

	private BookService bookService;

	@RequestMapping(value="/1", method = RequestMethod.GET)
	public String bookList(@ModelAttribute("data") BookVO bvo, Model model) {
		ArrayList<BookViewVO> bookList = bookService.bookViewList();
		
		//임시 로그인용.  프로젝트 완료 시 삭제
		model.addAttribute("c_id", "swak");
		model.addAttribute("c_num", "2");
		
		model.addAttribute("bookList", bookList);
		
		return "book/bookList";
	}

}
