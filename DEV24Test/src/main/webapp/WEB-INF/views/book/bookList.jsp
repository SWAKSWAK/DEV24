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
		
		<link rel="stylesheet" href="/resources/include/css/style_cart.css">
    	<style>
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
    		.contentWrap {
    			text-align: center;
    		}
    		
    		.listWrap {
    			display: inline-block;
    			margin-top: 20px;
    			width: 1000px;
    		}
    		.listWrap * {
    			/* border: 1px solid;  */
    		}
    		.bookWrap {
    			width: 100%;
    			height: 168px;
    			display: inline-block;
    			border: 1px solid lightgray;
    			margin-bottom: 12px;
    			padding: 8px 10px;
    		}
    		.bookWrap:hover{
    			box-shadow: 2px 2px 6px 1px lightgrey;
    		}
    		.listcoverWrap {
			   height: 100%;
			   float: left;
			   display: inline-block;
			   /* border-right: solid #f4eeff 25px; */
   			}
    		.listcover {
    			width: 120px;
    			cursor: pointer;
    			border-right: solid #f4eeff 25px;
    		}
    		.listcover:hover {
    			opacity: 0.7;
    		}
    		/* .lineDiv {
    			width: 1px;
    			background-color: #dcd6f7;
    			display: inline-block;
    		} */
    		.booktext {
    			/* border: 1px solid; */
    			display: inline-block;
			    height: 100%;
			    width: 555px;
			    float: left;
			    padding-left: 25px;
			    text-align: left;
       		}
       		.b_name {
       			font-weight: 900;
       			font-size: 26px;
       			color: #736794;
       			overflow: hidden;
       			text-overflow: ellipsis;
       			width: 630px;
       		}
       		.b_nameText {
    			max-width: 500px;
       			font-weight: 1000;
       			font-size: 20px;
       			color: #736794;
       			padding-top: 10px;
       			text-overflow: ellipsis;
    			white-space: nowrap;
       			overflow: hidden;
    			cursor: pointer;
       		}
       		.authorPub {
       			font-size: 14px;
       			padding-top: 5px;
       		}
       		.priceWrap {
       			padding: 3px 0 10px;
       			font-size: 20px;
       			font-weight: bold;
       		}
       		.won {
				color: #959595;
       			font-size: 14px;
       			padding-top: 3px;
       		}
       		.authorPub, .priceWrap {
       			color: #959595;
    			padding-top: 10px;
       		}
       		.b_rating *{
       			font-size: 22px;
      			padding-top: 15px;
       		}
       		.fa-star, .fa-star-half-alt, .avgVal {
       			color: #736794;
       		}
       		.avgVal {
       			font-size: 16px;
       			font-weight: bold;
       			color: #736794;
       			padding-left: 20px;
       		}
       		.btnWrap{
       			display: inline-block;
       			justify-content: center;
       			width: 237px;
       			height: 100%;
       			float: left;
       			text-align: left;
       		}
       		.cntWrap {
       			margin-top: 22px;
       		}
 			.crt_qty {
 				width: 100px;
 				height: 22px;
 				font-size: 16px;
 				text-align: center;
 				color: #5A5A5B;
 				border: 1px solid lightgray;
 				border-radius: 4px;
 			}
 			.upBtn, .downBtn {
 				height: 24px;
 				width: 50px;
 				background-color: #dcd6f7;
 				color: #5D0781;
 				border: none;
 				border-radius: 4px;
 			}
 			.fa-caret-up, .fa-caret-down {
 				width: 50px;
 				height: 100%;
 				font-size: 18px;
 			}
 			input[type="number"]::-webkit-outer-spin-button,
			input[type="number"]::-webkit-inner-spin-button {
			    -webkit-appearance: none;
			    margin: 0;
			}
			.cartBtn, .buyBtn {
				display: block;
			}
			.buyBtn, .cartBtn {
				color : #dcd6f7;
				width: 210px;
				font-size: 15px;
				margin-top: 5px;
			}
			.buyBtn {
				background-color: #424874/* 71459C */;
				color: #f4eeff;
			}
			.cartBtn {
				background-color: #D0B7DA;
				color:  #424874;
			}
			.buyBtn:hover, .cartBtn:hover, .upBtn:hover, .downBtn:hover {
				opacity: 0.8;
				cursor: pointer;
			}
			.cartMsg{
				font-size: 12px;
				position: absolute;
				background-color: #dcd6f7;
				width: 210px;
				border-radius: 4px;
				padding: 5px;
				box-sizing: border-box;
			}
			.cartMsgText{
				color: #424874;
				text-align: center;
			}
			.cartMsgTextBold {
				font-weight: bold;
			}
			.cartBtnWrap {
				text-align: center;
			}
			.goCartBtn, .noCartBtn {
				background-color:#424874;
				color: #dcd6f7;
				width: 65px;
			}
			
			.chkWrap {
				display: inline-block;
				height: 100%;
			}
			.checkbox {
				width: 15px;
				height: 15px;
				display: block;
				margin-top: 76px;
			} 
			.checkbox:checked {
				background-color: #5D0781;
			}
			.contentFooter {
				margin-bottom: 150px;
			}

    	</style>
		
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    	<script src="/resources/include/js/jquery-3.5.1.min.js"></script>
    	<script>
    		$(function() {
    			
    			//수량 실시간 갑지 (1~99)
    			$(".crt_qty").on("propertychange change keyup paste input", function(){
    				crt_qtyRange(this);
    			});
    			
    			$(".cartBtn").click(function(){
    				var index = $(".cartBtn").index(this);
    				if(!crt_qtyRange(".crt_qty:eq("+index+")")) return;
    				/* if ($(".crt_qty:eq("+index+")").val("", 0) == 0){
    					alert("수량을 입력해 주세요.");
    					$(".crt_qty:eq("+index+")").val(0);
    					return;
    				} */
    				if ($(".crt_qty:eq("+index+")").val() == 0){
    					alert("수량을 입력해 주세요.");
    					$(".crt_qty:eq("+index+")").val(0);
    					return;
    				}
    				
    				var cvo = new Object();
    				var cvoList = new Array();
    				
    				var dataNum = $(this).parents(".bookWrap").attr("data-num");
    				var crt_qty = $(".crt_qty:eq("+index+")").val();
    				var b_price = $(".b_price:eq("+index+")").html();
    				
    				cvo.b_num = dataNum;
    				cvo.crt_qty = crt_qty;
    				cvo.crt_price = b_price * crt_qty;
    				console.log(cvo.b_price);
    				
    				cvoList.push(cvo);
    				
    				var data = JSON.stringify(cvoList);
    				
    				var result = addCart(data);
    				if(result == 'SUCCESS')
						$(".cartMsg:eq("+index+")").css("display", "block");
    				
    				
    			});
    			
    			$(".selectedCartBtn").click(function(){
    				var isQtyZero = false;
    				var cvoList = new Array();
    				var cvo;
    				if ($(".checkbox:checked").length == 0){
						alert("선택된 도서가 없습니다.");
						return;
					}
    				$(".checkbox:checked").each(function(idx){
    					cvo = new Object();
    					
        				var index = $(".checkbox").index(this);
    					var dataNum = $(this).parents(".bookWrap").attr("data-num");
        				var crt_qty = $(".crt_qty:eq("+index+")").val();
        				var b_price = $(".b_price:eq("+index+")").html();
        				
        				if (crt_qty < 1){
    						alert("수량을 입력해 주세요.");
    						isQtyZero = true;
    						return;
        				}
        				
    					cvo.b_num = dataNum;
    					cvo.crt_qty = crt_qty;
    					cvo.crt_price = b_price*crt_qty;
    					
    					console.log(cvo.toString());
    					cvoList.push(cvo);
    				});
    				
    				if(isQtyZero)
    					return;

					var cartJsonArr = JSON.stringify(cvoList);
					console.log(cartJsonArr);
    				var result = addCart(cartJsonArr);
    				if(result == 'SUCCESS')
						$(".contentHeaderCartMsg").css("display", "block");
    			});
    			
    			
    			$(".goCartBtn").click(function(){
    				location.href="/cart/cartList";
    			});
    			$(".noCartBtn").click(function(){
    				$(this).parent().parent("div").css("display", "none");
    			});
    			
    			$(".butBtn").click(function(){
    				
    			});
    			
    			$(".upBtn").click(function(){
    				console.log("upBtn");
    				var n = $(".upBtn").index(this);
    				var crt_qty = $(".crt_qty:eq("+n+")");
    				$(".crt_qty:eq("+n+")").val(crt_qty.val()*1 + 1);
    				if (!crt_qtyRange(crt_qty)) return;
    			});

    			$(".downBtn").click(function(){
    				var n = $(".downBtn").index(this);
    				var crt_qty = $(".crt_qty:eq("+n+")");
    				$(".crt_qty:eq("+n+")").val(crt_qty.val()*1 - 1);
    				if (!crt_qtyRange(crt_qty)) return;
    			});
				
    			
    			//pagination 정보  변수에 담기
    			var page = ${pagination.page};//현재페이지
    			var startPage = ${pagination.startPage};//지금 길이의 시작페이지
    			var endPage = ${pagination.endPage};
    			var pageLength = ${pagination.pageLength};
    			var cateOne_num = ${pagination.cateOne_num};
    			var cateTwo_num = ${pagination.cateTwo_num};
    			
    			
    			if (startPage-1 <= 0)
    				$(".prevBtn").css("cursor", "default");

				if(page+1 > pageLength)
					$(".nextBtn").css("cursor", "default");
				
				if (startPage-5 <= 0)
					$(".prevRangeBtn").css("cursor", "default");
					
				if(startPage+1 > pageLength)
					$(".nextRangeBtn").css("cursor", "default");
				
    			$(".prevBtn").click(function(){
    				if (startPage-1 > 0)
    					location.href = "/book/"+cateOne_num+"/"+cateTwo_num+"?page="+page-1;
    			});

    			$(".nextBtn").click(function(){
    				if(endPage+1 <= pageLength)
    					location.href = "/book/"+cateOne_num+"/"+cateTwo_num+"?page="+page+1;
    			});

    			$(".prevRangeBtn").click(function(){
    				if (startPage-5 > 0)
    					location.href = "/book/"+cateOne_num+"/"+cateTwo_num+"?page="+page-5;
    			});

    			$(".nextRangeBtn").click(function(){
    				if(startPage+5 <= pageLength)
    					location.href = "/book/"+cateOne_num+"/"+cateTwo_num+"?page="+page+5;
    			});
    			
    			$(".pageNumBtn").click(function(){
    				location.href = "/book/"+cateOne_num+"/"+cateTwo_num+"?page="+$(this).html();
    			});
    			
    			$(".pageNum[data-num='"+page+"'] > a.pageNumBtn")
    										.css("font-weight", "bold")
    										.css("text-decoration", "underline");
    			
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
			function addCart(data){
				var returnVal = "";
				
				$.ajax({
					url : "/cart/addToCart",
					type : "POST",
					data : data,
					async: false,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					success: function (result) {
						returnVal = 'SUCCESS';
					},
					error : function(){
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
		<div class="contentWrap">
		<div class="contentHeader">
			<div class="top">
				<div class="topLeftDiv">
					<span class="sort devPowSort">DEV24 랭킹순</span>
					<span class="sort bestSort">판매량순</span>
					<span class="sort newSort">신상품순</span>
					<span class="sort lowPriceSort">낮은가격순</span>
					<span class="sort highPriceSort">높은가격순</span>
				</div>
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
				<!-- content header buttons -->
				<div class="bottomRightDiv">
					<button type="button" class="btn btn-default text-right selectedCartBtn" name="cartBtn" >장바구니 담기</button>
					<button type="button" class="btn btn-default text-right selectedBuyBtn" name="buyBtn" >구매</button>
				</div>
			</div>
			<div class="contentHeaderCartMsg" style="display: none;">
				<p class="cartMsgText">
					<span class="cartMsgTextBold">상품이 장바구니에 담겼습니다.</span>
					바로 확인하시겠습니까?
				</p>
				<div class="contentHeaderCartBtnWrap">
					<button type="button" class="btn btn-success goCartBtn">예</button>
					<button type="button" class="btn btn-default noCartBtn">아니오</button>
				</div>	
			</div>
		</div>
			<h1 id="listTitle"></h1>
			<div class="listWrap">
					<c:choose>
						<c:when test="${ not empty bookList }">
							<c:forEach var="bl" items="${ bookList }">
								<div class="bookWrap" data-num="${ bl.b_num }">
									<div class="listcoverWrap text-left">
										<img class="listcover" src="${bl.listcover_imgurl}">
									</div>
									<div class="lineDiv"></div>
									<div class="booktext text-left">
										<h1 class="b_name" title="${ bl.b_name }">
											<span class="b_nameText" >${ bl.b_name }</span>
										</h1>
										<span class="authorPub">${ bl.b_author } 저 | ${ bl.b_pub }</span>
										<p class="priceWrap">
											<span class="b_price" style="display: none" >${ bl.b_price }</span>
												<fmt:formatNumber value="${ bl.b_price }"/>
											<span class="won">원</span>
										</p>
										<p class="b_rating">
											<c:set var="avg" value="${(bl.ra_sum/bl.ra_count)}" />
											<c:set var="devided" value="${(bl.ra_sum/bl.ra_count)/2}" />
											<c:choose>
												<c:when test="${ avg != Double.NaN }">
													<c:forEach var="i" begin="1" end="5" step="1">
														<c:if test="${ i <= devided }">
															<i class="fas fa-star"></i>
														</c:if>
														<c:if test="${ i > devided }">
															<c:choose>
																<c:when test="${ i>devided && (devided-i+1)>0}">
																	<i class="fas fa-star-half-alt"></i>
																</c:when>
																<c:otherwise>
																	<i class="far fa-star"></i>
																</c:otherwise>
															</c:choose>
														</c:if>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
												</c:otherwise>
											</c:choose>
											<c:if test="${ avg == Double.NaN }">
												<c:set var="avg" value="0"/>
											</c:if>
												<span class="avgVal">${avg}</span>
										</p>
									</div>
									<div class="btnWrap">
										<div class="cntWrap">
											<input type="number" value="1" class="crt_qty" min="0" max="99"/>
											<button type="button" class="upBtn" ><i class="fas fa-caret-up"></i></button>
											<button type="button" class="downBtn" ><i class="fas fa-caret-down"></i></button>
										</div>
										<!-- <input type="number" class="number text-right" name="cartCnt" value="0" min="0"/> -->
										
										<button type="button" class="btn text-right cartBtn">장바구니 담기</button>
										<div class="cartMsg" style="display: none;">
											<p class="cartMsgText">
												<span class="cartMsgTextBold">상품이 장바구니에 담겼습니다.</span><br />
												바로 확인하시겠습니까?
											</p>
											<div class="cartBtnWrap">
												<button type="button" class="btn goCartBtn">예</button>
												<button type="button" class="btn noCartBtn">아니오</button>
											</div>											
										</div>
										<button type="button" class="btn text-right buyBtn">구매</button>
										
									</div>
									<div class="chkWrap">
										<input type="checkbox" class="checkbox" value="${ bl.b_num }" />
									</div>
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
				<div></div>
				<div class="contentFooter">
					<div class="top">
						<span class="sort devPowSort">DEV24 랭킹순</span>
						<span class="sort bestSort">판매량순</span>
						<span class="sort newSort">신상품순</span>
						<span class="sort lowPriceSort">낮은가격순</span>
						<span class="sort highPriceSort">높은가격순</span>
					</div>
				</div>
			</div>
	</body>
</html>
