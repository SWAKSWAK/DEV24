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
		
		<!-- Font Awesome -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="/resources/include/dist/css/bootstrap.min.css">
		
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 		
		
		
		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다.(조건부주석) -->
		<!--[if lt IE 9]>
			<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" href="/resources/include/css/style_cart.css">
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    	<script src="/resources/include/js/jquery-3.5.1.min.js"></script>
    	
    	<style>
    		.contentWrap {
    			text-align: center;
    		}
    		
    		.listWrap {
    			display: inline-block;
    			margin: 20px 0 150px 0;
    			width: 1200px;
    		}
    		.listWrap * {
    			/* border: 1px solid; */
    		}
    		.bookWrap {
    			width: 100%;
    			height: 245px;
    			display: inline-block;
    			border: 1px solid lightgray;
    		}
    		.bookWrap:hover{
    			box-shadow: 2px 2px 6px 1px lightgrey;
    		}
    		.listcoverWrap {
    			float: left;
    			display: inline-block;
    		}
    		.listcover {
    			height: 240px;
    		}
    		.booktext {
    			/* border: 1px solid; */
    			display: inline-block;
			    height: 100%;
			    width: 760px;
			    float: left;
			    padding-left: 15px;
       		}
       		.b_name {
       			font-weight: 1000;
       			font-size: 3rem;
       			color: #424874;
       		}
       		.authorPub {
       			font-size: 1.5rem;
       		}
       		.price {
       			font-size: 1.8rem;
       		}
       		.authorPub, .price {
       			color: #a6b1e1;
    			font-size: 3rem;
       		}
       		.rating *{
       			font-size: 3.5rem;
       		}
       		.fa-star, .fa-star-half-alt, .avgVal {
       			color: #424874;
       		}
       		.avgVal {
       			font-size: 3rem;
       			font-weight: bold;
       			color: #424874;
       		}
    	</style>
	</head>
	<body>
		<div class="contentWrap">
			<h1 id="listTitle"></h1>
			<div class="listWrap">
					<c:choose>
						<c:when test="${ not empty bookList }">
							<c:forEach var="bl" items="${ bookList }">
								<div class="bookWrap" data-num="${ bl.b_num }">
									<div class="listcoverWrap text-left">
										<img class="listcover" src="${bl.listcover_imgurl}">
									</div>
									<div class="booktext text-left">
										<h1 class="b_name">${ bl.b_name }</h1>
										<span class="authorPub">${ bl.b_author } 저 | ${ bl.b_pub }</span>
										<p class="price"> <fmt:formatNumber value="${ bl.b_price }"/> 원</p>
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
								</div>
								<div class="btnWrap">
									<input type="number" class="number text-right" name="cartCnt" value="0" min="0"/>
									<input type="button" class="btn text-right" name="cartBtn" value="장바구니 담기" />
									<input type="button" class="btn text-right" name="buyBtn" value="구매" />
								</div>
							</c:forEach>
						</c:when>
					</c:choose>
				</div>
			</div>
	</body>
</html>
