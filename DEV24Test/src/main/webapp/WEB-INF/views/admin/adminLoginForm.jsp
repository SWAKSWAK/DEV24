<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	    
		<title>DEV24 Admin Login</title>
		
		 <link href="/resources/include/dist/css/bootstrap.css" rel="stylesheet">
		 <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
	</head>
	<body>
		<h3>DEV24 관리자 로그인</h3>
		<table  class="table table-striped">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="adm_id" id="adm_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="adm_passwd" id="adm_password"></td>
			</tr>
		</table>
	</body>
</html>