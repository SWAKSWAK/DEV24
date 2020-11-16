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
import com.dev24.client.book.vo.BookVO;
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
	
	@RequestMapping(value = {"/{category}"}, method = RequestMethod.GET)
	public String bookList(
						@PathVariable("category") String category,
						@RequestParam(required = false, defaultValue = "1") int page,
						@RequestParam(required = false, defaultValue = "1") int startPage,
						@RequestParam(required = false, defaultValue = "20") int listRange,
						@RequestParam(required = false, defaultValue = "best") String b_sort,
						Model model
	) {
		int cateOne_num = 0;
		int cateTwo_num = 0;
		
		log.info("bookList 호출 성공");
		log.info("bookList(): page=" + page);
				
		if (!category.substring(0, 1).isEmpty())
			cateOne_num = Integer.parseInt(category.substring(0, 1));
		if (!category.substring(1).isEmpty())
			cateTwo_num = Integer.parseInt(category.substring(1, 2));

		log.info(cateOne_num);
		log.info(cateTwo_num);
		
		BookVO bvo = new BookVO();
		bvo.setCateOne_num(cateOne_num);
		bvo.setCateTwo_num(cateTwo_num);
		
		// Pagination 객체 생성
		int bookLength = bookService.getBookListCnt(bvo);
		log.info(bookLength);
		Pagination pagination = new Pagination(bookLength, startPage, page, cateOne_num, cateTwo_num, listRange, b_sort, "regOrOop");
		//얻어낸 pagination객체를 통해 bookList() 호출
		ArrayList<BookVO> bookList = bookService.bookList(pagination);
		log.info(bookList.toString());
		log.info(pagination.toString());
		
		// 임시 로그인용. 프로젝트 완료 시 삭제
		model.addAttribute("c_id", "swak");
		model.addAttribute("c_num", "2");

		model.addAttribute("pagination", pagination);
		model.addAttribute("bookList", bookList);

		return "book/bookList";
	}
	/*
	@RequestMapping(value="/detail/{b_num}")
	public String bookDetail(@PathVariable int b_num ,Model model) {
		BookVO vo = bookService.bookDetail(b_num);
		log.info(vo.getB_date());
		model.addAttribute("vo", vo);
		return "book/bookDetail";
	}*/
	
	@RequestMapping(value="/detail/{b_num}", method = {RequestMethod.GET, RequestMethod.POST})
	public String bookDetail(@PathVariable int b_num ,Model model) {
		BookVO vo = bookService.bookDetail(b_num);
		log.info(vo.getB_date());
		model.addAttribute("vo", vo);
		return "book/bookDetail";
	}


}
