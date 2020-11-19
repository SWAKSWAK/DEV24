<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Swiper demo</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="/resources/include/css/swiper-bundle.css">

  <!-- Demo styles -->
  <style>
  	body * {
  		/* border: 1px solid; */
  	}
  	#content-wrap {
  		width: 100%;
  		text-align: center;
  	}
	 
  	.bodyWrap {
  		display: block;
  		width: 100%;
  		text-align: center;
  	}
  	.content {
  		display: inline-block;
  		width: 1200px
  	}
    .swiper-container {
      width: 950px;
      height: 255px;
      float: right;
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
      height: auto;
      width: 250px;
      background-color: #fafafa;
	  /* align-items: flex-start; */
    }
    
    .swiperImage {
    	width: 170px;
    	box-shadow: 6px 6px 5px -4px grey;
    }
    
    .swiper-left{
        box-shadow: 6px 6px 17px -2px grey;
	    display: inline-block;
	    width: 190px;
	    height: 139px;
	    margin: 15px 0;
	    background-color: #424874;
	    padding-top: 80px;
	    font-size: 20px;
	    color: #f4eeff;
    }
  </style>
</head>

<body>
	<div class="bodyWrap" >
		<div class="content">
			<div class="swiperWrap">
				  <div class="swiper-left">
				  		DEV24의 <br/>
				  		추천 개발자 서적
				  </div>
					  <!-- Swiper -->
				  <div class="swiper-container pull-right">
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
				      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[10].listcover_imgurl }"></div>
				      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[11].listcover_imgurl }"></div>
				      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[12].listcover_imgurl }"></div>
				      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[13].listcover_imgurl }"></div>
				      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[14].listcover_imgurl }"></div>
				      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[15].listcover_imgurl }"></div>
				      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[16].listcover_imgurl }"></div>
				      <div class="swiper-slide"><img class="swiperImage" alt="" src="${ bvoList[17].listcover_imgurl }"></div>
				    </div>
				    <!-- Add Arrows -->
				    <div class="swiper-button-next"></div>
				    <div class="swiper-button-prev"></div>
				    <!-- Add Pagination -->
				    <div class="swiper-pagination"></div>
				  </div>
			</div>
	  </div>
	</div>



  <!-- Initialize Swiper -->
  <script>
    var hold = new Swiper('.hold', {
      slidesPerView: 1,
      spaceBetween: 0,
      autoplay: stop,
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
    });
    
   var main = new Swiper('.swiper-container', {
     slidesPerView: 5,
     spaceBetween: 5,
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