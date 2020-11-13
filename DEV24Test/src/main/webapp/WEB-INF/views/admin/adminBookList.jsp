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
	    <link href="/resources/include/dist/css/bootstrap.min.css" rel="stylesheet">
	    <link href="/resources/include/dist/css/bootstrap-theme.min.css" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="/resources/include/css/sticky-footer-navbar.css" rel="stylesheet">
	    <link rel="stylesheet" href="/resources/include/css/adminPage.css">
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common/common.js"></script>
				
    	<link rel="stylesheet" href="/resources/include/css/style_boot.css" />
		<link rel="stylesheet" href="/resources/include/css/style_headerfooter.css" />
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
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
    		.pageNum{
    			display: inline-block;
    			padding: 5px;
    		}
    		.pageBtn {
    			display: inline-block;
    			font-size: 20px;
    			font-weight: bold;
    		}
    		.pageBtn {
    			cursor: pointer;
    		}
    		.b_nameText:hover {
    			cursor: pointer;
    		}
		</style>
    	<script>
			$(function() {

				//수량 실시간 갑지 (1~99)
				$(".crt_qty").on(
						"propertychange change keyup paste input",
						function() {
							crt_qtyRange(this);
						});

				$(".cartBtn").click(
						function() {
							var index = $(".cartBtn").index(this);
							if (!crt_qtyRange(".crt_qty:eq("
									+ index + ")"))
								return;
							/* if ($(".crt_qty:eq("+index+")").val("", 0) == 0){
								alert("수량을 입력해 주세요.");
								$(".crt_qty:eq("+index+")").val(0);
								return;
							} */
							if ($(".crt_qty:eq(" + index + ")")
									.val() == 0) {
								alert("수량을 입력해 주세요.");
								$(".crt_qty:eq(" + index + ")")
										.val(0);
								return;
							}

							var cvo = new Object();
							var cvoList = new Array();

							var dataNum = $(this).parents(
									".bookWrap").attr("data-num");
							var crt_qty = $(
									".crt_qty:eq(" + index + ")")
									.val();
							var b_price = $(
									".b_price:eq(" + index + ")")
									.html();

							cvo.b_num = dataNum;
							cvo.crt_qty = crt_qty;
							cvo.crt_price = b_price * crt_qty;
							console.log(cvo.b_price);

							cvoList.push(cvo);

							var data = JSON.stringify(cvoList);

							var result = addCart(data);
							if (result == 'SUCCESS')
								$(".cartMsg:eq(" + index + ")")
										.css("display", "block");

						});

				$(".selectedCartBtn")
						.click(
								function() {
									var isQtyZero = false;
									var cvoList = new Array();
									var cvo;
									if ($(".checkbox:checked").length == 0) {
										alert("선택된 도서가 없습니다.");
										return;
									}
									$(".checkbox:checked")
											.each(
													function(idx) {
														cvo = new Object();

														var index = $(
																".checkbox")
																.index(
																		this);
														var dataNum = $(
																this)
																.parents(
																		".bookWrap")
																.attr(
																		"data-num");
														var crt_qty = $(
																".crt_qty:eq("
																		+ index
																		+ ")")
																.val();
														var b_price = $(
																".b_price:eq("
																		+ index
																		+ ")")
																.html();

														if (crt_qty < 1) {
															alert("수량을 입력해 주세요.");
															isQtyZero = true;
															return;
														}

														cvo.b_num = dataNum;
														cvo.crt_qty = crt_qty;
														cvo.crt_price = b_price
																* crt_qty;

														console
																.log(cvo
																		.toString());
														cvoList
																.push(cvo);
													});

									if (isQtyZero)
										return;

									var cartJsonArr = JSON
											.stringify(cvoList);
									console.log(cartJsonArr);
									var result = addCart(cartJsonArr);
									if (result == 'SUCCESS')
										$(".contentHeaderCartMsg")
												.css("display",
														"block");
								});

				$(".goCartBtn").click(function() {
					location.href = "/cart/cartList";
				});
				$(".noCartBtn").click(
						function() {
							$(this).parent().parent("div").css(
									"display", "none");
						});

				$(".butBtn").click(function() {

				});

				$(".upBtn").click(
						function() {
							console.log("upBtn");
							var n = $(".upBtn").index(this);
							var crt_qty = $(".crt_qty:eq(" + n
									+ ")");
							$(".crt_qty:eq(" + n + ")").val(
									crt_qty.val() * 1 + 1);
							if (!crt_qtyRange(crt_qty))
								return;
						});

				$(".downBtn").click(
						function() {
							var n = $(".downBtn").index(this);
							var crt_qty = $(".crt_qty:eq(" + n
									+ ")");
							$(".crt_qty:eq(" + n + ")").val(
									crt_qty.val() * 1 - 1);
							if (!crt_qtyRange(crt_qty))
								return;
						});

    			//pagination 정보  변수에 담기
    			var page = ${pagination.page};//현재페이지
    			var startPage = ${pagination.startPage};//지금 길이의 시작페이지
    			var endPage = ${pagination.endPage};
    			var pageLength = ${pagination.pageLength};
    			var cateOne_num = ${pagination.cateOne_num};
    			var cateTwo_num = ${pagination.cateTwo_num};

				if (startPage - 1 <= 0)
					$(".prevBtn").css("cursor", "default");

				if (page + 1 > pageLength)
					$(".nextBtn").css("cursor", "default");

				if (startPage - 5 <= 0)
					$(".prevRangeBtn").css("cursor", "default");

				if (startPage + 1 > pageLength)
					$(".nextRangeBtn").css("cursor", "default");

				$(".prevBtn").click(
						function() {
							if (startPage - 1 > 0)
								location.href = "/book/"
										+ cateOne_num + "/"
										+ cateTwo_num + "?page="
										+ page - 1;
						});

				$(".nextBtn").click(
						function() {
							if (endPage + 1 <= pageLength)
								location.href = "/book/"
										+ cateOne_num + "/"
										+ cateTwo_num + "?page="
										+ page + 1;
						});

				$(".prevRangeBtn").click(
						function() {
							if (startPage - 5 > 0)
								location.href = "/book/"
										+ cateOne_num + "/"
										+ cateTwo_num + "?page="
										+ page - 5;
						});

				$(".nextRangeBtn").click(
						function() {
							if (startPage + 5 <= pageLength)
								location.href = "/book/"
										+ cateOne_num + "/"
										+ cateTwo_num + "?page="
										+ page + 5;
						});

				$(".pageNumBtn").click(
						function() {
							location.href = "/book/" + cateOne_num
									+ "/" + cateTwo_num + "?page="
									+ $(this).html();
						});

				$(
						".pageNum[data-num='" + page
								+ "'] > a.pageNumBtn").css(
						"font-weight", "bold").css(
						"text-decoration", "underline");

			});

			//false : range에서 벗어남
			function crt_qtyRange(selector) {

				if ($(selector).val() < 0) {
					alert("수량은 1개부터 99개 까지 입력 가능합니다.");
					$(selector).val("0");
					return false;
				}
				if ($(selector).val() > 99) {
					alert("수량은 1개부터 99개 까지 입력 가능합니다.");
					$(selector).val("99");
					return false;
				}
				return true;
			};

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
			<div class="top">
				<div class="topRightDiv">
					<select id="listSize">
						<option value="20">20개씩 보기</option>
						<option value="40">40개씩 보기</option>
					</select>
				</div>
			</div>
			<div class="bottom">
				<!-- pagination -->
				<div class="bottomLeftDiv">
					<div class="paginationBox">
						<ul class="pagination">
							<li class="pageBtn prevRangeBtn" >
								<i class="fas fa-angle-double-left"></i>
							</li>
							<li class="pageBtn prevBtn" >
								<i class="fas fa-angle-left"></i>
							</li>
							<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
								<li class="pageNum" data-num="${i}"><a class="pageNumBtn" href="#">${i}</a></li>
							</c:forEach>
							<li class="pageBtn nextBtn">
								<i class="fas fa-angle-right"></i>
							</li>
							<li class="pageBtn nextRangeBtn">
								<i class="fas fa-angle-double-right"></i>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div> <!-- contentHeader -->
			<h1 id="listTitle"></h1>
			<table class="listWrap table table-hover">
				<tr>
					<th class="text-center">도서코드</th>
					<th class="text-left">도서명</th>
					<th class="text-center">저자</th>
					<th class="text-center">출판사</th>
					<th class='text-center'>가격</th>
					<th class="text-left">선택</th>
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
