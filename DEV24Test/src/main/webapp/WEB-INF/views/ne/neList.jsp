<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>DEV24 자유게시판</title>
			<link rel="stylesheet" href="/resources/include/css/style_boot.css">
		    <link rel="stylesheet" href="/resources/include/css/style_board_content.css">
		    <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		    <script type="text/javascript" src="/resources/include/js/common.js"></script>
    
    <script type="text/javascript">
    	$(function(){
    		/*제목 클릭시 상세 페이지 이동을 위한 처리 이벤트*/
			$(".goDetail").click(function(){
				var fb_num= $(this).parents("tr").attr("data-num");
				$("#ne_num").val(fb_num);
				//상세 페이지로 이동하기 위해 form 추가(id:detailForm)
				
				$("#detailForm").attr({
					"method":"get", 
					"action":"/ne/neDetail"
				});
				$("#detailForm").submit();
			});
    		
    		$("#boardSearchBtn").click(function(){
    			if($("#search").val()!="all"){
					if(!chkSubmit("#keyword", "검색어를")) return;
				}
				goPage();
    		});
    		
    	});
    	
    	function goPage(){
			if($("#search").val()=='all'){
				$("#keyword").val("");
			}
			$("#f_search").attr({
				"method":"get", 
				"action":"/ne/neList"
			});
			$("#f_search").submit();
		}
		
    </script>
    
    <style>
    	.cnt{margin:5px;}
    </style>
    
	</head>
	<body>
	
		<form id="detailForm" name="detailForm">
			<input type="hidden" id="ne_num" name="ne_num"/>
		</form>
		<div id="content_wrap">
        <div id="title">
            <div id="tit_content">
                <h3>공지사항/이벤트</h3>
            </div>
        </div>
        
        <div id="content">
            <div id="board_search">
                <form name="f_search" id="f_search">
                    <div class="form-group">
                        <label>검색조건</label>
                        <select name="search" id="search">
                            <option value="all">전체</option>
                            <option value="fb_title">글제목</option>
                            <option value="fb_author">작성자</option>
                            <option value="fb_content">글내용</option>
                        </select>
                        <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control" />
                        <input type="button" id="boardSearchBtn" value="검색" class="btn btn-default" />
                    </div>
                </form>
            </div><!-- board_search -->
		
            <div id="table_wrap">
                <table summary="게시판 리스트" class="table">
                	<colgroup>
	                      <col width="10%" />
	                      <col width="40%" />
	                      <col width="20%" /> 
	                      <col width="20%" />
	                      <col width="10%" />
	                  </colgroup>
                    <thead>
                        <tr>
                        	<th>번호</th>
                           <th>분류</th>
                            <th class="">제목</th>
                            <th>날짜</th>
                            <th>조회수</th>
                        </tr>                
                    </thead>
                    <tbody>
                    <c:choose>       
                      <c:when test="${not empty neList}">
                      	<c:forEach var="nevo" items="${neList}" varStatus="status">
                      		<tr class="text_center" data-num="${nevo.ne_num}">
                      			<td>${nevo.ne_num}</td>
                      			<td>[${nevo.ne_cate}]</td>
                      			<td class="goDetail">
                      				${nevo.ne_title}
                      				<c:if test="${nevo.ne_rcnt>0}"><span class="cnt" style="color:red">[${nevo.ne_rcnt}]</span></c:if>
                      			</td>
                      			<td>${nevo.ne_date}</td>
                      			<td>${nevo.ne_readcnt}</td>
                      		</tr>
                      	</c:forEach>
                      </c:when>  
                    </c:choose>    
                    </tbody>
                </table>
            </div><!-- table_wrap -->
        </div> <!-- content (width : 1200px) -->
    </div> <!-- content_wrap -->
    
	</body>
</html>