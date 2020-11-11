<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

	<header>
        <div id="header_wrap">
            <div id="logo"><a href="/"><img src="/resources/image/logo.png" alt="로고"></a></div>
			 
           <nav>
		      <ul id="gnb">
                <li class="dropBox" id="book">
                    <span><a href="/book">일반도서</a></span>
                    <ul class="dropmenu">
                      <li class=""><a href="#">프로그래밍 언어</a></li>
                      <li><a href="#">네트워크/해킹/보안</a></li>
                      <li><a href="#">웹사이트</a></li>
                      <li><a href="#">컴퓨터 입문/활용</a></li>
                       <li><a href="#">OS/데이터베이스</a></li>
                    </ul> <!-- dropmenu for book -->
                </li>
		        <li class="dropBox" id="ebook">
		            <span>eBook</span>
		          <ul class="dropmenu">
                      <li><a href="#">IT전문서</a></li>
                      <li><a href="#">컴퓨터 수험서</a></li>
                      <li><a href="#">웹/컴퓨터 입문&활용</a></li>
                </ul> <!-- dropmenu for ebook -->      
		      </li>
		        <li><a href="/freeboard/freeboardList">커뮤니티</a></li> <!-- 자유게시판, 공지사항/이벤트 -->
		        <li><a href="#">고객지원</a></li> <!-- 주문내역/배송조회, QnA, FAQ -->
		      </ul> <!-- gnb -->
		      
		      <ul id="util">
				    <li id="toLogin"><a href="#"><i class="far fa-user"></i>로그인</a></li>
				    <li id="toJoin"><a href="#"><i class="fas fa-user-tie"></i>회원가입</a></li>
			    <c:if test="${not empty c_id}">
				    <li id="toMypage"><a href="/mypage/mypage"><i class="fas fa-user-tie"></i>마이페이지</a></li>
				    <li><a href="/cart/cartList"><i class="fas fa-shopping-cart"></i>장바구니</a></li>
			    </c:if>
			    
			    <!-- 로그인 처리 완료 후 지울 영역** -->
			    <li id="toMypage"><a href="/mypage/mypage"><i class="fas fa-user-tie"></i>마이페이지</a></li>
				<li><a href="/cart/cartList"><i class="fas fa-shopping-cart"></i>장바구니</a></li>
			    <!-- 로그인 처리 완료 후 지울 영역** 여기까지 -->
			    
			 </ul> <!-- util -->
			   
		    </nav> <!-- nav -->
       
           <div id="h_search">
               <div id="h_search_select">
                   <select name="h_searchmenu" id="h_searchmenu">
                       <option value="">전체검색</option>
                       <option value="">검색조건1</option>
                       <option value="">검색조건2</option>
                       <option value="">검색조건3</option>
                   </select>
               </div>
               
               <div id="h_search_input"><input type="text" name="" id="h_searchtext" placeholder="검색어를 입력하세요." /></div>
               
               <button type="button" id="h_searchBtn"><i class="fas fa-search"></i></button>
               
           </div><!-- search -->
        </div><!-- header_wrap -->
    </header>