<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DEV 24 Purchase Detail Admin page</title>
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
	            
	            // 환불 건의 결제 금액 식별
	            for(var i=0; i<rows; i++){
	                var tr = $(".listTable > tbody > tr").eq(i);
	                var td = tr.find(".td_refund").text();
	                if(td!=""){
	                    var text = tr.find(".td_price").text();
	                    tr.find(".td_price").css("color","red").text("-"+text);
	                }
	            }
	           
	  
	        })
	    </script>
		

	</head>
	<body>
		<div id="container">
	       <div id="upper">
	            <div class="center">
	                <h2 id="tit">구매상세관리</h2>
	
	                <div id="admin_search">
	                    <form name="f_searchText" id="f_searchText" class="form-inline">
	                        <div class="form-group">
	                            <label>검색조건</label>
	                            <select name="ad_search" id="ad_search" class="form-control">
	                                <option value="all">전체</option>
	                                <option value="p_num">구매상세번호</option>
	                                <option value="b_num">도서번호</option>
	                                <option value="b_name">도서명</option>
	                                <option value="c_id">주문자ID</option>
	                                <option value="p_pmethod">결제방법</option>
	                                <option value="p_orderdate">주문상태</option>
	                                <option value="rf_num">환불번호</option>
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
	                </div><!-- admin_search -->
	
	                <div id="btnArea">
	                   <input type="button" class="btn btn-info" id="goPurchaseBtn" value="구매관리로 이동" />
	                   <input type="button" class="btn btn-success" id="goMainBtn" value="메인으로 이동" />
	                </div><!--btnArea-->
	            </div><!--center-->
	        </div><!--upper-->
	        
	        
	        <div id="content_wrap">
	           <p>구매번호 : purchase001</p> <!--p_num-->
	            <table class="listTable table table-striped" border="1">
	                <thead>
	                    <tr>
	                        <th>구매상세번호</th> <!--pd_num-->
	                        <th>도서번호</th> <!--b_num-->
	                        <th>도서명</th> <!--b_name-->
	                        <th>주문자ID</th>
	                        <th>결제방법</th>
	                        <th>수량</th> <!--무조건 1권-->
	                        <th>결제금액</th> <!--pd_price(단가)-->
	                        <th>구매날짜</th> <!--p_buydate-->
	                        <th>주문상태</th> <!--pdetail.pd_orderstate-->
	                        <th>환불번호</th> <!--주문상태 환불신청 건에 한해 rf_num-->
	                    </tr>
	                </thead>
	                <tbody>
	                    <tr>
	                        <td>pdetail001</td>
	                        <td>book01</td>
	                        <td>혼자 하는 자바</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>1</td>
	                        <td class="td_price">20,000</td>
	                        <td>2020-02-02</td>
	                        <td>환불승인대기</td>
	                        <td class="td_refund">refund01</td>
	                    </tr>
	                    <tr>
	                        <td>pdetail002</td>
	                        <td>book01</td>
	                        <td>혼자 하는 자바</td>
	                        <td>hong12</td>
	                        <td>계좌이체</td>
	                        <td>1</td>
	                        <td class="td_price">20,000</td>
	                        <td>2020-02-02</td>
	                        <td>구매확정</td>
	                        <td class="td_refund"></td>
	                    </tr>
	                    <tr>
	                        <td>pdetail003</td>
	                        <td>book23</td>
	                        <td>힘내라, 자바</td>
	                        <td>hong12</td>
	                        <td>신용카드</td>
	                        <td>1</td>
	                        <td class="td_price">12,000</td>
	                        <td>2020-02-22</td>
	                        <td>배송예정</td>
	                        <td class="td_refund"></td>
	                    </tr>
	                </tbody>
	            </table>
	        
	        </div><!--content_wrap-->
	        
	        
	        <div id="down">
	            <div class="center">
	                <label class="totalCount">총 도서개수 : <strong>2권</strong></label>
	                <label class="totalPrice">총 결제금액 : <strong>60,000원</strong></label>
	            </div><!--center-->
	        </div><!--down-->
	        
	    </div><!--container-->
	</body>
</html>