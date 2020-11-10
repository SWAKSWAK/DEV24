<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/jquery-3.5.1.min.js"></script>
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
            
            
          
        });
    </script>
    
</head>
<body>
    <!--*************************************************************-->
    
    <div id="content_wrap">
        <div id="pwdChk" class="authArea">
			<form name="f_pwd" id="f_pwd">
				<!--<input type="hidden" name="num" id="num" value="${detail.num}" />-->
				<label for="passwd" id="l_pwd">비밀번호 : &nbsp;</label>
				<input type="password" name="passwd" id="passwd" />
				
				<button type="button" class="btn btn-default" id="pwdBtn">확인</button>
				<button type="button" class="btn btn-default" id="pwdCancelBtn">취소</button>
				<span id="msg"></span>
			</form>
		</div>
		
		<div class="text-right btnArea">
		    <input type="button" id="boardUpdateFormBtn" value="글수정" class="btn btn-success" />
            <input type="button" id="boardDeleteBtn" value="글삭제" class="btn btn-success" />
            <input type="button" id="boardReplyBtn" value="글답변" class="btn btn-success" />
            <input type="button" id="boardListBtn" value="글목록" class="btn btn-primary" />
		</div>
		
		<table summary="게시판 상세 페이지" class="table" border="0">
			<tr>
				<th>글 번 호</th>
				<td>1 (조회수 : 12)</td>
				<th class="th_date">작 성 일</th>
				<td>2020-10-25</td>
			</tr>
			<tr>
				<th>글 제 목</th>
				<td colspan="3">글의 제목입니다.</td>
			</tr>
			<tr>
				<th>작 성 자</th>
				<td colspan="3">홍길동</td>
			</tr>
			<tr>
				<th>글 내 용</th>
				<td colspan="3">글의 내용입니다.<br/>글의 내용입니다.<br/>글의 내용입니다.<br/>글의 내용입니다.<br/></td>
			</tr>
		</table>
    </div> <!-- content_wrap -->
    
    <!--*************************************************************-->
    
</body>
</html>