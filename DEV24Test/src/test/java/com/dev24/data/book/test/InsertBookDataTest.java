package com.dev24.data.book.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dev24.data.book.crawler.JSONtoDB;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InsertBookDataTest{
	
	/**********************************************
	 * 도서 데이터 insert 실행 메서드
	 * Run As -> JUnit Test 로 실행
	 **********************************************/
	@Test
	public void testInsertBookData(){
		log.info("testInsertBookData 호출 완료");
		
		JSONtoDB jsonToDB = new JSONtoDB();
		
		//테스트 하기 전 InserBookDataDAO 클래스에서 oracle id, password 확인 (주석에 있는 클래스명 ctrl누르고 커서 올리면 접근 가능)
        jsonToDB.jsonToDB("src\\test\\resources\\json\\Books.json");//이미 저장된 Json을 DB로 저장

		log.info("testInsertBookData DB저장 완료");
	}
}