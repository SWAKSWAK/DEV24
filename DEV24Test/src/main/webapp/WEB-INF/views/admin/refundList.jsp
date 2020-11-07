<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DEV 24 Refund Admin page</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다.(조건부주석) -->
		<!--[if lt IE 9]>
			<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
         <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.css" />
          <link rel="stylesheet" href="css/adminPage.css">
   		 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
         <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
         <script type="text/javascript" src="/resources/include/dist/js/bootstrap.js"></script>
         <script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script>
    
	        $(function(){
	            var rows = $(".listTable > tbody > tr").length;
	            console.log(rows);
	            
	            // 환불승인대기 건 식별하기
	            for(var i=0; i<rows; i++){
	                var orderstate = $("tbody td.td_orderstate").eq(i);
	                if(orderstate.text()=="환불승인대기"){
	                    orderstate.css({
	                        "color":"red",
	                        "font-weight":"bold"
	                    });
	                };
	            };
	            
	        })
    </script>
		

	</head>
	<body>
		<div id="container">
	       <div id="upper">
	            <div class="center">
	                <h2 id="tit">환불관리</h2>
	
	                <div id="admin_search">
	                    <form name="f_searchText" id="f_searchText" class="form-inline">
	                        <div class="form-group">
	                            <label>검색조건</label>
	                            <select name="ad_search" id="ad_search" class="form-control">
	                                <option value="all">전체</option>
	                                <option value="rf_num">환불번호</option>
	                                <option value="p_num">구매상세번호</option>
	                                <option value="b_num">도서번호</option>
	                                <option value="b_name">도서명</option>
	                                <option value="c_id">주문자ID</option>
	                                <option value="rf_reason">환불사유</option>
	                                <option value="p_orderdate">주문상태</option>
	                            </select>
	                            <input type="text" name="keyword" id="keyword" class="form-control" />
	                            <input type="button" id="boardSearchBtn" value="검색" class="btn btn-default" />
	                        </div>
	                    </form>
	                    <form name="f_searchDate" id="f_searchDate" class="form-inline">
	                        <div class="form-group">
	                            <label>승인날짜</label>
	                            <input type="date" name="p_buydate" id="p_buydate_start" class="form-control" /> ~ 
	                            <input type="date" name="p_buydate" id="p_buydate_end" class="form-control" />
	                            <input type="button" id="boardSearchBtn" value="검색" class="btn btn-default" />
	                        </div>
	                    </form>
	                </div><!-- admin_search -->
	
	                <div id="btnArea">
	                   <input type="button" class="btn btn-success" id="goMainBtn" value="메인으로 이동" />
	                </div><!--btnArea-->
	            </div><!--center-->
	        </div><!--upper-->
	        
	        
	        <div id="content_wrap">
	            <table class="listTable table table-striped" border="1">
	                <thead>
	                    <tr>
	                        <th>환불번호</th> <!--rf_num-->
	                        <th>구매상세번호</th> <!--pd_num-->
	                        <th>도서번호</th> <!--b_num-->
	                        <th>도서명</th> <!--b_name-->
	                        <th>주문자ID</th>
	                        <th>환불금액</th> <!--rf_price(단가)-->
	                        <th>환불사유</th> <!--rf_reason-->
	                        <th>승인날짜</th> <!--rf_confirmdate-->
	                        <th>주문상태</th> <!--pdetail.pd_orderstate-->
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>refund02</td>
	                        <td>pdetail012</td>
	                        <td>book20</td>
	                        <td>혼자 하는 자바</td>
	                        <td>hong12</td>
	                        <td>15,000</td>
	                        <td class="text-left">단순변심</td>
	                        <td>2020-03-10</td>
	                        <td class="td_orderstate">환불승인대기</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="승인" class="btn btn-primary" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>refund01</td>
	                        <td>pdetail612</td>
	                        <td>book77</td>
	                        <td>화이팅 자바!</td>
	                        <td>hong12</td>
	                        <td>19,000</td>
	                        <td class="text-left">포장이 부실해서 제품이 망가짐.</td>
	                        <td>2020-03-25</td>
	                        <td class="td_orderstate">승인완료</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="승인" class="btn btn-primary" />
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        
	        </div><!--content_wrap-->
	        
	        
	        <div id="down">
	            <div class="center">
	                <label class="totalCount">총 환불건수 : <strong>2건</strong></label>
	                <label class="totalPrice">총 환불금액 : <strong>60,000원</strong></label>
	            </div><!--center-->
	        </div><!--down-->
	        
	    </div><!--container-->
	</body>
</html>