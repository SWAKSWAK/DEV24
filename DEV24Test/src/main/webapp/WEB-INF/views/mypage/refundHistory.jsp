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
		<script>
			$(function(){
				var successMsg = "${successMsg}";
				if(successMsg!=""){
					alert(successMsg);
					successMsg = "";
				}
			}); // 최상위 종료
		</script>		

	</head>
	<body>
		 <!--****************** 환불내역 조회 부분 시작****************-->
          <div id="content_mypage">
            <div id="refundHistory">
                <div class="tit_mypage">
                    <h3>환불내역조회</h3>
                </div>
                
                <form name="f_search" id="f_search">
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
                                <input type="date" id="date_start" name="date_start" />
                                &nbsp;~&nbsp;
                                <input type="date" id="date_end" name="date_end" />
                            </div> <!--dateRange-->
                        </div><!--orderdate_row1-->

                        <div id="orderdate_row2">
                            <select name="search" id="search" class="form-control">
                               <option value="all">전체</option>
                               <option value="rf_num">환불번호</option>
                               <option value="b_name">환불내역</option>
                           </select>
                           <input type="text" id="keyword" name="keyword" class="form-control" />
                           <input type="button" id="purchaseSearchBtn" class="btn btn-primary searchBtn" value="조회" />
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
                        <option value="all">전체</option>
                        <option value="reRequest">환불승인대기</option>
                        <option value="rfConfirm">승인완료</option>
                        <option value="cancel">주문취소</option>
                    </select>
                </div> <!--orderby 주문일자 정렬기준-->
             </form>
             
                
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>환불번호</th>
                            <th>주문일자</th>
                            <th>환불내역</th>
                            <th>환불금액</th>
                            <th>주문상태</th>
                            <th>환불신청/승인일자</th> <!--rf_confirmdate-->
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="td_num">568</td>
                            <td>2020-05-04</td>
                            <td class="td_title">혼자 하는 자바 <span class="other">외 2종</span></td>
                            <td>13,500</td>
                            <td class="td_orderdate">환불승인대기</td>
                            <td>2020-06-10</td>
                            <td><input type="button" class="btn btn-default refundDetailBtn" value="내역보기" /></td>
                        </tr>
                        <tr>
                            <td class="td_num">568</td>
                            <td>2020-05-04</td>
                            <td class="td_title">혼자 하는 자바 <span class="other">외 2종</span></td>
                            <td>13,500</td>
                            <td class="td_orderdate">환불승인대기</td>
                            <td>2020-06-10</td>
                            <td><input type="button" class="btn btn-default refundDetailBtn" value="내역보기" /></td>
                        </tr>
                    </tbody>
                </table>
                
                
                <div id="orderstate_explain">
                    <div id="tit_explain"><span>주문상태</span></div>
                    
                    <ul>
                       <li class="state">환불승인대기<span>환불 검토 중</span></li>
                        <li class="stateFlow"> &gt; </li>
                        <li class="state">승인완료<span>환불 검토완료</span></li>
                        <li class="stateFlow"> &gt; </li>
                        <li class="state">주문취소<span>환불처리완료</span></li>
                    </ul>
                    
                    <!--'배송예정' [→ '주문취소'] → '배송중' → '구매확정' [→ '반품/환불신청' → '승인대기' → '승인완료' → '주문취소'] -->
                </div> <!--orderstate_explain-->
                
            </div> <!--refundHistory-->
         </div>
            <!--****************** 환불내역 조회 부분 끝****************-->
	</body>
</html>