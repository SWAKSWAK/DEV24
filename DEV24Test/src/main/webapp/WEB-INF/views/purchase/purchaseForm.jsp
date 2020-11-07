<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/image/icon.png" />
		<link rel="apple-touch-icon" href="/resources/image/icon.png" />
			
		<!--IE8이하 브라우저에서 HTML5를 인식하기 위해서는 아래의 패스필터를 적용하면 된다.(조건부주석) -->
		<!--[if lt IE 9]>
			<script src="/resources/js/html5shiv.js"></script>
		<![endif]-->
		
		<link rel="stylesheet" href="/resources/include/css/style_purchase.css">
		<link rel="stylesheet" href="/resources/include/css/style_cart.css">
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    	<script src="/resources/include/js/jquery-3.5.1.min.js"></script>
    	<script src="/resources/include/js/common.js"></script>
    	<script type="text/javascript">
    		var pattern = /^[0-9]*$/; // 숫자만 허용
    		
    		$(function(){
    			// 각 상품 금액 콤마 찍기
    			var price = $(".td_price span").text();
    			$(".td_price span").text(addComma(price));
    			var sumPrice = $(".td_sumPrice span").text();
    			$(".td_sumPrice span").text(addComma(sumPrice));
    			
    			// 일반도서와 이북 금액 합계 구하기
    			var l = $(".table tr.tr").length;
    			//console.log(l);
    			var b_sum = 0;
    			var eb_sum = 0;
    			for(var i=0; i<l; i++){
	    			var cate = $("tr.tr").eq(i).attr("data-cate");
	    			//console.log("cate : "+cate);
	    			var p = $("tr.tr").eq(i).find("td.td_sumPrice span").text();
	    			//console.log(p);
    				if(cate == 1){
    					b_sum += parseInt(unComma(p));
    				}else if(cate == 2){
    					eb_sum += parseInt(unComma(p));
    				}
    			}
    			var total = b_sum + eb_sum; // 최종 결제 금액 구하기
           		$("#totalprice_wrap").find(".book_price span").text(addComma(b_sum));
           		$("#totalprice_wrap").find(".ebook_price span").text(addComma(eb_sum));
           		$("#totalprice_wrap").find(".last_price span").text(addComma(total));
           		// 화면 하단 최종 결제 금액 최종확인란
           		$(".finalprice strong span").text(addComma(total));
           		$("#p_price").val(total);
				//console.log($("#p_price").val());
				
				/*******************************/
				var a = $("tr.tr").attr("data-bnum");
				var b = $("td.td_price span").text();
				$("#b_num").val(a);
				$("#pd_price").val(b);
           		
           		
           		/* 결제하기 버튼 클릭 시 */
           		$("#purchaseSuccessBtn").click(function(){
           			
           			// 유효성 체크
           			if(!chkData("#p_receiver", "받는분 이름을")) return;
           			if(!chkData("#p_zipcode", "우편번호를")) return;
           			if(!chkData("#p_address", "배송주소를")) return;
           			if(!chkData("#p_receivephone1", "받는분 연락처를")) return;
           			if(!chkData("#p_receivephone2", "받는분 연락처를")) return;
           			if(!chkData("#p_receivephone3", "받는분 연락처를")) return;
           			if(!chkData("#p_sender", "보내는분 이름을")) return;
           			if(!chkData("#p_senderphone1", "보내는분 연락처를")) return;
           			if(!chkData("#p_senderphone2", "보내는분 연락처를")) return;
           			if(!chkData("#p_senderphone3", "보내는분 연락처를")) return;
           			if(!chkData("#c_email", "보내는분 메일주소를")) return;
           			if(!$("input[name='p_pmethod']").is(":checked")){
           				alert("결제방법을 선택해주세요.");
           				return;
           			}
           			if(!$("#agreeCheck").is(":checked")){
           				alert("구매 동의사항에 체크해주세요.");
           				return;
           			}
           			// 전화번호 형식 확인
           			if(!chkTextFormat("#p_senderphone1", "전화번호 ", pattern)) return;
           			if(!chkTextFormat("#p_senderphone2", "전화번호 ", pattern)) return;
           			if(!chkTextFormat("#p_senderphone3", "전화번호 ", pattern)) return;
           			if(!chkTextFormat("#p_receivephone1", "전화번호 ", pattern)) return;
           			if(!chkTextFormat("#p_receivephone2", "전화번호 ", pattern)) return;
           			if(!chkTextFormat("#p_receivephone3", "전화번호 ", pattern)) return;
           			
           			// 전화번호 조립하기(받는분)
           			var rph1 = $("#p_receivephone1").val();
        			var rph2 = $("#p_receivephone2").val();
        			var rph3 = $("#p_receivephone3").val();
        			var full_rph = rph1+"-"+rph2+"-"+rph3;
        			$("#p_receivephone").val(full_rph);
        			//console.log($("#p_receivephone").val());
        			
        			// 전화번호 조립하기(보내는분)
           			var sph1 = $("#p_senderphone1").val();
        			var sph2 = $("#p_senderphone2").val();
        			var sph3 = $("#p_senderphone3").val();
        			var full_sph = sph1+"-"+sph2+"-"+sph3;
        			$("#p_senderphone").val(full_sph);
        			//console.log($("#p_senderphone").val());
           			
        			// 폼 데이터 전달
        			$("#f_purchase").attr({
        				"action":"/purchase/purchaseInsert",
        				"method":"post"
        			});
        			$("#f_purchase").submit();
        			
           			
           		});
    			
    		}); // 최상위 종료
    	
    	</script>

	</head>
	<body>
		<div id="content_wrap">
	       <div class="purchase_wrap">
	          <!--*** 상품확인 영역 ***-->
	           <div class="tit_cart">
	                <h3>상품확인</h3>
	            </div>
	            
	            <table class="table" border="1">
	               <colgroup>
	                   <col width="50%" /> <!--상품명-->
	                   <col width="10%" /> <!--가격-->
	                   <col width="10%" /> <!--수량-->
	                   <col width="10%" /> <!--합계-->
	               </colgroup>
	                <thead>
	                    <tr>
	                        <th>상품명</th>
	                        <th>가격</th>
	                        <th>수량</th>
	                        <th>합계</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<%-- <c:forEach var="item" items="${list}">
	                		<tr class="tr" data-num="${item.crt_num}" data-cate="${item.cateone_num}">
		                        <td class="td_book">
		                            <span class="td_bookimg"><img src="${item.listcover_imgurl}"/></span>
		                            <span class="td_bookname">${item.b_name}</span>
		                        </td>
		                        <td class="td_price"><span>${item.b_price}</span>원</td>
		                        <td>${item.crt_qty}</td>
		                        <td class="td_sumPrice"><span>${item.crt_price}</span>원</td>
		                    </tr>
	                	</c:forEach> --%>
	                	
						<tr class="tr" data-num="${list.crt_num}" data-cate="${list.cateone_num}" data-bnum="${list.b_num}" >
		                     <td class="td_book">
		                         <span class="td_bookimg"><img src="${list.listcover_imgurl}"/></span>
		                         <span class="td_bookname">${list.b_name}</span>
		                     </td>
		                     <td class="td_price"><span>${list.b_price}</span>원</td>
		                     <td>${list.crt_qty}</td>
		                     <td class="td_sumPrice"><span>${list.crt_price}</span>원</td>
		                </tr>
	                    
	                </tbody>
	            </table>
	            
	            <div id="totalprice_wrap">
	               <div class="price">
	               <p class="price_tit">총 도서금액</p>
	               <p class="price_text book_price"><span></span>원</p>
	           </div>
	           <div class="calc">+</div>
	           <div class="price">
	               <p class="price_tit">총 eBook금액</p>
	               <p class="price_text ebook_price"><span></span>원</p>
	           </div>
	           <div class="calc">=</div>
	           <div class="price">
	               <p class="price_tit">총 결제금액</p>
	               <p class="price_text last_price"><span></span>원</p>
	           </div>
	           </div><!--totalprice_wrap-->
	           
	           <form id="f_purchase" name="f_purchase">
	           		<input type="hidden" name="pd_price" id="pd_price" />
	           		<input type="hidden" name="b_num" id="b_num" />
	           
	           <%-- 배송주소 영역 --%>
			   <jsp:include page="deliveryInfo.jsp" />


	            <!--*** 최종확인 영역 ***-->
	           <div id="lastcheck_wrap">
	               <div class="finalprice">최종 결제금액 <strong><span></span>원</strong></div>
	               <p>주문하실 상품, 가격, 배송정보, 할인정보 등을 확인하였으면, 구매에 동의하시겠습니까?</p>
	               <label><input type="checkbox" name="agreeCheck" id="agreeCheck" />동의합니다.(전자상거래법 제8조 제2항)</label>
	           </div><!--lastcheck_wrap-->
	           
	           </form>
	           
	           <input type="button" name="purchaseSuccessBtn" id="purchaseSuccessBtn" class="btn btn-success" value="결제하기" />
	       </div><!--purchase_wrap-->
	
	    </div> <!-- content_wrap -->
	</body>
</html>