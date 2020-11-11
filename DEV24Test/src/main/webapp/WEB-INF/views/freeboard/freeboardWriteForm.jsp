<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="/resources/include/css/style_boot.css">
		<link rel="stylesheet" href="/resources/include/css/style_board_content.css">
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		
		<script type="text/javascript">
			
		</script>
		
		<title>freeboardWriteForm.jsp</title>
		
	</head>
	
	<body>
		<div class="container">
			<form id="f_writeForm" name="f_writeForm" class="form-horizontal">
				<table class="table table-bordered">
					<colgroup>
						<col width="20%"/>
						<col width="80%"/>
					</colgroup>
					
					<tbody>
					<tr>
						<td>작성자</td>
						<td class="text-left"><input type="text" name="b_name" id="b_name" class="form-control"/></td>
					</tr>
					
					<tr>
						<td>글제목</td>
						<td class="text-left"><input type="text" name="fb_title" id="fb_title" class="form-control"/><br/></td>
					</tr>
					
					<tr>
						<td>글내용</td>
						<td><textarea rows="10" cols="100" name="b_content" id="b_content" class="form-control" rows="8" style="resize:none"></textarea></td>
					</tr>
				
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="b_pwd" id="b_pwd" maxlength="16"/></td>
					</tr>
					
					
					
					</tbody>		
				</table>	
			</form>
		</div>
		
		<br/>
		<br/>
		
	</body>
</html>