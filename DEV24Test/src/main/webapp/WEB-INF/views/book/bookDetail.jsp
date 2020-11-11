<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    		}
    		#bookDetailWrap {
    			display: inline-block;
    			width: 1000px;
    		}
    		#contentWrap * {
    			border: 1px solid;
    		}
    		#detailCover {
    			width: 400px; 
    		}
    		#detailTopleft, #detailTopRight {
    			display: inline-block;
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
						<h1 id="b_name">${vo.b_name}</h1>
						<p id="subTextWrap">
							<span id="b_author">${vo.b_author}</span>
							|
							<span id="b_pub">${vo.b_pub}</span>
							|
							<span id="b_date">${vo.b_date}</span>
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
					</div><!-- detailTopRight -->
				</div><!-- detailTopWrap -->
			</div><!-- bookDetailWrap -->
		</div><!-- contentWrap -->
	</body>
</html>
