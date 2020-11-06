package com.dev24.data.book.dao;

import java.sql.Clob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.dev24.data.book.vo.BooksVO;

public class InserBookDataDAO {
	// 데이터베이스 연결 관련 상수 선언
	private static final String JDBC_URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";// 서버 url
	private static final String USER = "devuser";// 사용자
	private static final String PASSWD = "dev1234";// 비밀번호

	private static InserBookDataDAO instance = null;

	public static InserBookDataDAO getInstance() {
		if (instance == null)
			instance = new InserBookDataDAO();
		return instance;
	}

	public InserBookDataDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");// jdbc 드라이버
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		}

	}

	private Connection getConnection() throws Exception {
		Connection con = DriverManager.getConnection(JDBC_URL, USER, PASSWD);// 오라클 서버 연결
		return con;
	}

	/*****************************************************
	 * 책 데이터 insert 메서드
	 * 
	 * @param BooksVO를 담은 List타입
	 * @return (boolean)처리결과
	 *****************************************************/
	public boolean booksInsert(List<BooksVO> voList) {

		boolean isSuccess = false;
		int resultNum = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuilder insertQuery = new StringBuilder();
		BooksVO vo = null;

		try {

			con = getConnection();

			for (int i = 0; i < voList.size(); i++) {

				vo = voList.get(i);

				insertQuery.append("INSERT INTO book ");
				insertQuery.append("	(b_num, b_name, b_date, b_list, b_author, b_pub, b_authorinfo, ");
				insertQuery.append("	b_info, b_price, cateone_num, catetwo_num");
				insertQuery.append(") VALUES  (");
				insertQuery.append("	?, ?, ?, ?, ?, ");
				insertQuery.append("	?, ?, ?, ?, ?, ?)");

				pstmt = con.prepareStatement(insertQuery.toString());

				Clob b_list = con.createClob();
				b_list.setString(1, vo.getB_list().replace("&#31;", "#&32;"));

				Clob b_authorinfo = con.createClob();
				b_authorinfo.setString(1, vo.getB_authorinfo().replace("&#31;", "#&32;"));

				Clob b_info = con.createClob();
				b_info.setString(1, vo.getB_info().replace("&#31;", "#&32;"));

				String b_date = vo.getB_date().replace("년 ", "-").replace("월 ", "-").replace("일", "").substring(0, 10);

				System.out.println("[book:b_num]" + vo.getB_num());

				pstmt.setInt(1, vo.getB_num());
				pstmt.setString(2, vo.getB_name());
				pstmt.setDate(3, Date.valueOf(b_date));
				pstmt.setClob(4, b_list);
				if (vo.getB_author().isEmpty())
					vo.setB_author("편집부");
				pstmt.setString(5, vo.getB_author());
				pstmt.setString(6, vo.getB_pub());
				pstmt.setClob(7, b_authorinfo);
				pstmt.setClob(8, b_info);
				pstmt.setInt(9, vo.getB_price());
				pstmt.setInt(10, vo.getCateone_num());
				pstmt.setInt(11, vo.getCatetwo_num());

				resultNum = pstmt.executeUpdate();

				insertQuery.setLength(0);// StringBuilder 값 초기화
				pstmt.clearParameters();
				pstmt.close();

				insertQuery.append("INSERT INTO bookimg ");
				insertQuery.append("	(b_num, ");
				insertQuery.append("	listcover_imgurl, detailcover_imgurl, detail_imgurl");
				insertQuery.append(") VALUES  (");
				insertQuery.append("	?, ?, ?, ?)");

				pstmt = con.prepareStatement(insertQuery.toString());

				String listCover = "/resources/bookimg/" + vo.getCateone_num() + "/" + vo.getCatetwo_num() + "/"
						+ vo.getB_num() + "-listcover.jpg";
				String detailCover = "/resources/bookimg/" + vo.getCateone_num() + "/" + vo.getCatetwo_num() + "/"
						+ vo.getB_num() + "-detailcover.jpg";
				String detail = "/resources/bookimg/" + vo.getCateone_num() + "/" + vo.getCatetwo_num() + "/"
						+ vo.getB_num() + "-detail.jpg";

				pstmt.setInt(1, vo.getB_num());

				if (vo.getListcover_imgurl() != null) {
					pstmt.setString(2, listCover);
				} else {
					pstmt.setString(2, null);
				}
				if (vo.getDetailcover_imgurl() != null) {
					pstmt.setString(3, detailCover);
				} else {
					pstmt.setString(3, null);
				}
				if (vo.getDetail_imgurl() != null) {
					pstmt.setString(4, detail);
				} else {
					pstmt.setString(4, null);
				}

				System.out.println("URL: " + vo.getURL());
				System.out.println("b_name: " + vo.getB_name());
				System.out.println("vo.toString(): " + vo.toString());
				System.out.println(insertQuery.toString());

				System.out.println("URL: " + vo.getURL());
				System.out.println("b_name: " + vo.getB_name());
				System.out.println("vo.toString(): " + vo.toString());
				System.out.println(insertQuery.toString());
				resultNum = pstmt.executeUpdate();

				insertQuery.setLength(0);// StringBuilder 값 초기화
				pstmt.clearParameters();
				pstmt.close();
				System.out.println("[1]pstmt.isClose=" + pstmt.isClosed() + ", con.isClosed()=" + con.isClosed());

				System.out.println(vo.getB_name() + ", 도서정보 DB저장 완료(voList.size:" + voList.size() + ")");
			}

			if (resultNum == 1)
				isSuccess = true;

			System.out.println("========================DB저장 완료 ====================");

		} catch (SQLException se) {
			System.out.println("[booksInsert() 쿼리ERROR]" + se);
			se.printStackTrace();
		} catch (Exception e) {
			System.out.println("[booksInsert() ERROR]" + e);
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println("[booksInsert() DB연동 해제 ERROR]" + e);
				e.printStackTrace();
			}
		}
		return isSuccess;
	}
}
