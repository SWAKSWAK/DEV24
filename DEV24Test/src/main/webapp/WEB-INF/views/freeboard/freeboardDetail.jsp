<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>board_detail</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    
    <link rel="stylesheet" href="/resources/include/css/style_boot.css">
    <link rel="stylesheet" href="/resources/include/css/style_board_detail.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!--<link rel="stylesheet" href="dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="dist/css/bootstrap-theme.css" />-->
    
    <script src="/resources/include/js/jquery-1.12.4.min.js"></script>
    <script src="/resources/include/js/jquery-3.5.1.min.js"></script>
    <script src="https://kit.fontawesome.com/a333e3670c.js" crossorigin="anonymous"></script>
    <script>
        $(function(){
           // gnb 메뉴 클릭 시
           $("#gnb > li").click(function(){
               var i = $(this).index();
               console.log(i);
               
               $(this).siblings("li").removeClass("on");
               $(this).addClass("on");
               
               $("#gnb > li > ul").removeClass("on");
               $("#gnb > li > ul").eq(i).addClass("on");
           });

            // 하위메뉴 마우스 커서 이동으로 메뉴 이동
            $(".dropmenu > li").mouseover(function(){
               $(this).siblings("li").removeClass("on");
               $(this).addClass("on");
           });
            $(".dropmenu").mouseleave(function(){
               $(".dropmenu > li").removeClass("on");
                $("#gnb > li > ul").removeClass("on");
           });
            
            $("#boardListBtn").click(function(){
            	location.href="/freeboard/freeboardList"
            });
          
        });
        
        
    </script>
    
</head>
<body>
    <!--*************************************************************-->
    
    <div id="content_wrap">
        <%-- <div id="pwdChk" class="authArea">
			<form name="f_pwd" id="f_pwd">
				<!--<input type="hidden" name="num" id="num" value="${detail.num}" />-->
				<label for="passwd" id="l_pwd">비밀번호 : &nbsp;</label>
				<input type="password" name="passwd" id="passwd" />
				
				<button type="button" class="btn btn-default" id="pwdBtn">확인</button>
				<button type="button" class="btn btn-default" id="pwdCancelBtn">취소</button>
				<span id="msg"></span>
			</form>
		</div> --%>
		
		<div class="text-right btnArea">
		    <input type="button" id="boardUpdateFormBtn" value="글수정" class="btn btn-success" />
            <input type="button" id="boardDeleteBtn" value="글삭제" class="btn btn-success" />
            <input type="button" id="boardReplyBtn" value="글답변" class="btn btn-success" />
            <input type="button" id="boardListBtn" value="글목록" class="btn btn-primary" />
		</div>
		
		<c:set var="detail" value="${freeDetail}"/>
		
		<table summary="게시판 상세 페이지" class="table" border="0">
			<tr>
				<th>글 번 호</th>
				<td>${detail.fb_num}</td>
				<th class="th_date">작 성 일</th>
				<td>${detail.fb_writeday}</td>
			</tr>
			<tr>
				<th>글 제 목</th>
				<td colspan="3">${detail.fb_title}</td>
			</tr>
			<tr>
				<th>작 성 자</th>
				<td colspan="3">${detail.fb_author}</td>
			</tr>
			<tr>
				<th>글 내 용</th>
				<td colspan="3">${detail.fb_content}</td>
			</tr>
			
			<tr>
				<th>이 미 지</th>
				<td colspan="3"><img src="${detail.fb_img_url}"/></td>
			</tr>
			
		</table>
    </div> <!-- content_wrap -->
    
    <!--*************************************************************-->
    
    <jsp:include page="freecmt.jsp"></jsp:include>
    
</body>
</html>