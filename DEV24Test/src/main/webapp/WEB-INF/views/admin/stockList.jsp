<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 문서 유형 : 현재 웹 문서가 어떤 HTML 버전에 맞게 작성되었는지를 알려준다. -->

<!--<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
     DTD 선언문이 HTML 페이지의 가장 첫 라인에 명시되어야 웹 브라우저가 HTML 버전을 인식.
     HTML태그나 CSS를 해당 버전에 맞도록 처리하므로 웹 표준 준수를 위하여 반드시 명시되어야 한다.-->
<html lang="ko">
   <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
      
      <title>DEV 24 Stock Admin page</title>
         
         <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
         <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
    
         <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
         <script type="text/javascript" src="/resources/include/dist/js/bootstrap.js"></script>
         <script type="text/javascript" src="/resources/include/js/common.js"></script>
		 <!-- 부트스트랩  -->         
      <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <![endif]-->
      
      <script type="text/javascript">
      
	      $(function(){
	    	  var d = new Date();

	    	  var month = d.getMonth()+1;
	    	  var day = d.getDate();
	    	  var time = d.getTime();
	    	  
	    	  var now = new Date(Date.now());
	    	  var formatted = now.getHours() + ":" + now.getMinutes() + ":" + now.getSeconds();
	    	  if(now.getHours() == 0){
	    		  formatted = "0"+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
	    	  }
	    	  if(now.getMinutes()<10){
	    		  formatted = now.getHours()+":"+"0"+now.getMinutes()+":"+now.getSeconds();
	    	  }
	    	  if(now.getSeconds()<10){
	    		  formatted = now.getHours()+":"+"0"+now.getMinutes()+":"+"0"+now.getSeconds();
	    	  }
	    		  
	    	  
	    	  // 20:10:58
	    	  var output = d.getFullYear() + '/' +
	    	      (month<10 ? '0' : '') + month + '/' +
	    	      (day<10 ? '0' : '') + day+':' +formatted;
	    	  
	    	  $("#date").text(output); //가공된 형식으로 출력한다. (2020/11/01[12:36:42])
	    	  //$("#date").text(d);
	    	  
	    	  $("#goHome").click(function(){
	    		  location.href="../jsp/adminPage.jsp";
	    	  });
	    	  
	    	  	    	      
	    	  // 재고 확인용 함수 chkStock 
	    	  
	    	 function chkStock(item, msg) {
				if($(item).val().replace(/\s/g,"")=="" || parseInt($(item).val()) <0 ) {
					alert(msg+" 입력해주세요.");
					item.val("");
					item.focus();
					return false; //값이 비어있을 경우 false를 반환
				} else {
					return true;
				}
			}
	    	  
	    	  //재고 등록 값 전달하는 ajax
	    	  
	    	  $("#submitBtn").click(function(){
	    		 console.log($("#b_num").val()); 
	    		 console.log($("#stk_qty").val()); 
	    		 console.log($("#adm_num").val()); 
	    		 console.log($("#stk_salp").val()); 
	    		 
	    		 if(!chkSubmit("#stk_qty", "입고수량을")) return;
	    		 else if (!chkSubmit("#stk_salp", "판매가격을"))return;
	    		 else if(!chkStock("#stk_qty", "판매")) return;
	    			 
	    		 else{
	    			 $.ajax({
	    				url:"../jsp/stockAdmin.jsp", 
	    				type: "post",
	    				data: {
	    					b_num : $("#b_bum").val(), 
	    					stk_qty: $("#stk_qty").val(), 
	    					adm_num: $("#adm_num").val(), 
	    					stk_salp: $("#stk_salp").val()
	    				},
	    				dataType:"text",
	    				success:function(){
	    					alert("데이터 전송 완료");
	    				},
	    			 });
	    		 }
	    	  });
	    	  
	    	  //도서 상세 정보 버튼을 클릭시 도서코드를 전달해주는 구문
	    	  $("#stockDetail").click(function(){
	    		  console.log($("#stk_incp").val());
	    	  });
	    	  
	      });
      	
	      
	     
	     </script>
      
      
      <style type="text/css">
			.panel-body{background-color: white;}     
			#b_num, #b_name, #catetwo_num, #stk_regdate {height:33px;}
			.searchCategory{padding:15px; float:left;}
			#table{ padding:10px;}
			
			.bookStockImg{
				display: block;
				margin-left: auto;
				margin-right: auto;
				width: 30%;
				height:30%;
			}
			
			#title{
				text-align: center;
			}
			  
      </style>
      
      
      
   </head>
   <body>
   		
		<!-- model form -->
		<h1 id="title"> 재고등록 페이지</h1>
		
		<div class="row">
			<div class="col-sm-5">
				<div class="panel-body">
				    <!-- button to generate model form -->
				    <a href="#myModal" data-toggle="modal" class="btn btn-s btn-success">재고등록</a>
				    <input type="button" name="goHome" id="goHome" class="btn btn-s btn-success" value="관리자페이지 "/>
				
				    <!-- model form settings-->
				
				    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
				        <%-- <div class="modal-dialog"> --%>
				        <div class="modal-dialog modal-lg">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
				                    <h4 class="modal-title">도서 재고 신규 등록</h4>
				                </div>
				                <div class="modal-body">
				
				    <!-- actual form  -->
				    				<%-- jstl 호황 테스팅을 위한 표현식 변수 선언 
				    				<c:set var="b_title" scope="session" value="강자바의 자바 조지기"/>
				    				<c:set var="b_author" scope="session" value="강자바"/>
				    				<c:set var="b_pub" scope="session" value="강자바 컴퍼니"/>
				    				<c:set var="b_num" scope="session" value="411"/>
				    				<c:set var="adm_name" scope="session" value="강자바"/>
				    				<c:set var="adm_num" scope="session" value="2"/>
				    				--%>
				    				
				    				
				                    <form role="form">
				                        <div class="form-group">
				                            <label>상품코드</label>
				                           	<select class="form-control" name="b_num" id="b_num">
					                            <c:choose>
						                           	<c:when test="${not empty bookstockList}">
														<c:forEach var="bookinfo" items="${bookstockList}">
					                            			<option value="${bookinfo.b_num}"> ${bookinfo.b_name} / ${bookinfo.b_author} / ${bookinfo.b_pub} </option>
														</c:forEach>
						                            </c:when>
					                            </c:choose>
				                            </select>
				                        </div>
				                        <div class="form-group">
				                            <label>입고수량</label>
				                            <input class="form-control" placeholder="재고수량 입력" type="number" min="1" name="stk_qty" id="stk_qty">
				                        </div>
				                        <div class="form-group">
				                            <label for="exampleInputFile">재고 등록자명</label>
				                            <input type="hidden" value="${adm_num}" name="adm_num" id="adm_num"/>
				                            <p>${adm_name} 관리자</p>
				                            <p class="help-block" style=color:red;>도서의 재고는 한번 입력시 수정이 불가합니다. 신중히 등록을 해주세요</p>
				                        </div>
				                        
				                        <div class="form-group">
				                        	<label>등록일자</label>
				                        	 <p id="date"></p>
				                        </div>
				                        
				                        <div class="form-group">
				                        	<label>판매가격</label>
				                        	<input type="number" class="form-control" placeholder="판매가격 입력 " name="stk_salp" id="stk_salp"/>
				                        </div>
				                        <input type="button" class="btn btn-default" value="도서등록" name="submitBtn" id="submitBtn"/>
				                    </form>
				    <!-- actual form ends -->
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		</div>
		
		 <!-- 여기서부터가 우리가 입력할 body 부분 시작. 재고 리스트를 여기에 출력 -->
		<div>
			
			<div>
				<form name="searchForm" id="searchForm">
					
										
					<div class="searchCategory">				
						<label for="b_num">도서코드: </label>
						<input type="text" name="b_num" id="b_num" placeholder="도서 코드를 입력하세요 "/>
						<input type="button" name="searchBNum" id="searchBNum" value="검색" class="btn btn-info" />
					</div>	
					
					<div class="searchCategory">
						<label for="b_name">도서명: </label>
						<input type="text" name="b_name" id="b_name" placeholder="도서제목을 입력하세요"/>
						<input type="button" name="searchBName" id="searchBName" value="검색" class="btn btn-info"/>
					</div>
					
					<div class="searchCategory">
						<label for="stk_regdate">등록일자</label>
						<input type="date" name="stk_regdate" id="stk_regdate" />
						<input type="button" name="searchStkRegdate" id="searchStkRegdate" value="검색" class="btn btn-info"/>
					</div>
					
					<div class="searchCategory">
						<label for="catetwo_num">도서 카테고리</label>
						<select name="catetwo_num" id="catetwo_num">
							<option value="1">프로그래밍 언어</option>
							<option value="2">OS/데이터베이스</option>
							<option value="3">웹프로그래밍</option>
							<option value="4">컴퓨터 입문/활용</option>
							<option value="5">네크워크/해킹/데이터베이스</option>
							<option value="6">IT 전문서</option>
							<option value="7">컴퓨터 수험서</option>
							<option value="8">웹/컴퓨터/입문 활용</option>
						</select>
						<input type="button" name="searchStkCate" id="searchStkCate" value="검색" class="btn btn-info"/>
					</div>
					
				</form>
				
			<%--
			=================================================================
			
			-----------책 목록 화면의 테이블을 위한 쿼리문------------------------------
			
			-----관리자명 제외 불러오는 쿼리---------------------
			select stock.stk_incp, book.b_name, book.b_author, stock.stk_qty, 
			stock.stk_salp, book.cateone_num, book.catetwo_num,stock.adm_num, stock.stk_regdate
			from book
			inner join stock
			on book.b_num=stock.stk_incp;
			------------------------------------------------------------------
			
			-------------관리자 테이블에서 관리자명을 불러오는 쿼리-----------------------
			select adm_name from admin
			inner join stock 
			on stock.adm_num=admin.adm_num;
			------------------------------------------------------------------
			
			==================================================================
			
			
			=================================================================
			
			---------검색기능을 위한 쿼리문 ----------------------------------------
			
			----도서번호 검색----------------------------------------------------
			select stock.stk_incp, book.b_name, book.b_author, stock.stk_qty, 
			stock.stk_salp, book.catetwo_num,  book.cateone_num, stock.adm_num, 
			stock.stk_regdate 
			from book
			inner join stock
			on book.b_num=stock.stk_incp where stock.stk_incp like ?;
			------------------------------------------------------------------
			
			
			-----------도서제목 검색---------------------------------------------
			select stock.stk_incp, book.b_name, book.b_author, stock.stk_qty, 
			stock.stk_salp, book.catetwo_num,  book.cateone_num, stock.adm_num,
			stock.stk_regdate 
			from book
			inner join stock
			on book.b_num=stock.stk_incp where book.b_name like '?%';
			------------------------------------------------------------------
			
			-------------작가별 검색---------------------------------------------
			select stock.stk_incp, book.b_name, book.b_author, stock.stk_qty, 
			stock.stk_salp, book.catetwo_num,  book.cateone_num, stock.adm_num,
			stock.stk_regdate 
			from book
			inner join stock
			on book.b_num=stock.stk_incp where book.b_author like '김%';
			------------------------------------------------------------------
			
			
			-------등록일자 검색--------------------------------------------------
			select stock.stk_incp, book.b_name, book.b_author, stock.stk_qty, 
			stock.stk_salp, book.catetwo_num,  book.cateone_num, stock.adm_num,
			stock.stk_regdate 
			from book
			inner join stock
			on book.b_num=stock.stk_incp where stock.stk_regdate >= trunc(to_date('2020/10/29', 'yyyy/mm/dd'));
			-------------------------------------------------------------------
			
			
			------카테고리 검색---------------------------------------------------
			select stock.stk_incp, book.b_name, book.b_author, stock.stk_qty, 
			stock.stk_salp, book.catetwo_num,  book.cateone_num, stock.adm_num,
			stock.stk_regdate 
			from book
			inner join stock
			on book.b_num=stock.stk_incp where book.catetwo_num like ?; 
			-------------------------------------------------------------------
			
			--------판매가격 검색--------------------------------------------------
			select stock.stk_incp, book.b_name, book.b_author, stock.stk_qty, 
			stock.stk_salp, book.catetwo_num,  book.cateone_num, stock.adm_num,
			stock.stk_regdate 
			from book
			inner join stock
			on book.b_num=stock.stk_incp where stock.stk_salp like ?;
			-------------------------------------------------------------------
			
			
			------------- 책 상세정보 쿼리-----------------------------------------------------------------------------------------------
			create view stock_book_info as 
			select book.b_num, book.b_name, book.b_author, book.b_pub, book.catetwo_num, book.cateone_num, bookimg.listcover_imgurl 
			from book 
			inner join bookimg
			on bookimg.b_num = book.b_num;
			
			select*from stock_book_info where b_num=4;
			------------------------------------------------------------------------------------------------------------------------
			
			
			 --%>
			
			<%-- 도서 재고 현황 테이블 시작 --%>
			<br/>
			<br/>
		<div id="table">			 			 
			<h1>도서재고 현황</h1>
				<table class="table table-striped">
					<thead>
					    <tr>
					    	<th></th> <!-- input type hidden 을 숨기기 위한 코드  -->
					    	<th>도서코드</th>
					    	<th>제목</th>
					    	<th>작가</th>
					    	<th>재고수량</th>
					    	<th>입고가격</th>
					    	<th>분류</th>
					    	<th>카테고리</th>
					    	<th>등록자(관리자)명</th>
					    	<th>등록일자</th>
					 	</tr>
				    </thead>
				    
				    <tbody>
				    	<c:choose>
				    		<c:when test="${not empty stockList }">
						     	<c:forEach var="book" items="${stockList}" varStatus="status" >
							    	<tr>
							    		<td><input type="hidden" id="stk_incp" value="${book.stk_incp}"/></td>
							    		<td> ${book.stk_incp}</td>
							    		<td>${book.b_name}</td>
							    		<td>${book.b_author }</td>
							    		<td>${book.stk_qty} 권</td>
							    		<td>${book.stk_salp}</td>
							    		<td>${book.cateone_num }</td>
							    		<td>${book.catetwo_num }</td>
							    		<td>${book.adm_num}</td>
							    		<td>${book.stk_regdate}</td>
							    		<%--><td><input type="button" id="stkDetail" name="stkDetail" value="도서상세보기"/></td>  --%>
							    		<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">도서 상세정보</button></td>
							    	</tr>
							    	</c:forEach>
							   </c:when> 	
				    	</c:choose>
				    </tbody>
				  </table>
		</div>
	 	</div>
	</div>
	<hr>	
	
	
	<!-- 도서 상세보기 Modal 부분 -->
	
	<!-- Large modal -->

	
	<%--
		--------------------재고 도서 상세 정보를 위한 쿼리문----------------------------------------------------------
		
		----stock_book_info view 생성 -------------------------------------------------------------------------
		create view stock_book_info as 
		select book.b_num, book.b_name, book.b_date, 
		book.b_author, book.b_pub, book.b_price, book.cateone_num, book.catetwo_num, bookimg.listcover_imgurl 
		from book 
		inner join 
		bookimg 
		on book.b_num=bookimg.b_num;
		-----------------------------------------------------------------------------------------------------
		
		------------도서 코드로 상세정보를 보여줄 모달을 위한 쿼리---------------------------------------------------------
		select b_num, b_name, b_date, b_author, b_pub, b_price, cateone_num, listcover_imgurl 
		from stock_book_info where b_num=3; 
		-----------------------------------------------------------------------------------------------------
		
	 --%>
		
	
		<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-header" id="exampleModalLongTitle">도서 정보</h1>
					</div>
					<img src="/resources/bookimg/1/2/122-listcover.jpg" class="bookStockImg"/>
				</div>
			</div>
		</div>

	
   </body>
</html>
    