<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Swiper demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="/resources/include/css/swiper-bundle.css">

	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	<style>
		#content_wrap{
			width:1200px;
			margin : 0 auto;
		}
		#row1{
			width: 100%;
			height: 300px;
			margin-top : 30px;
		}
		#row1 > div{
			float:left;
		}
		#row1{
			clear : both;
			display : block;
			content:'';
		}
		#main_menu{
			width:calc(50% - 40px);
			border: 4px solid #a6b1e1;
		    padding: 20px;
		    border-radius: 10px;
		    height: 220px;
		    line-height: 30px;
		}
		#main_menu > ul{
			float:left;
		    width:50%;
		}
		#main_menu > ul > li{text-align : center;}
		#main_menu > ul > li >a{
			font-size: 18px;
		}
		#main_menu:after{
			clear : both;
			display : block;
			content:'';
		}
		#row1 #main_img{
			width:calc(50% - 20px);
			float:right;
			height: 268px;
    		background-image: url("/resources/image/main_image.jpg");
    		background-size: cover;
		    background-repeat: no-repeat;
		    background-position: 0px -60px;
		    position: relative;
		}
		#main_img > p{
			position: absolute;
			top:50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    color:#fff;
		    font-size:35px;
		    width: 100%;
		    text-align: center;
		    font-weight: bold;
		    letter-spacing: 5px;
		    text-shadow: 6px 7px 5px rgba(0,0,0,0.7);
		}
		li.all{
			font-weight: bold;
			padding-bottom: 10px;
		}
		li.all:after{
		    content: '';
		    display: block;
		    border: 1px solid #ccc;
		    margin: 0px 30px 0px 30px;
		    background-color:#ccc;
		    margin-top: 10px;
		}
		#main_menu ul li:hover{
			text-decoration: underline;
		}
		
	</style>
	
  <!-- Demo styles -->
  <style>
    .swiper-container {
      width: 1000px;
      height: 416px;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
     /* width : 230px !important; */
      height: 415px;
      width: 250px;
      background-color: #fafafa;
    }
    
    .swiperImage {
    	width: 100%;
    }
  </style>
</head>

<body>
<div id="content_wrap">
	<div id="row1">
		<div id="main_menu">
			 <ul class="book_menu">
               <li class="all"><a href="/book/10">일반도서 전체</a></li>
               <li class=""><a href="/book/11">프로그래밍 언어</a></li>
               <li><a href="/book/12">OS/데이터베이스</a></li>
               <li><a href="/book/13">웹사이트</a></li>
               <li><a href="/book/14">컴퓨터 입문/활용</a></li>
               <li><a href="/book/15">네트워크/해킹/보안</a></li>
             </ul>
             <ul class="ebook_menu">
         	  	<li class="all"><a href="/book/20">eBook 전체</a></li>
                <li><a href="/book/26">IT전문서</a></li>
                <li><a href="/book/27">컴퓨터 수험서</a></li>
                <li><a href="/book/28">웹/컴퓨터 입문&활용</a></li>
             </ul>
		</div>
		<div id="main_img">
			<p>우리 모두 책을 읽읍시다.</p>
		</div>
	
	</div> <!-- row1 -->
	
	
  <!-- Swiper -->
  <div class="swiper-container">
    <div class="swiper-wrapper">
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[0].listcover_imgurl }"></div>
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[1].listcover_imgurl }"></div>
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[2].listcover_imgurl }"></div>
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[3].listcover_imgurl }"></div>
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[4].listcover_imgurl }"></div>
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[5].listcover_imgurl }"></div>
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[6].listcover_imgurl }"></div>
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[7].listcover_imgurl }"></div>
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[8].listcover_imgurl }"></div>
      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[9].listcover_imgurl }"></div>
    </div>
    <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
  </div>

</div>  <!-- content_wrap -->


  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 3,
      spaceBetween: 30,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
    });
  </script>
</body>

</html>
		
				<!-- swiper -->
		  <script>
		    var swiper = new Swiper('.swiper-container', {
		      slidesPerView: 3,
		      spaceBetween: 30,
		      slidesPerGroup: 1,
		      loop: true,
		      loopFillGroupWithBlank: true,
		      pagination: {
		        el: '.swiper-pagination',
		        type: 'progressbar',
		        clickable: true,
		      },
		      navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		      }, 
		      autoplay: {
		    	    delay: 4000,
		    	  },
		    });
		  </script>