<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
    	<script src="/resources/include/js/common.js"></script>
		<script src="https://kit.fontawesome.com/a333e3670c.js" crossorigin="anonymous"></script>
		<script>
			$(function(){
				// 금액 콤마찍기
				var l = $(".table tbody tr").length;
				var price = 0;
				for(var i=0; i<l; i++){
    				price = $(".table tbody tr").eq(i).find(".td_price").text();
    				$(".table tbody tr").eq(i).find(".td_price").text(addComma(price));
    				
    				//console.log("${ohvo}");
    			}
				
				/* 검색할 날짜 기본값 설정 */
				var today = new Date(); // 오늘날짜
				var year = today.getFullYear();
				var month = String(today.getMonth()+1);
				var day = String(today.getDate()); // 일
				
				if(month.length == 1){ 
					  month = "0" + month; 
				} 
				if(day.length == 1){ 
				  day = "0" + day; 
				}
				
				var fullToday = year + "-" + month + "-" + day;
				console.log(fullToday);
				
				/* 키워드 검색 시 */
				$("#purchaseSearchBtn").click(function(){
					if($("#search").val()!="all"){ // 검색 조건이 '전체'일 때 빼고는 유효성 체크!
						if(!chkData("#keyword", "검색어를"))return;
					}
					goPage();
				});
				
				
				/* 검색 후 검색대상과 검색단어 출력 */
				if("${data.keyword}" != ""){
					$("#keyword").val("${data.keyword}");
					$("#search").val("${data.search}");
				}
				if("${data.date_start}" != ""){
					$("input[name='date_start']").val("${data.date_start}");
				}else{
					$("#date_start").val(fullToday);
				}
				if("${data.date_end}" != ""){
					$("input[name='date_end']").val("${data.date_end}");
				}else{
					$("#date_end").val(fullToday);
				}
				if("${data.orderby_when}" != ""){
					$("#orderby_when").val("${data.orderby_when}");
				}
				if("${data.orderby_state}" != ""){
					$("#orderby_state").val("${data.orderby_state}");
				}

				/* 입력양식 enter제거 */
				$("#keyword").bind("keydown", function(event){
					if(event.keyCode == 13){
						event.preventDefault();
					}
				});
				
				/* 검색 조건 '전체'로 했을 때 */
				$("#search").change(function(){
					if($("#search").val()=='all'){
						$("#keyword").val("전체 데이터 조회");
					}else if($("#search").val()!='all'){
						$("#keyword").val("");
						$("#keyword").focus();
					}
				});
				
				
				/* 최근순/과거순 정렬 */
				$("#orderby_when").change(function(){
					goPage();
				});
				
				/* 주문상태 정렬 */
				$("#orderby_state").change(function(){
					goPage();
				});
				
				
				/* 1주, 1달, 3달, 6달 기준 검색 */
				$("#orderdate_row1 > ul > li").click(function(){
					$(this).addClass("on").siblings("li").removeClass("on");
					var searchDate = $(this).attr("data-date");
					if(searchDate == "week"){
						today.setDate(today.getDate() - 7);
					}else if(searchDate == "month"){
						today.setMonth(today.getMonth() - 1);
					}else if(searchDate == "threeMonth"){
						today.setMonth(today.getMonth() - 3);
					}else if(searchDate == "halfMonth"){
						today.setMonth(today.getMonth() - 6);
					}
					//console.log("today: "+today);
					
					var year = today.getFullYear();
					var month = String(today.getMonth()+1);
					var day = String(today.getDate()); // 일
					
					if(month.length == 1){ 
						  month = "0" + month; 
					} 
					if(day.length == 1){ 
					  day = "0" + day; 
					}
					
					var searchFullDate = year + "-" + month + "-" + day;
					//console.log("searchFullDate : "+searchFullDate);
	
					$("#date_start").val(searchFullDate);
					$("#date_end").val(fullToday);
					
					goPage();
				});
				
				
				
				/* 구매확정 버튼 처리 */
				$(".pConfirmBtn").click(function(){
					var state = "pConfirm";
					
					$.ajax({
						url:"/mypage/orderstateUpdate",
						type:"get",
						data : state,
						dataType:"text",
						error:function(){
							alert("시스템 오류. 관리자에게 문의하세요.");
						},
						success:function(result){
							console.log(result);
							
						}
					});
				});
				
				/* 구매취소 버튼 처리 */
				$(".orderCancelBtn").click(function(){
					var state = "cancel";
				});
				
			}); // 최상위 종료
			
			/* 검색을 위한 실질적인 처리 함수 */
			function goPage(){
				if($("#search").val()=="all"){
					$("#keyword").val("");
				}
				
				$("#f_search").attr({
					"method" : "get",
					"action" : "/mypage/orderHistory"
				});
				$("#f_search").submit();
			}
			
		</script>


	</head>
	<body>
		<div id="content_mypage">
            
            <!--****************** 주문내역 조회 부분 시작****************-->
            
            <div id="orderHistory">
                <div class="tit_mypage">
                    <h3>주문내역조회</h3>
                </div>
                
               <form name="f_search" id="f_search">
                <div id="orderdate">
                   <div id="orderdate_rows">
                        <div id="orderdate_row1">
                            <ul>
                                <li data-date="week">최근1주일</li>
                                <li data-date="month">1개월</li>
                                <li data-date="threeMonth">3개월</li>
                                <li data-date="halfMonth">6개월</li>
                            </ul>
                            <div id="dateRange">
                                <input type="date" id="date_start" name="date_start" />
                                &nbsp;~&nbsp;
                                <input type="date" id="date_end" name="date_end" />
                            </div> <!--dateRange-->
                        </div><!--orderdate_row1-->

                        <div id="orderdate_row2">
                            <select name="search" id="search" class="form-control">
                               <option value="all">주문전체</option>
                               <option value="p_sender">주문자</option>
                               <option value="p_receiver">수령자</option>
                               <option value="p_num">주문번호</option>
                               <option value="b_name">책이름</option>
                           </select>
                           <input type="text" id="keyword" name="keyword" class="form-control" />
                           <input type="button" id="purchaseSearchBtn" class="btn btn-primary searchBtn" value="조회" />
                        </div><!--orderdate_row2-->
                    
                    </div> <!--orderdate_rows-->
                    
                </div><!--orderdate 상단 주문일자 조회-->
               
                <div id="orderby">
                    <span>정렬기준</span>
                    <select name="orderby_when" id="orderby_when">
                        <option value="last">최근순</option>
                        <option value="past">과거순</option>
                    </select>
                    <span>주문상태</span>
                    <select name="orderby_state" id="orderby_state">
                        <option value="all">전체</option>
                        <option value="preShipping">배송예정</option>
                        <option value="shipping">배송중</option>
                        <option value="pConfirm">구매확정</option>
                    </select>
                </div> <!--orderby 주문일자 정렬기준-->
              </form>
                
                <table class="table" border="1">
                    <thead>
                        <tr>
                            <th>주문번호</th>
                            <th>주문일자</th>
                            <th>주문내역</th>
                            <th>주문금액</th>
                            <th>주문상태</th>
                            <th>주문자</th>
                            <th>수령자</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:choose>
                    		<c:when test="${not empty ohvo}">
                    			<c:forEach var="ohvo" items="${ohvo}">
                    				<tr>
			                            <td class="td_num">${ohvo.p_num}</td>
			                            <td>${ohvo.p_buydate}</td>
			                            <td class="td_title">${ohvo.b_name}</td>
			                            <td class="td_price">${ohvo.price}</td>
			                            <td class="td_orderdate">
			                            	<c:choose>
				                           	<c:when test="${ohvo.pd_orderstate == 'preShipping'}">
				                           		배송예정
				                                <input type="button" class="btn btn-default orderCancelBtn" value="구매취소" />
				                           	</c:when>
				                           	<c:when test="${ohvo.pd_orderstate == 'shipping'}">
				                           		배송중
				                                <input type="button" class="btn btn-default refundInsertFormBtn" value="환불신청" />
				                                <input type="button" class="btn btn-default pConfirmBtn" value="구매확정" />
				                           	</c:when>
				                           	<c:when test="${ohvo.pd_orderstate == 'pConfirm'}">
				                           		구매확정
				                                <input type="button" class="btn btn-default refundInsertFormBtn" value="환불신청" />
				                           	</c:when>
				                           	<c:when test="${ohvo.pd_orderstate == 'reRequest'}">
				                           		환불승인대기
				                           	</c:when>
				                           	<c:when test="${ohvo.pd_orderstate == 'cancel'}">
				                           		주문취소
				                           	</c:when>
				                           	<c:otherwise>
				                           		승인완료
				                           	</c:otherwise>
				                           	</c:choose>
			                            </td>
			                            <td>${ohvo.p_sender}</td>
			                            <td>${ohvo.p_receiver}</td>
			                            <td class="td_buttons">
			                                <input type="button" class="btn btn-info reviewInsertFormBtn" value="리뷰작성" /> <!--구매확정 시에만 가능-->
			                            </td>
			                        </tr>
                    			</c:forEach>
                    		</c:when>
                    		<c:otherwise>
                    			<tr>
                    				<td colspan="8">최근 주문내역이 없습니다.</td>
                    			</tr>
                    		</c:otherwise>
                    	</c:choose>
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