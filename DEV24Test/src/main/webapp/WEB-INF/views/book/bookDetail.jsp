<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="now" class="java.util.Date" />
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
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    	<script src="/resources/include/js/jquery-3.5.1.min.js"></script>
    	<style>
    		#contentWrap {
    			margin-bottom: 150px;
    			text-align: center;
    			font-size: 18px;
    		}
    		#bookDetailWrap {
    			display: inline-block;
    			width: 1000px;
    		}
    		#contentWrap * {
    			/* border: 1px solid; */
    		}
    		#detailCover {
    			width: 400px; 
    		}
    		#detailTopleft, #detailTopRight {
    			display: inline-block;
    		}
    		#b_name {
    			font-size: 32px;
    			padding: 22px 0;
    		}
    		#subTextWrap > span {
    			font-size: 16px;
    			padding-bottom: 5px;
    		}
    		
    		#subTextWrap {
    			padding-bottom: 5px;
    		}
    		
    		#topRightTopWrap {
    			height: 230px;
    			border-bottom: 1px solid lightgrey;
    		}
    		#topRightMiddleWrap {
    			border-bottom: 1px solid lightgrey;
    			font-size: 18px;
    		}
    		
    		#b_rating * {
    			font-size: 28px;
    		}
    		
    		
    		#detailTopWrap{
    			margin: 0 auto;
    			width: 99%;
    		}
    		
    		#detailTopWrap > div{
    			float:left;
    			
    		}
    		
    		#detailTopWrap:after{
    			display:block;
    			content : '';
    			clear:both;
    		}
    		#detailTopRight {
    			width: 560px;
    			text-align: left;
    			margin-left: 20px;
    		}
    		#b_rating {
    			text-align: left;
    		}
    		
    		#deliveryWrap {
				font-size: 16px;
    		}
    		
    		#choolgoWrap{
    			border-bottom: 1px solid lightgrey;
    		}
    		
    		#choolgoWrap > p {
    			display: inline-block;
    		}
    		
    		.btnWrap {
				font-size: 16px;
    		}
    		
    		#detailMiddleWrap {
    			width: 99%;
    		}
    		
    		.middleContentWrap {
    			text-align: left;
    		}
    		
    		#b_info {
    			
    		}
    		
    		.middleContentTitle {
    			font-size: 30px;
    		}
    		
    	</style>
		
    	<script>
    	</script>
	</head>
	<body>
		<div id="contentWrap">
			<div id="bookDetailWrap">
				<div id="detailTopWrap">
					<div id="detailTopleft">
						<img id="detailCover" src="${vo.detailcover_imgurl}"/>
						<p id="bigImgBtnWrap">
							<button type="button" class="btn btn-default" id="bigImg">크게보기</button>
						</p>
					</div><!-- detailTopLeft -->
					<div id="detailTopRight">
						<div id="topRightTopWrap">
							<h1 id="b_name">${vo.b_name}</h1>
							<p id="subTextWrap">
								<span id="b_author">${vo.b_author}</span> | 
								<span id="b_pub">${vo.b_pub}</span> | 
								<span id="b_date">${vo.b_date}</span>
							</p>
							<p id="b_rating">
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
						<div id="topRightMiddleWrap">
							<div id="deliveryWrap">
								<span id="deliName" class="names">배송료 : </span>
								<span id="deliVal" class="values">무료</span>
							</div>
							<div id="choolgoWrap">
								<p id="choolgoName" class="names">출고 예정일 : </p>
								<p id="choolgoVal" class="values">
									<fmt:formatDate value="${now}" var="curr" pattern="HH"/>
									<c:choose>
										<c:when test="${curr < 17}"><span class="choolgoDay">오늘 출고</span></c:when>
									<c:otherwise><span class="choolgoDay">내일 출고</span></c:otherwise>
									</c:choose>
									(17시 이전 주문시 당일 출고)
								</p>						
							</div>
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
							
						</div><!-- btnWrap -->
					</div><!-- detailTopRight -->
				</div><!-- detailTopWrap -->
				<div id="detailMiddleWrap">
					<c:if test="${not empty vo.b_info}">
						<div id="b_info" class="middleContentWrap">
							<h1 class='middleContentTitle'>책 소개</h1>
							<%-- ${fn:replace(vo.b_info, "\'||chr(38)||\'", '&') --%>
							${vo.b_info}
						</div>
					</c:if>
					<c:if test="${not empty vo.detail_imgurl}">
						<h1 class="middleContentTitle">상세 이미지</h1>
						<div id="detailImg" class="middleContentWrap">
							<img src="${vo.detail_imgurl}" />
						</div>
					</c:if>
					<c:if test="${not empty vo.b_list}">
						<div id="b_list" class="middleContentWrap">
							<h1 class='middleContentTitle'>목차</h1>
							${vo.b_list}
						</div>
					</c:if>
					<c:if test="${not empty vo.b_authorinfo}">
						<div id="b_info" class="middleContentWrap">
							<h1 class='middleContentTitle'>작가 소개</h1>
							${vo.b_authorinfo}
						</div>
					</c:if>
				</div>
				
				
				
			</div><!-- bookDetailWrap -->
		</div><!-- contentWrap -->
	</body>
</html>
