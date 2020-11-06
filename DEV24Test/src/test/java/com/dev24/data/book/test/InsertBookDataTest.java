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
	 * ���� ������ insert ���� �޼���
	 * Run As -> JUnit Test �� ����
	 **********************************************/
	@Test
	public void testInsertBookData(){
		log.info("testInsertBookData ȣ�� �Ϸ�");
		
		JSONtoDB jsonToDB = new JSONtoDB();
		
		//�׽�Ʈ �ϱ� �� InserBookDataDAO Ŭ�������� oracle id, password Ȯ�� (�ּ��� �ִ� Ŭ������ ctrl������ Ŀ�� �ø��� ���� ����)
        jsonToDB.jsonToDB("src\\test\\resources\\json\\Books.json");//�̹� ����� Json�� DB�� ����

		log.info("testInsertBookData DB���� �Ϸ�");
	}
}