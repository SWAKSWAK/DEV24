<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="ko">
	<head>
		<meta charset="UTF-8" />
		<!-- html4 : 파일의 인코딩 방식 지정 -->
		<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
				<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
		
		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다.(조건부주석) -->
		<!--[if lt IE 9]>
			<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
	    <!-- Bootstrap core CSS -->
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    	<script src="/resources/include/js/jquery-3.5.1.min.js"></script>
    	<style>
    		#content_wrap{padding-top:30px;}
    	
    		.contentHeaderCartMsg > *{
    			display: inline-block;
    		}
    		.topLeftDiv, .topRightDiv {
    			display: inline-block;
    		}
    		.selectedCartBtn, .selectedBuyBtn {
    			width: 110px;
    		}
    		.bottomRightDiv > button:hover{
    			opacity: 0.8;
    		}
    		.sort{
    			display: inline-block;
    			margin: 0 10px;
    		}
    		
    		.sort:hover {
    			cursor: pointer;
    		}
    		
    		.b_nameText:hover {
    			cursor: pointer;
    		}
    		
    		.form-control {
    			width: auto;
    			display: inline-block;
    		}
		</style>
    	<script>
			$(function() {
    			//pagination 정보  변수에 담기
    			var listRange = parseInt(${pagination.listRange});
				$("#listRange").val(listRange).attr("selected", "true");
				
    			var page = parseInt(${pagination.page});//현재페이지
    			var startPage = parseInt(${pagination.startPage});//지금 길이의 시작페이지
    			var endPage = parseInt(${pagination.endPage});
    			var pageLength = parseInt(${pagination.pageLength});
    			var cateOne_num = parseInt(${pagination.cateOne_num});
    			var cateTwo_num = parseInt(${pagination.cateTwo_num});
    			var range = parseInt(${pagination.range});
    			var category = window.location.pathname.substr(12, 14);// "/admin/book/00" 에서  "00"만 추출

    			//버튼 클릭 여부에 따라 실행할 기본 uri 틀
				var uri = "/admin/book/"+cateOne_num+cateTwo_num+"?page=";
    			
    			$("#listRange").val(listRange);
				$("#cateOne_num").val(cateOne_num).attr("selected", "true");
				$("#cateTwo_num").val(cateTwo_num).attr("selected", "true");
				
				if (cateOne_num == 0) {
					$("#cateTwo_num").html("<option value='0'>소분류</option>");
				} else if (cateOne_num == 1){
					$("#cateTwo_num").append("<option value='1'>프로그래밍 언어</option>")
									 .append("<option value='2'>OS/데이터베이스</option>")
									 .append("<option value='3'>웹사이트</option>")
									 .append("<option value='4'>컴퓨터 입문/활용</option>")
									 .append("<option value='5'>네트워크/해킹/보안</option>");
				} else {//2
					$("#cateTwo_num").append("<option value='6'>IT 전문서</option>")
									 .append("<option value='7'>컴퓨터 수험서</option>")
									 .append("<option value='8'>웹/컴퓨터 입문&활용</option>");
				} 


				//수량 실시간 갑지 (1~99)
				$(".crt_qty").on(
						"propertychange change keyup paste input",
						function() {
							crt_qtyRange(this);
						});

				$(".cartBtn").click(
					function() {
						var index = $(".cartBtn").index(this);
						if (!crt_qtyRange(".crt_qty:eq("+ index + ")")){
							return;
						}
						
						if ($(".crt_qty:eq(" + index + ")").val() == 0) {
							alert("수량을 입력해 주세요.");
							$(".crt_qty:eq(" + index + ")").val(0);
							return;
						}
	
						var cvo = new Object();
						var cvoList = new Array();
	
						var dataNum = $(this).parents(".bookWrap").attr("data-num");
						var crt_qty = $(".crt_qty:eq(" + index + ")").val();
						var b_price = $(".b_price:eq(" + index + ")").html();
	
						cvo.b_num = dataNum;
						cvo.crt_qty = crt_qty;
						cvo.crt_price = b_price * crt_qty;
						console.log(cvo.b_price);
	
						cvoList.push(cvo);
	
						var data = JSON.stringify(cvoList);
	
						var result = addCart(data);
						if (result == 'SUCCESS')
							$(".cartMsg:eq(" + index + ")").css("display", "block");

				});

				$(".selectedCartBtn").click(
					function() {
						var isQtyZero = false;
						var cvoList = new Array();
						var cvo;
						if ($(".checkbox:checked").length == 0) {
							alert("선택된 도서가 없습니다.");
							return;
						}
						$(".checkbox:checked").each(
							function(idx) {
								cvo = new Object();

								var index = $(".checkbox").index(this);
								var dataNum = $(this).parents(".bookWrap").attr("data-num");
								var crt_qty = $(".crt_qty:eq(" + index + ")").val();
								var b_price = $(".b_price:eq("+ index + ")").html();

								if (crt_qty < 1) {
									alert("수량을 입력해 주세요.");
									isQtyZero = true;
									return;
								}

								cvo.b_num = dataNum;
								cvo.crt_qty = crt_qty;
								cvo.crt_price = b_price * crt_qty;

								console.log(cvo.toString());
								cvoList.push(cvo);
							});

						if (isQtyZero)
							return;

						var cartJsonArr = JSON.stringify(cvoList);
						console.log(cartJsonArr);
						var result = addCart(cartJsonArr);
						if (result == 'SUCCESS')
							$(".contentHeaderCartMsg").css("display","block");
					});

				$(".goCartBtn").click(function() {
					location.href = "/cart/cartList";
				});
				$(".noCartBtn").click(function() {
					$(this).parent().parent("div").css("display", "none");
				});

				$(".upBtn").click(
					function() {
						console.log("upBtn");
						var n = $(".upBtn").index(this);
						var crt_qty = $(".crt_qty:eq(" + n + ")");
						$(".crt_qty:eq(" + n + ")").val(crt_qty.val() * 1 + 1);
						if (!crt_qtyRange(crt_qty))
							return;
					});

				$(".downBtn").click(
					function() {
						var n = $(".downBtn").index(this);
						var crt_qty = $(".crt_qty:eq(" + n + ")");
						$(".crt_qty:eq(" + n + ")").val(crt_qty.val() * 1 - 1);
						if (!crt_qtyRange(crt_qty))
							return;
					});
				
				$("#checkAll").click(function(){
					if ($("#checkAll").prop("checked")) {
						$(".checkbox").prop("checked", true);
					} else {
						$(".checkbox").prop("checked", false);
					}
				});
				
				
				/* 대분류, 소분류 선택에 따른 처리 */
				$("#cateOne_num").change(function(){
					var cateOneSelected = $("#cateOne_num").select().val();
					if (cateOneSelected == 0) {
						$("#cateTwo_num").html("<option value='0'>소분류</option>");
					} else if (cateOneSelected == 1){
						$("#cateTwo_num").append("<option value='1'>프로그래밍 언어</option>")
										 .append("<option value='2'>OS/데이터베이스</option>")
										 .append("<option value='3'>웹사이트</option>")
										 .append("<option value='4'>컴퓨터 입문/활용</option>")
										 .append("<option value='5'>네트워크/해킹/보안</option>");
					} else {//2
						$("#cateTwo_num").append("<option value='6'>IT 전문서</option>")
										 .append("<option value='7'>컴퓨터 수험서</option>")
										 .append("<option value='8'>웹/컴퓨터 입문&활용</option>");
					}
				});
				
				/* 보기버튼 클릭처리 */
				$("#cateView").click(function(){
					category = $("#cateOne_num").select().val() + $("#cateTwo_num").select().val() + "";
					location.href = location.href="/admin/book/"+category+"?listRange="+listRange;
				});
				

    		
				/*	페이징 처리 관련 */
				if (page > pageLength){
					page = pageLength;
				}
				
				if (startPage-1 <= 0){
					$(".prevBtn").css("cursor", "default");
					$(".prevRangeBtn").css("cursor", "default");
				}
	
				if(startPage+10 > pageLength){
					$(".nextBtn").css("cursor", "default");
					$(".nextRangeBtn").css("cursor", "default");
				}
				
				
				$(".prevBtn").click(function(){
					if (startPage > 1){
						if (startPage-10 > 0){
						startPage = (startPage-10);
							location.href = uri+(startPage)+"&startPage="+(startPage)+"&listRange="+listRange;
						} else {
							startPage = 1;
							location.href = uri+(startPage)+"&startPage="+(startPage)+"&listRange="+listRange;
						}
					}
				});
	
				$(".nextBtn").click(function(){
					if(startPage+10 <= pageLength){
						startPage = (startPage+10);
						location.href = uri+(startPage)+"&startPage="+(startPage)+"&listRange="+listRange;
					}
				});
	
				$(".prevRangeBtn").click(function(){
					if (startPage-1 > 1){
						location.href = uri+"1&startPage=1&listRange="+listRange;
					}
				});
	
				$(".nextRangeBtn").click(function(){
					if(startPage+10 <= pageLength)
						location.href = uri+(pageLength-9)+"&startPage="+(pageLength)+"&listRange="+listRange;
				});
				
				$(".pageNumBtn").click(function(){
					location.href = uri+$(this).html()+"&startPage="+startPage+"&listRange="+listRange;
				});
				
				$(".pageNum[data-num='"+page+"'] > a.pageNumBtn")
											.css("font-weight", "bold")
											.css("text-decoration", "underline");
				
				$(".b_name").click(function(){
					var b_num = $(this).parents(".bookWrap").attr("data-num");
					location.href = "/admin/book/detail/"+b_num;
				});
	
				$(".listcover").click(function(){
					var b_num = $(this).parents(".bookWrap").attr("data-num");
					location.href = "/admin/book/detail/"+b_num;
				});
				
				// #listRange 값이 바뀔 때마다 맞춰 출력
				$("#listRange").change(function(){
					listRange = $("#listRange").select().val();
					location.href="/admin/book/"+category+"?listRange="+listRange;
				});
				//페이징 처리 종료
			
			});

			//장바구니 추가 함수
			function addCart(data) {
				var returnVal = "";

				$.ajax({
					url : "/cart/addToCart",
					type : "POST",
					data : data,
					async : false,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					success : function(result) {
						returnVal = 'SUCCESS';
					},
					error : function() {
						alert("장바구니 담기에 실패했습니다.\n관리자에게 문의해 주세요.");
						returnVal = 'FAIL';
					}
				});
				console.log(returnVal);
				return returnVal;
			};
		</script>
	</head>
	<body>
		<div id="content_wrap">
			<div class="contentHeader">
				<div class="bottom">
					<!-- pagination -->
					<div class="bottomLeftDiv">
						<div class="paginationBox">
							<ul class="pagination">
								<li class="pageBtn prevRangeBtn page-item" >
									<a class="page-link"  href="#">
										<i class="fas fa-angle-double-left"></i>
									</a>
								</li>
								<li class="pageBtn prevBtn page-item" >
									<a class="page-link"  href="#">
										<i class="fas fa-angle-left page-link"></i>
									</a>
								</li>
								<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
									<li class="pageNum page-item" data-num="${i}"><a class="pageNumBtn page-link" href="#">${i}</a></li>
								</c:forEach>
								<li class="pageBtn nextBtn page-item">
									<a class="page-link"  href="#">
										<i class="fas fa-angle-right page-link"></i>
									</a>
								</li>
								<li class="pageBtn nextRangeBtn page-item">
									<a class="page-link"  href="#">
										<i class="fas fa-angle-double-right page-link"></i>
									</a>
								</li>
							</ul>
							<select id="listRange" class="pull-right form-control">
								<option value="20">20개씩 보기</option>
								<option value="40">40개씩 보기</option>
							</select>
						</div>
					</div><!-- bottomLeftDiv -->
					<div class="topBtnWrap">
						<select name="cateOne_num" id="cateOne_num" class="form-control">
							<optgroup label="대분류">
							</optgroup>
							<option value="0">모든 도서</option>
							<option value="1">book</option>
							<option value="2">eBook</option>
						</select>
						<select name="cateTwo_num" id="cateTwo_num" class="form-control">
							<option value="0">소분류</option>
						</select>
						<button type="button" class="btn btn-default" id="cateView" >보기</button>
						<button type="button" class="btn btn-default pull-right" id="selectedOOP">일괄 절판</button>
						<button type="button" class="btn btn-default pull-right" id="selectedREG">일괄 등록</button>
					</div>
				</div><!-- bottom -->
			</div> <!-- contentHeader -->
			<h1 id="listTitle"></h1>
			<table class="listWrap table table-hover">
				<tr>
					<th class="text-center">도서코드</th>
					<th class="text-left">도서명</th>
					<th class="text-center">저자</th>
					<th class="text-center">출판사</th>
					<th class='text-center'>가격</th>
					<th class="text-left">
						<input type="checkbox" id="checkAll"/>
					</th>
				</tr>
				<c:choose>
					<c:when test="${ not empty bookList }">
						<c:forEach var="bl" items="${ bookList }">
							<tr class="bookWrap" data-num="${ bl.b_num }">
								<td class="b_num text-center">
									${bl.b_num}
								</td>
								<td class="b_name text-left" title="${ bl.b_name }">
									<span class="b_nameText" >${ bl.b_name }</span>
								</td>
								<td class="b_author text-center">${ bl.b_author }</td>
								<td class="b_pub text-center">${ bl.b_pub }</td>
								<td class="b_price text-center">
									<span class="b_price_hidden"  style="display: none" >${ bl.b_price }</span>
									<fmt:formatNumber value="${ bl.b_price }"/>
								</td>
								<td class="chkWrap">
									<input type="checkbox" class="checkbox" value="${ bl.b_num }" />
								</td>
							</tr><!-- .bookWrap -->
						</c:forEach>
					</c:when>
				</c:choose>
			</table><!-- .listWrap -->
		</div><!-- content_wrap -->
	</body>
</html>
