<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>freecmt.jsp</title>
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		
		<script type="text/javascript">
			
			$(function(){
				
				var fb_num = ${freeDetail.fb_num};
				listAll(fb_num)
			});
			
			
			function listAll(fb_num){
				$("#reviewList").html("");
				var url="/freecmt/all/"+fb_num+".json";
				
				$.getJSON(url, function(data){
					console.log("list count: "+data.length);
					replyCnt = data.length;
					
					//$(data) 에 있는 원소만큼 each 레코드의 번호, 이름, 내용, 날짜를 가져오기.. 
					$(data).each(function(){
						var fbc_num = this.fbc_num;
						var fbc_author = this.fbc_author;
						var fbc_content = this.fbc_content;
						var fbc_writeday = this.fbc_writeday;
						fbc_content = fbc_content.replace(/(\r\n|\r|\n)/g, "<br>");
						addItem(fbc_num, fbc_author, fbc_content, fbc_writeday);
					});
				}).fail(function(){
					alert('댓글을 불러오는데 실패했습니다. 잠시후에 다시 시도해주세요..')
				});
			}
			
			/*카페에서 받아온 함수의 소스..*/
			/** 새로운 글을 화면에 추가하기(보여주기) 위한 함수*/
			function addItem(fbc_num, fbc_author, fbc_content, fbc_writeday) {
				// 새로운 글이 추가될 div태그 객체
				var wrapper_div = $("<div>");
				wrapper_div.attr("data-num", fbc_num);
				wrapper_div.addClass("panel panel-default");
				
				var new_div = $("<div>");
				new_div.addClass("panel-heading");
			
				// 작성자 정보의 이름
				var name_span = $("<span>");
				name_span.addClass("name");
				name_span.html(fbc_author + "님");
			
				// 작성일시
				var date_span = $("<span>");
				date_span.html(" / " + fbc_writeday + " ");
			
				// 수정하기 버튼
				var upBtn = $("<button>");
				upBtn.attr({"type" : "button"});
				upBtn.attr("data-btn","upBtn");
				upBtn.addClass("btn btn-primary gap");
				upBtn.html("수정하기");
				
				
				// 삭제하기 버튼
				var delBtn = $("<button>");
				delBtn.attr({"type" : "button"});
				delBtn.attr("data-btn","delBtn");
				delBtn.addClass("btn btn-primary gap");
				delBtn.html("삭제하기");
				
				// 내용 
				var content_div = $("<div>");
				content_div.html(fbc_content);
				content_div.addClass("panel-body");
				
			
				// 조립하기
				new_div.append(name_span).append(date_span).append(upBtn).append(delBtn);
				wrapper_div.append(new_div).append(content_div);
				$("#reviewList").append(wrapper_div);
			}
		</script>
	</head>
	<body>
	
		<div id="reviewList"></div>
	
	</body>
</html>