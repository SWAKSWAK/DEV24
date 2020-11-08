<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
       		.price {
       			font-size: 20px;
       			padding: 3px 0 10px;
       			font-weight: bold;
       		}
       		.won {
				color: #959595;
       			font-size: 14px;
       			padding-top: 3px;
       		}
       		.authorPub, .price {
       			color: #959595;
    			padding-top: 10px;
       		}
       		.rating *{
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
 			.cntNum {
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
				/* display: block !important; */
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
			
			.
    	</style>
		
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    	<script src="/resources/include/js/jquery-3.5.1.min.js"></script>
    	<script>
    		$(function() {
    			
    			//수량 실시간 갑지 (1~99)
    			$(".cntNum").on("propertychange change keyup paste input", function(){
    				cntNumRange(this);
    			});
    			
    			$(".cartBtn").click(function(){
    				var index = $(".cartBtn").index(this);
    				if(!cntNumRange(".cntNum:eq("+index+")")) return;
    				/* if ($(".cntNum:eq("+index+")").val("", 0) == 0){
    					alert("수량을 입력해 주세요.");
    					$(".cntNum:eq("+index+")").val(0);
    					return;
    				} */
    				if ($(".cntNum:eq("+index+")").val() == 0){
    					alert("수량을 입력해 주세요.");
    					$(".cntNum:eq("+index+")").val(0);
    					return;
    				}
    				
    				var dataNum = $(this).parents(".bookWrap").attr("data-num");
    				var cntNum = $(this).parents(".cntNum").val();
    				var data = JSON.stringify({
    					b_num : dataNum
    				});
    				$.ajax({
    					url : "/cart/addtoCart",
    					type : "POST",
    					data : data,
    					headers : {
    						"Content-Type" : "application/json",
    						"X-HTTP-Method-Override" : "POST"
    					},
    					dataType : "text",
    					success: function (result) {
    						if (result == 1){
	    						$(".cartMsg:eq("+index+")").css("display", "block");
    						}
						},
						error : function(){
							alert("장바구니 담기에 실패했습니다.\n관리자에게 문의해 주세요.")
						}
    				});
    				
    			});
    			
    			$(".goCartBtn").click(function(){
    				location.href="/cart/cartList";
    			});
    			$(".noCartBtn").click(function(){
    				$(this).parents(".cartMsg").css("display", "none");
    			});
    			
    			$(".butBtn").click(function(){
    				
    			});
    			
    			$(".upBtn").click(function(){
    				console.log("upBtn");
    				var n = $(".upBtn").index(this);
    				var cntNum = $(".cntNum:eq("+n+")");
    				$(".cntNum:eq("+n+")").val(cntNum.val()*1 + 1);
    				if (!cntNumRange(cntNum)) return;
    			});

    			$(".downBtn").click(function(){
    				var n = $(".downBtn").index(this);
    				var cntNum = $(".cntNum:eq("+n+")");
    				$(".cntNum:eq("+n+")").val(cntNum.val()*1 - 1);
    				if (!cntNumRange(cntNum)) return;
    			});
    			
    			
    			/* $(".bookWrap").click(function(){
    				if ($(".listcoverWrap").find()){
	    				var checkbox = $(this).find(".checkbox");
	    				if($(this).find(".checkbox").prop("checked") == true){
	    					checkbox.prop("checked",false);
	    					console.log("if");
	    				} else {
	    					checkbox.prop("checked",true);
	    					console.log("else");
	    				}
    				}
    			}); */
    		})
    		
    		//false : range에서 벗어남
    		function cntNumRange(selector) {

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
			}
    	</script>

	</head>
	<body>
		<div class="contentWrap">
		<div class="contentHeader">
			<div class="Sorts">
				<span class="sort devPowSort">DEV24 랭킹순</span>
				<span class="sort bestSort">판매량순</span>
				<span class="sort newSort">신상품순</span>
				<span class="sort lowPriceSort">낮은가격순</span>
				<span class="sort highPriceSort">높은가격순</span>
			</div>
			<div class="btns">
				<button type="button" class="btn text-right selectedCartBtn" name="cartBtn" >장바구니 담기</button>
				<button type="button" class="btn text-right selectedBuyBtn" name="buyBtn" >구매</button>
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
										<p class="price"> <fmt:formatNumber value="${ bl.b_price }"/><span class="won">원</span></p>
										<p class="rating">
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
											<input type="number" value="0" class="cntNum" min="0" max="99"/>
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
