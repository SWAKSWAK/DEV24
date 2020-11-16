<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
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
		
		<link rel="stylesheet" href="/resources/include/css/style_review.css" />
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
		
		<script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    	<script src="/resources/include/js/jquery-3.5.1.min.js"></script>
    	<script src="/resources/include/js/common.js"></script>
		<script src="https://kit.fontawesome.com/a333e3670c.js" crossorigin="anonymous"></script>
		<style type="text/css">
			.review_table td{
				padding-left:20px !important;
			}
			.review_table *{
				font-size: 14px !important;
			}
			#review_tab *	{
				font-size: 16px !important;
			}
			tr.tr_revcmtInsert{
				border-bottom: none !important;
			}
			    
		</style>
		
		<script type="text/javascript">
			$(function(){
				/* 리뷰 리스트 출력 */
				var b_num = ${vo.b_num};
				var url = "/review/all/"+b_num; //+".json"
				
				// getJSON(요청url, 파라미터값, success fn, fail fn)
				/*$.getJSON(url, function(data){ // success
					console.log("list count : "+data.length); // 리뷰 개수
					replyCnt = data.length;
					$(data).each(function(){
						var re_num = this.re_num;
						var re_score = this.re_score;
						var c_num = this.c_num;
						var c_nickname = this.c_nickname;
						var re_writedate = this.re_writedate;
						var re_type = this.re_type;
						var re_content = this.re_content;
						var pd_num = this.pd_num;
						var re_imgurl = this.re_imgurl;
						
						re_content = re_content.replace(/(\r\n|\r|\n)/g,"<br/>");
					});
				
				}).fail(function(){ // error
					alert("리뷰 목록을 불러오는데 실패했습니다. 잠시 후에 다시 시도해 주세요.");
				});*/
				/*
				$.ajax({
					url : "url",
					type:"post",
					data:"r_num="+r_num+"&r_pwd="+pwd.val(),
					dataType:"text",
					error:function(){
						alert("시스템 오류. 관리자에게 문의하세요.");
					},
					success : function(resultData){
						console.log("resultData : "+resultData);
						// 비동기 함수 success 콜백 함수에 def.resolve() 함수 호출
						if(resultData==0){
							msg.addClass("msg_error");
							msg.text("입력한 비밀번호가 일치하지 않습니다.");
							pwd.select();
						}else if(resultData==1){
							def.resolve(resultData);
							$(pwd).parents("div.panel .panel-heading .pwdArea").remove();
						}
					}
				});*/
				
				
				
				/* 리뷰 메뉴 버튼 클래스 추가 제거 */
				$("#review_tab > div").click(function(){
					$(this).addClass("on").siblings("div").removeClass("on");
				});
				
				
			}); // 최상위 종료
			
			
			
		</script>

	</head>
	<body>
		<div id="content_wrap">
			<div id="review_wrap">
	           <div id="review_tab">
	               <div class="review_type on">전체</div>
	               <div class="review_type">이미지리뷰</div>
	               <div class="review_type">텍스트리뷰</div>
	           </div>
	
	            <ul id="ordeBy">
	                <li>최신글순</li>
	                <li>평점높은순</li>
	                <li>평점낮은순</li>
	            </ul>
	            
	            <div id="paging">페이징 처리부분</div>
	            
	            <c:choose>
	            	<c:when test="${not empty revoList}">
	            		<table class="table review_table">
			                <tr>
			                    <td>${revoList.c_nickname} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${revoList.re_writedate}</td>
			                    <td>평점 : ${revoList.re_score}</td>
			                </tr>
			                <tr>
			                    <td colspan="2">${revoList.re_content}</td>
			                </tr>
			                <tr>
			                    <td colspan="2">${revoList.re_imgurl}</td>
			                </tr>
			                <tr class="tr_revcmtInsert">
			                    <td colspan="2">
			                       <div class="revcmt_wrap">
			                            <input type="text" placeholder="댓글을 입력하세요." name="rec_content" class="rec_content form-control" />
			                            <button tpye="button" class="revcmtInsertBtn btn btn-primary">댓글입력</button>
			                        </div>
			                    </td>
			                </tr>
			                <tr class="tr_revcmt">
			                    <td colspan="2">
			                      <div class="revcmt_wrap revcmt">
			                           <p>댓글 닉네임 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2020-10-10</p>
			                           <div>eotfjsldfjsldfjsldkfjslfjlfskjfsdnsdl;fs;df;ipsd??</div>
			                       </div>
			                       <div class="revcmt_wrap revcmt">
			                           <p>댓글 닉네임 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2020-10-10</p>
			                           <div>eotfjsldfjsldfjsldkfjslfjlfskjfsdnsdl;fs;df;ipsd??</div>
			                       </div>
			                    </td>
			                </tr>
			            </table>
	            	</c:when>
	            	<c:otherwise>
	            		<table class="table review_table">
			                <tr>
			                    <td colspan="2" style="text-align:center">등록된 리뷰가 없습니다. 상품 구매 시 리뷰를 작성할 수 있습니다.</td>
			                </tr>
			            </table>
	            	</c:otherwise>
	            </c:choose>
	            
	        </div> <!-- review_wrap -->
        </div> <!-- content_wrap -->
	</body>
</html>