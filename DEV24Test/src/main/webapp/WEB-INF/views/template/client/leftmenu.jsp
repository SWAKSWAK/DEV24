<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

		<div id="sidemenu_wrap">
           <div id="tit_mypage">
               <div id="mypage_img">
                   <span>${c_id}님, 반갑습니다.</span>
                   <img src="/resources/image/member.jpg" />
               </div>
           </div> <!--tit_mypage-->
           
           <div id="info_mypage">
               <div class="info">
                  <p class="tit">주문내역</p>
                   <ul>
                       <li><a href="#">주문내역조회</a></li>
                       <li><a href="#">환불신청/취소내역조회</a></li>
                       <li><a href="#">장바구니 바로가기</a></li>
                   </ul>
               </div>

               <div class="info">
                  <p class="tit">나의 ebook</p>
                   <ul>
                       <li><a href="#">나의 ebook 서재</a></li>
                   </ul>
               </div>

               <div class="info">
                  <p class="tit">나의 정보</p>
                   <ul>
                       <li><a href="#">회원정보</a></li>
                       <li><a href="#">회원탈퇴</a></li>
                       <li><a href="#">내가 쓴 글</a></li> <!--답변글포함-->
                       <li><a href="#">내가 쓴 댓글</a></li> <!--없애도 됨-->
                   </ul>
               </div>

               <div id="info2">
                   <a href="#"><span>나의 문의내역</span></a>
                   <a href="#"><span>나의 리뷰</span></a>
               </div>
               
           </div><!--info_mypage-->
       </div> <!--sidemenu_wrap-->