<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DEV 24 Purchase Admin page</title>
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
		

	</head>
	<body>
		<div id="container">
	        <div id="upper">
	           <div class="center">
	                <h2 id="tit">구매관리</h2>
	
	                <div id="admin_search">
	                    <form name="f_searchText" id="f_searchText" class="form-inline">
	                        <div class="form-group">
	                            <label>검색조건</label>
	                            <select name="ad_search" id="ad_search" class="form-control">
	                                <option value="all">전체</option>
	                                <option value="p_num">구매번호</option>
	                                <option value="c_id">주문자ID</option>
	                                <option value="p_pmethod">결제방법</option>
	                                <option value="p_orderdate">주문상태</option>
	                            </select>
	                            <input type="text" name="keyword" id="keyword" class="form-control" />
	                            <input type="button" id="boardSearchBtn" value="검색" class="btn btn-default" />
	                        </div>
	                    </form>
	                    <form name="f_searchDate" id="f_searchDate" class="form-inline">
	                        <div class="form-group">
	                            <label>구매날짜</label>
	                            <input type="date" name="p_buydate" id="p_buydate_start" class="form-control" /> ~ 
	                            <input type="date" name="p_buydate" id="p_buydate_end" class="form-control" />
	                            <input type="button" id="boardSearchBtn" value="검색" class="btn btn-default" />
	                        </div>
	                    </form>
	                    <form name="f_searchDate" id="f_searchDate" class="form-inline">
	                        <div class="form-group">
	                            <label>환불내역</label>
	                            <input type="radio" name="refundCheck" id="refundYes" value="Y" />Y
	                            <input type="radio" name="refundCheck" id="refundNo" value="N" />N
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
	                        <th>구매번호</th>
	                        <th>주문자ID</th>
	                        <th>결제방법</th>
	                        <th>결제금액</th> <!--sales_view 구매금액-환불금액 뷰!-->
	                        <th>구매날짜</th>
	                        <th>주문상태</th> <!--pdetail-->
	                        <th>환불내역</th> <!--p_num의 pd_num의 rf_num 존재유무-->
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>purchase1</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>20,000</td>
	                        <td>2020-05-16</td>
	                        <td>배송예정</td>
	                        <td>N</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr>
	                     <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr> <tr>
	                        <td>purchase2</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>40,000</td>
	                        <td>2020-05-06</td>
	                        <td>구매확정</td>
	                        <td>Y</td>
	                        <td>
	                            <input type="button" id="adminPdetailBtn" value="자세히" class="btn btn-default" />
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        
	        </div><!--content_wrap-->
	        
	        
	        <div id="down">
	            <div class="center">
	                <label>총 구매횟수 : <strong>2회</strong></label>
	                <label>총 결제금액 : <strong>60,000원</strong></label>
	            </div><!--center-->
	        </div><!--down-->
	    </div><!--container-->
	</body>
</html>