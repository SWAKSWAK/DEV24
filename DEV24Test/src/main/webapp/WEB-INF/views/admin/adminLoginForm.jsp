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
		 <script type="text/javascript" src="/resources/include/js/common.js"></script>
		 
		 <script type="text/javascript">
		 
		 function boardPwdConfirm(){
				if(!chkSubmit("#adm_passwd", "비밀번호를")) return;
				else{
					$.ajax({
						url: "/admin/pwdConfirm", //전송 url
						type:"post", 
						data:$("#f_pwd").serialize(), 
						dataTyp:"text", 
						error:function(){
							alert("시스템 오류라서 관리자에게 문의를 하셔야 합니다...");
						}, 
						success: function(resultData){
							var goUrl="";
							if(resultData == "fail"){
								location.href="/admin/adminLoginForm";
							}else if (resultData=="success"){
									location.href="/admin/adminIndex";
									
							}
								$("#f_data").attr("action", goUrl);
								$("#f_data").submit();
							}
						});
				}
			}
		 
		 	$(function(){
		 		$("#login").click(function(){
		 			boardPwdConfirm();
		 			//console.log("아이디="+ $("#adm_id").val()+ "adm_passwd="+ $("#adm_passwd").val());
		 			
		 			
		 		});
		 	});
		 </script>
		 
	</head>
	<body>
		<h3>DEV24 관리자 로그인</h3>
		<form id="f_pwd">
			<table  class="table table-striped">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="adm_id" id="adm_id"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="adm_passwd" id="adm_passwd"></td>
				</tr>
				<tr>
					<td><input type="button" name="login" id="login" value="로그인"/></td>
					<td><input type="button" name="cancel" id="cancel" value="취소"/></td>
				</tr>
			</table>
		</form>
		
	</body>
</html>