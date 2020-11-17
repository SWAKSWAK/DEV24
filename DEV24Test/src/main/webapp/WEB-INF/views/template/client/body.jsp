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