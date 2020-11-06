package com.dev24.data.book.crawler;

import java.io.File;
import java.util.List;

import com.dev24.data.book.dao.InserBookDataDAO;
import com.dev24.data.book.vo.BooksVO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class JSONtoDB {

	/********************************************************************
	 * JSON�� ��Ƴ��� �����͸� DB�� �ű�� �޼ҵ�. DAO�� ȣ�����ִ� �۾��� �Ѵ�.
	 * 
	 * @param filePath: ����Ǿ��ִ� ��� + ���ϸ�
	 ********************************************************************/
	public void jsonToDB(String filePath) {
		ObjectMapper mapper = new ObjectMapper();
		InserBookDataDAO dao = new InserBookDataDAO();

		try {
			File file = new File(filePath);
			
			//���� ��� üũ��
//			System.out.println(file.getAbsolutePath());
			
			// JSON to VO
			List<BooksVO> voList = mapper.readValue(file, new TypeReference<List<BooksVO>>() {
			});

			// InserBookDataDAO.bookInsert()ȣ��
			dao.booksInsert(voList);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
