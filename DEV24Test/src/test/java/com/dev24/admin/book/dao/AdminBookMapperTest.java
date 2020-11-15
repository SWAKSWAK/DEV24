package com.dev24.admin.book.dao;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dev24.client.book.dao.BookDAO;
import com.dev24.client.book.vo.BookVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AdminBookMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private BookDAO bookDAO;
	
	@Setter(onMethod_ = @Autowired)
	private AdminBookDAO adminBookDAO;
	
//	@Test
//	public void testBookList() {
//		BookViewVO bvo;
//		ArrayList<BookViewVO> bList = bookDAO.bookList();
//		log.info("bvo 가져오기");
//		
//		//모든 데이터
//		for (int i = 0 ; i < bList.size() ; i++) {
//			bvo = bList.get(i);
//			log.info(bvo.toString());
//					
//		}
//		
//		//index 0, 마지막 데이터만
//		String first = bList.get(0).toString();
//		String last = bList.get(bookList.size() - 1).toString();
//		
//		log.info(first);
//		log.info(last);
//		
//	}
	
	@Test public void testUpdateBookState() {
		log.info("testUpdateBookState 테스트 시작");
		
		BookVO bvo;

		bvo = new BookVO();
		bvo.setB_numArr(new int[] {3, 4, 5});
//		bvo.setB_stateKeyword("reg");
//		bvo.setB_stateKeyword("soldOut");
		bvo.setB_stateKeyword("outOfPrint");
		
		int result = adminBookDAO.updateBookState(bvo);
		
		log.info("result: " + result);
	}
	
}
