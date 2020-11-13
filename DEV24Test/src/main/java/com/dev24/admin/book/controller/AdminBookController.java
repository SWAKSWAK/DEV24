package com.dev24.admin.book.controller;

import java.util.ArrayList;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@RequestMapping("/admin/book/*")
@Log4j
@AllArgsConstructor
@SessionAttributes({"adm_id", "adm_num"})
public class AdminBookController {

	BookService bookService;

	
	/***
	 * 관리자 페이지 도서리스트 출력 메서드
	 * @param cateOne_num
	 * @param cateTwo_num
	 * @param page
	 * @param startPage
	 * @param listRange
	 * @param model
	 */
	@RequestMapping(value = "/{category}", method = RequestMethod.GET)
	public String adminBookList(
			@PathVariable String category,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int startPage,
			@RequestParam(required = false, defaultValue = "20") int listRange,
			@RequestParam(required = false, defaultValue = "best") String sort,
			Model model
	) {

		log.info("bookList 호출 성공");
		log.info(page);

		int cateOne_num = Integer.parseInt(category.charAt(0)+"");
		int cateTwo_num = Integer.parseInt(category.charAt(1)+"");

		BookVO bvo = new BookVO();
		bvo.setCateOne_num(cateOne_num);
		bvo.setCateTwo_num(cateTwo_num);
		
		// Pagination 객체 생성
		int bookLength = bookService.getBookListCnt(bvo);
		Pagination pagination = new Pagination(bookLength, startPage, page, cateOne_num, cateTwo_num, listRange, sort);

		// 얻어낸 pagination객체를 통해 bookList() 호출
		ArrayList<BookVO> bookList = bookService.bookViewList(pagination);
		
		log.info(pagination.toString());
		
		// 임시 로그인용. 프로젝트 완료 시 삭제
		model.addAttribute("adm_id", "admin");
		model.addAttribute("adm_num", 2);

		model.addAttribute("pagination", pagination);
		model.addAttribute("bookList", bookList);

		return "admin/adminBookList";

	}
	
	/***
	 * 도서 등록 폼 출력
	 * @return
	 */
	@RequestMapping(value="/bookInsertForm")
	public String bookInsertForm() {
		return "admin/bookInsertForm";
	}
	
	/***
	 * 도서정보 작성 후 등록버튼 클릭시 Insert문 실행
	 * @param bvo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/bookInsert")
	public ResponseEntity<String> bookInsert(@ModelAttribute("data") BookVO bvo, Model model) throws Exception {
		log.info("bookInsert 호출 성공");
		log.info("bvo" + bvo);
		
		int result = 0;
		String url = "";
		
		result = bookService.bookInsert(bvo);
		ResponseEntity<String> entity;
		
		if(result == 1) {
			url = "/admin/book/0/0";
			entity = new ResponseEntity<String>("redirect:" + url, HttpStatus.OK);
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		
		return entity;
	}
	
//	@RequestMapping(value="/bookDetail", method=RequestMethod.GET)
//	public String bookDetail (@ModelAttribute("data") BookVO bvo, Model model) {
//		log.info("bookDetail 호출 성공");
//		log.info("bvo" + bvo);
//		
////		BookVO detail = bookService.bookDetail(
//	}
}
