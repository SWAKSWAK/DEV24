<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다.(조건부주석) -->
		<!--[if lt IE 9]>
			<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<!-- <link rel="stylesheet" href="/resources/include/css/style_mypage.css" /> -->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    	<script src="/resources/include/js/jquery-3.5.1.min.js"></script>
		<script src="https://kit.fontawesome.com/a333e3670c.js" crossorigin="anonymous"></script>
		

	</head>
	<body>
		<div id="content_mypage">
           <div class="contentArea">
                <div class="tit_mypage">
                    <h3>최근 주문내역</h3>
                    <a href="#">&gt;&nbsp; 더보기</a>
                </div>

                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>주문일자</th>
                            <th>주문번호</th>
                            <th>주문내역</th>
                            <th>주문상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2020-10-10</td>
                            <td class="td_num">001</td>
                            <td class="td_title">혼자 하는 자바 <span class="other">외 2종</span></td>
                            <td>배송예정</td>
                        </tr>
                    </tbody>
                </table>
            </div> <!-- contentArea -->
            
            <div class="contentArea">
                <div class="tit_mypage">
                    <h3>환불신청내역</h3>
                    <a href="#">&gt;&nbsp;더보기</a>
                </div>

                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>주문일자</th>
                            <th>주문번호</th>
                            <th>주문내역</th>
                            <th>주문상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2020-10-10</td>
                            <td class="td_num">045</td>
                            <td class="td_title">혼자 하는 자바 <span class="other">외 2종</span></td>
                            <td>승인대기</td>
                        </tr>
                    </tbody>
                </table>
            </div> <!-- contentArea -->
            
            <div class="contentArea">
                <div class="tit_mypage">
                    <h3>나의 문의</h3>
                    <a href="#">&gt;&nbsp;더보기</a>
                </div>

                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>문의일자</th>
                            <th>문의제목</th>
                            <th>답변상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>2020-10-10</td>
                            <td class="td_title td_num">배송관련 질문</td>
                            <td>답변완료</td>
                        </tr>
                    </tbody>
                </table>
            </div> <!-- contentArea -->
            
            <!--****************** 주문내역 조회 부분 시작****************-->
            
            <div id="orderHistory">
                <div class="tit_mypage">
                    <h3>주문내역조회</h3>
                </div>
                
                <div id="orderdate">
                   <div id="orderdate_rows">
                        <div id="orderdate_row1">
                            <ul>
                                <li class="on">최근1주일</li>
                                <li>1개월</li>
                                <li>3개월</li>
                                <li>6개월</li>
                            </ul>
                            <div id="dateRange">
                                <input type="date" id="orderdate_start" name="orderdate_start" />
                                &nbsp;~&nbsp;
                                <input type="date" id="orderdate_end" name="orderdate_end" />
                            </div> <!--dateRange-->
                        </div><!--orderdate_row1-->

                        <div id="orderdate_row2">
                            <select name="order_searchmenu" id="order_searchmenu" class="form-control">
                               <option value="">주문전체</option>
                               <option value="">주문자</option>
                               <option value="">수령자</option>
                               <option value="">주문번호</option>
                           </select>
                           <input type="text" id="purchaseSearchbox" name="purchaseSearchbox" class="form-control" />
                           <input type="button" id="purchaseSearchBtn" name="purchaseSearchBtn" class="btn btn-primary" value="조회" />
                        </div><!--orderdate_row2-->
                    
                    </div> <!--orderdate_rows-->
                </div><!--orderdate 상단 주문일자 조회-->
                
                <div id="orderby">
                    <span>정렬기준</span>
                    <select name="orderby_when" id="orderby_when">
                        <option value="">최근순</option>
                        <option value="">과거순</option>
                    </select>
                    <span>주문상태</span>
                    <select name="orderby_state" id="orderby_state">
                        <option value="">전체</option>
                        <option value="">배송예정</option>
                        <option value="">배송중</option>
                        <option value="">구매확정</option>
                    </select>
                </div> <!--orderby 주문일자 정렬기준-->
                
                
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>주문번호</th>
                            <th>주문일자</th>
                            <th>주문내역</th>
                            <th>주문금액/수량</th>
                            <th>주문상태</th>
                            <th>주문자</th>
                            <th>수령자</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="td_num">568</td>
                            <td>2020-05-04</td>
                            <td class="td_title">혼자 하는 자바 <span class="other">외 2종</span></td>
                            <td>13,500/2</td>
                            <td class="td_orderdate">배송중
                                <input type="button" name="refundInsertFormBtn" class="btn btn-default" value="환불신청" />
                            </td>
                            <td>홍길동</td>
                            <td>이순신</td>
                            <td class="td_buttons">
                                <input type="button" name="reviewInsertFormBtn" class="btn btn-default" value="리뷰작성" /> <!--구매확정 시에만 가능-->
                            </td>
                        </tr>
                        <tr>
                            <td class="td_num">599</td>
                            <td>2020-05-01</td>
                            <td class="td_title">혼자 하는 JSP <span class="other">외 2종</span></td>
                            <td>15,000/2</td>
                            <td class="td_orderdate">배송예정
                                <input type="button" name="purchaseCancelBtn" class="btn btn-default" value="주문취소" />
                            </td>
                            <td>홍길동</td>
                            <td>이순신</td>
                            <td class="td_buttons">
                                <input type="button" name="reviewInsertFormBtn" class="btn btn-default" value="리뷰작성" /> <!--구매확정 시에만 가능-->
                            </td>
                        </tr>
                    </tbody>
                </table>
                
                
                <div id="orderstate_explain">
                    <div id="tit_explain"><span>주문상태</span></div>
                    
                    <ul>
                        <li class="state">배송예정<span>주문취소가능</span></li>
                        <li class="stateFlow"> &gt; </li>
                        <li class="state">배송중<span>환불신청가능</span></li>
                        <li class="stateFlow"> &gt; </li>
                        <li class="state">구매확정<span>환불신청가능</span></li>
                    </ul>
                    
                    <!--'배송예정' [→ '주문취소'] → '배송중' → '구매확정' [→ '반품/환불신청' → '승인대기' → '승인완료' → '주문취소'] -->
                </div> <!--orderstate_explain-->
                
            </div> <!--orderHistory-->
            
            <!--****************** 주문내역 조회 부분 끝****************-->
            
        </div><!--content_mypage-->
	</body>
</html>