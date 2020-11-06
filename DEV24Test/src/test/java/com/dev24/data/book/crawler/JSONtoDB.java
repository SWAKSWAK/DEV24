package com.dev24.data.book.crawler;

import java.io.File;
import java.util.List;

import com.dev24.data.book.dao.InserBookDataDAO;
import com.dev24.data.book.vo.BooksVO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JSONtoDB {

	/********************************************************************
	 * JSON에 담아놓은 데이터를 DB로 옮기는 메소드. DAO를 호출해주는 작업을 한다.
	 * 
	 * @param filePath: 저장되어있는 경로 + 파일명
	 ********************************************************************/
	public void jsonToDB(String filePath) {
		ObjectMapper mapper = new ObjectMapper();
		InserBookDataDAO dao = new InserBookDataDAO();

		try {
			File file = new File(filePath);
			
			//저장 경로 체크용
//			System.out.println(file.getAbsolutePath());
			
			// JSON to VO
			List<BooksVO> voList = mapper.readValue(file, new TypeReference<List<BooksVO>>() {
			});

			// InserBookDataDAO.bookInsert()호출
			dao.booksInsert(voList);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
