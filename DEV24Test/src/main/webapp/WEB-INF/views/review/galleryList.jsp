<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld" %> --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>갤러리 리스트</title>
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="/resources/images/common/icon.png" />
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png" />
		<!-- 모바일 웹 페이지 설정 끝 -->
		
		<!--[if lt IE 9]>
		<script src="/resources/include/js/html5shiv.js"></script>
		<![endif]-->		
		
		<!-- <link rel="stylesheet" type="text/css" href="/resources/include/css/common.css" />-->
		
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css" />
		
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css" />
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/jquery.form.min.js"></script> 
		<script type="text/javascript" src="/resources/include/js/common.js"></script>	
			
		<!-- lightbox 라이브러리.  -->
		<link rel="stylesheet" type="text/css" href="/resources/include/css/lightbox.css" />
		<script type="text/javascript" src="/resources/include/js/lightbox.min.js"></script>
			
		<!-- 페이지 네비게이션은 게시물의 총수를 이용하여 목록 수 만큼 페이지를 구현.  -->
		<script type="text/javascript" src="/resources/include/js/pagenavigator.js"></script>		
		<script type="text/javascript">
			var message = "입력한 비밀번호를 입력해 주세요.", btnKind="", galleryNum = 0;
	
			$(function() {
				var pageNum = 1;
			    var paging = $(".paging");
			    
			    function pagenav(){
					listData().then(function(galleryCnt){ 
						showPage(pageNum, galleryCnt, paging);
					});
			    }
			    pagenav();
			    
				paging.on("click",".pagination li a", function(e){
					e.preventDefault();
					var targetPageNum = $(this).attr("href");
					console.log("targetPageNum: " + targetPageNum);
					pageNum = targetPageNum;
					$("#pageNum").val(targetPageNum);
					pagenav();
				});

				if(!$("#galleryBtn").attr("data-button")){
					$("#galleryBtn").attr("data-button", "insertBtn");
				} 
					
				$("#galleryInsertBtn").click(function(){
					setModal("갤러리 등록", "insertBtn", "등록");
					dataReset();
					$('#galleryModal').modal();
				});
					
				/* 저장 버튼 클릭 시 처리 이벤트 */
				$(document).on("click", "button[data-button='insertBtn']", function(){
					//입력값 체크
					if (!checkForm($('#g_name'),"작성자를"))	return;
					else if (!checkForm($('#g_subject'),"글제목을"))	return;
					else if (!checkForm($('#g_content'),"내용을"))	return;
					else if (!checkForm($('#file'),"등록할 이미지를"))	return;
					else if (!chkFile($('#file')))	return;
					else if (!checkForm($('#g_pwd'),"비밀번호를"))	return;
					else {
						$("#f_writeForm").ajaxForm({
							url : "/gallery/galleryInsert", 
							type : "post",               
							enctype : "multipart/form-data",
							dataType : "text",
							error : function(){     
								alert('시스템 오류 입니다. 관리자에게 문의해 주세요.');
							},                        
							success : function(data){ 
								console.log(data);
								if(data=="성공"){
									$("#pageNum").val(1);
									listData().then(function(galleryCnt){ 
										showPage(1, galleryCnt, $(".paging"));
									});
									dataReset();
									$('#galleryModal').modal('hide');
								}else{
									alert("[ "+data+" ]\n등록에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.");
									dataReset();
								}
							}
						});
						$("#f_writeForm").submit(); 
					}
				});
					
				/* 팝오버(popover)에 대한 옵션 설정 */
				var options = { 
					html : true,
					placement : 'right',
					container: 'body',
					title: function() {
						return $("#popover-head").html();
					},
					content: function() {
						return $("#popover-content").html();
					}
				}
					
				/* "수정", "삭제"버튼 클릭 처리 이벤트 */
				$(document).on("click", "a[data-btn]", function(){ 
					$("a[data-btn]").not($(this)).popover(options).popover("hide");
					$(this).popover(options).popover("show");
					btnKind = $(this).attr("data-btn");
					galleryNum = $(this).parents("div.col-sm-6").attr("data-num");
					console.log("클릭 버튼 btnKind : " + btnKind + " / 선택한 글번호 : " + galleryNum);
				});
					
				/* 비밀번호 체크 화면에서 "취소" 버튼 클릭 처리 이벤트 */
				$(document).on("click", ".pwdResetBtn", function() {
					$("a[data-btn]").popover(options).popover("hide"); 
				});
					
				/* 비밀번호 확인 버튼 클릭 시 처리 이벤트 */
				$(document).on("click", ".pwdCheckBtn", function() {
					var form = $(this).parents("form[name='f_passwd']");
					var passwd = form.find(".passwd");
					var message = form.find(".message");
					var value = 0;
					if (!formCheck(passwd, message, "비밀번호를")) return;
					else {	
						/* 호출 함수.then() 함수 매개변수로 성공 콜백함수, 실패 콜백함수 넘겨줌 - 
						각 함수의 매개변수는 resolve, reject 함수에서 넘겨준 매개변수를 자동으로 넘겨 받는다. */
						pwdCheck(passwd, message).then(function(data){ 
							console.log("data : " + data);
							if(data == 1){
								console.log("비밀번호 확인 후 btnKind : " + btnKind);
								if(btnKind=="upBtn"){
									//console.log("수정 폼 출력");
									updateForm();
								}else if(btnKind=="delBtn"){
									//console.log("삭제 처리");
									deleteBtn();
								}
							}
							btnKind="";
						});
					}
				});	
					
				/* 비밀번호 확인 버튼 클릭 시 실질적인 처리 함수 */
				/*------------------------------------------------------------------------ 
				
				참고 : Promise는 자바스크립트 비동기 처리에 사용되는 객체입니다. 여기서 자바스크립트의 비동기 처리란 
				     ‘특정 코드의 실행이 완료될 때까지 기다리지 않고 다음 코드를 먼저 수행하는 자바스크립트의 특성’을 의미한다.
					 Promise는 비동기 처리가 성공(fulfilled)하였는지 또는 실패(rejected)하였는지 등의 상태 정보와 
					 처리 종료 후 실행될 콜백함수(then, catch) 담고 있는 객체이다. 
					 jQuery Deferred는 각각의 비동기식 처리에 Promise 객체를 연계하여 그 상태를 전파하는 것으로 
					 promise를 구현한 jQuery 객체이다. Deferred 객체는 상태를 가지고 있는데 이는 비동기식 처리의 상태가 변경되는 
				           시점에 특정 함수(resolve(), reject())를 호출하여 Deferred 객체에 상태를 부여하기 때문이다. 
				-------------------------------------------------------------------------- */       
				function pwdCheck(passwd, message){
					var def = new $.Deferred();
					
					$.ajax({
						url : "/gallery/pwdConfirm",  
						type : "post", 
						data : "g_num="+galleryNum+"&g_pwd="+passwd.val(),
						dataType : "text",
						error : function(){ 
									alert('시스템 오류 입니다. 관리자에게 문의해 주세요.');
						}, 
						success : function(resultData){ 
							console.log("resultData : " + resultData + " / btnKind : " + btnKind);
							// 비동기 함수 success 콜백 함수에 def.resolve() 함수 호출
							if(resultData==0){     // 일치하지 않는 경우
								message.addClass("msg_error");
								message.text("입력한 비밀번호가 일치하지 않습니다.");
								passwd.select();
							}else if(resultData==1){ // 일치할 경우
								def.resolve(resultData); 
								$("a[data-btn]").popover(options).popover("hide");
							}
						}
					});
					// def.promise() 함수 리턴
					return def.promise();
				}
	
					
				/* 모달(Modal)에서 수정 버튼으로 변경 후 처리 이벤트 */
				$(document).on("click", "button[data-button='updateBtn']", function(){ 
					//console.log("수정버튼");
					if (!checkForm($('#g_subject'),"글제목을"))	return;
					else if (!checkForm($('#g_content'),"내용을"))	return;
					else {
						if ($('#file').val()!="")	{ 
							if (!chkFile($('#file')))	return;
						}
							
						$("#f_writeForm").ajaxForm({
							url : "/gallery/galleryUpdate", 
							type : "post",               
							enctype : "multipart/form-data",
							dataType : "text",
							error : function(){     
								alert('시스템 오류 입니다. 관리자에게 문의해 주세요.');
							},                        
							success : function(data){ 
								console.log(data);
								if(data=="성공"){
									listData().then(function(galleryCnt){ 
										showPage(pageNum, galleryCnt, $(".paging"));
									});
									dataReset();
									galleryNum = 0;
									$('#galleryModal').modal('hide');
								}else{
									alert("[ "+data+" ]\n수정에 문제가 있어 완료하지 못하였습니다. 잠시 후 다시 시도해 주세요.");
									dataReset();
								}
							}
						});
						$("#f_writeForm").submit(); 
					} 
				});
			});	// 최상위 $ 종료.
		
			/** 수정 폼 화면 구현 함수 */
			function updateForm(){
				$("#f_writeForm > input[type='hidden'], #f_writeForm .image_area > img").remove();
				$.ajax({
					url : "/gallery/galleryDetail",  
					type : "get", 
					data : "g_num="+galleryNum,
					dataType : "json",
					error : function(){ 
						alert('시스템 오류 입니다. 관리자에게 문의해 주세요');
					}, 
					success : function(data){ 
						$("#g_name").val(data.g_name);
						$("#g_subject").val(data.g_subject);
						$("#g_content").val(data.g_content);
						
						var input_num = $("<input>");
						input_num.attr({"type":"hidden","name":"g_num"});
						input_num.val(data.g_num);
						
						var input_file = $("<input>");
						input_file.attr({"type":"hidden","name":"g_file"});
						input_file.val(data.g_file);
						
						var input_thumb = $("<input>");
						input_thumb.attr({"type":"hidden","name":"g_thumb"});
						input_thumb.val(data.g_thumb);
						
						var img = $("<img>");
						img.attr({"src":"/uploadStorage/gallery/thumbnail/"+data.g_thumb, "alt":data.g_subject}); 
						img.addClass("img-rounded margin_top");
						
						$("#f_writeForm").append(input_num).append(input_file).append(input_thumb);
						$(".image_area").append(img);
						$("#g_name").attr("readonly", "readonly");
						
						setModal("갤러리 수정", "updateBtn", "수정");
						$('#galleryModal').modal();
					}
				});
			}
			
			/** 글 삭제를 위한  Ajax 연동 처리 */
			function deleteBtn(){
				if(confirm("선택한 내용을 삭제하시겠습니까?")){
					$.ajax({
						url : "/gallery/galleryDelete",  
						type : "post", 
						data : "g_num="+galleryNum,
						dataType : "text",
						error : function(){ 
							alert('시스템 오류 입니다. 관리자에게 문의해 주세요.');
						}, 
						success : function(data){ 
							if (data == '성공') {
								galleryNum = 0;
								$("#pageNum").val(1);
								listData().then(function(galleryCnt){ 
									showPage(1, galleryCnt, $(".paging"));
								});
							}
						}
					}); 
				}
			}			
			
			//갤러리 리스트 요청 처리
			function listData(){
				console.log("리스트 출력");
				$("#rowArea").html("");
				var def = new $.Deferred();
				var count = 0;
				
				$.getJSON("/gallery/galleryData", $("#f_search").serialize(), function(data) {
					console.log("length: " + data.length);
					$(data).each(function(index) {
						var g_num = this.g_num;
						var g_name = this.g_name;
						var g_subject = this.g_subject;
						var g_content = this.g_content;
						var g_thumb = this.g_thumb;
						var g_file = this.g_file;
						var g_date = this.g_date;
						if(index==0){ count = this.g_count;}
						thumbnailList(g_num, g_name, g_subject, g_content, g_thumb, g_file, g_date, index);
						//accordionList(g_num, g_name, g_subject, g_content, g_thumb, g_file, g_date, index)
					});
					def.resolve(count); 
				}).fail(function() {
					alert("목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
				});
				return def.promise();
			}
			
			//부트스트랩을 활용하여 메서드 생성(콤포넌트 - 썸네일(Thumbnails))
			function thumbnailList(g_num, g_name, g_subject, g_content, g_thumb, g_file, g_date, index){
				var column = $("<div>");
				column.attr("data-num",g_num);
				column.addClass("col-sm-6 col-md-4");
				
				var thumbnail = $("<div>");
				thumbnail.addClass("thumbnail");

				var lightbox_a = $("<a>");
				lightbox_a.attr({"href":"/uploadStorage/gallery/"+g_file, "data-lightbox":"roadtrip", "title":g_subject});

				var img = $("<img>");
				img.attr("src", "/uploadStorage/gallery/thumbnail/"+g_thumb);

				var caption = $("<div>");
				caption.addClass("caption");
				
				var h3 = $("<h3>");
				h3.html(g_subject.substring(0, 12)+"...");
				
				var pInfo = $("<p>");
				pInfo.html("작성자: "+ g_name +" / 등록일: " + g_date);
				
				var pContent = $("<p>");
				pContent.html(g_content.substring(0, 24)+"...");
				
				var pBtnArea = $("<p>");
				
				var upBtn = $("<a>");
				upBtn.attr({"data-btn":"upBtn", "role":"button"});
				upBtn.addClass("btn btn-primary gap");
				upBtn.html("수정");
				
				var delBtn = $("<a>");
				delBtn.attr({"data-btn":"delBtn", "role":"button"});
				delBtn.addClass("btn btn-default");
				delBtn.html("삭제");
				
				caption.append(h3).append(pInfo).append(pContent).append(pBtnArea.append(upBtn).append(delBtn));
				column.append(thumbnail.append(lightbox_a.append(img)).append(caption));
				
				$("#rowArea").append(column);
			}
			
			
			//부트스트랩을 활용하여 메서드 생성(자바스크립트 - 아코디온(Accordion) 예제)
			function accordionList(g_num, g_name, g_subject, g_content, g_thumb, g_file, g_date, index){
				var panel = $("<div>");
				panel.addClass("panel panel-default");
				
				var panel_heading = $("<div>");
				panel_heading.addClass("panel-heading");
				panel_heading.attr({role:"tab", id:"heading"+index});
				
				var panel_title = $("<h4>");
				panel_title.addClass("panel-title");

				var	title = $("<a>");
				title.attr({"data-toggle":"collapse", "data-parent":"#accordion", "href":"#collapse"+index, "aria-controls":"collapse"+index});	
				if(index==0){
					title.attr({"aria-expanded":"true"});
				}else{
					title.attr({"aria-expanded":"false"});
					title.addClass("collapsed");
				}
				title.html(g_subject);

				var	panel_body = $("<div>");
				panel_body.addClass("panel-collapse collapse");
				if(index==0){ panel_body.addClass("in"); }
				panel_body.attr({id:'collapse'+index, role:'tabpanel', "aria-labelledby":'heading'+index});
				
				var body = $("<div>");
				body.addClass("panel-body");
				var thumb_img_area = $("<div>");
				thumb_img_area.addClass("col-md-2");
				
				var lightbox_a = $("<a>");
				// 메서드 확인 시 아래 경로로 확인
				//lightbox_a.attr({"href":"/resources/images/thumbnail/"+g_file, "data-lightbox":"roadtrip"});
				lightbox_a.attr({"href":"/uploadStorage/gallery/"+g_file, "data-lightbox":"roadtrip"});
				
				var thumb_img = $("<img>");
				// 메서드 확인 시 아래 경로로 확인
				//thumb_img.attr("src", "/resources/images/thumbnail/"+g_thumb);
				thumb_img.attr("src", "/uploadStorage/gallery/thumbnail/"+g_thumb);
				thumb_img.addClass("img-thumbnail");
				
				var date = $("<p>");
				date.addClass("form-control-static");
				date.html(g_date);

				var con = $("<p>");
				con.addClass("form-control-static");
				con.html(g_content);
				
				body.append(thumb_img_area.append(lightbox_a.append(thumb_img)));
				body.append(date).append(con);
				
				panel.append(panel_heading.append(panel_title.append(title)));
				panel.append(panel_body.append(body));
				$("#accordion").append(panel);
			} 
			// 폼 초기화 작업
			function dataReset(){
				$("#f_writeForm").each(function(){
					this.reset();
				});
			}
			
			// modal 초기화 작업
			function setModal(title, value, text) {
				$("#galleryModalLabel").html(title);
				$("#galleryBtn").attr("data-button",value);
				$("#galleryBtn").html(text);
				if($("#galleryBtn").attr("data-button")=="insertBtn"){
					$("#f_writeForm > input[type='hidden'], #f_writeForm .image_area > img").remove();
					$("#g_name").removeAttr("readonly");
					galleryNum = 0;
				}
			}
			
		</script>
	</head>
	<body>
		<div class="contentContainer container">
		
			<%-- ========= 페이징 처리를 위한 FORM ============= --%>
			<form name="f_search" id="f_search">
				<input type="hidden" name="pageNum" id="pageNum" value="${data.pageNum}" />
				<input type="hidden" name="amount" id="amount" value="10" />
			</form>
			
			<%-- 등록 버튼 영역 --%>
			<p class="text-right">
				<button type="button" class="btn btn-primary" id="galleryInsertBtn">갤러리 등록</button><!-- data-toggle="modal" data-target="#galleryModal" data-whatever="@mdo" -->
			<p>
			
			<%-- 갤러리 리스트 영역(썸네일) --%>
			<div class="row" id="rowArea"></div>
			
			<%-- 갤러리 리스트 영역(아코디온)  
			<div class="panel-group" id="accordion"role="tablist" aria-multiselectable="true"></div> --%>
			
			<%-- 갤러리 등록 화면 영역(modal) --%>
			<div class="modal fade" id="galleryModal" tabindex="-1" role="dialog" aria-labelledby="galleryModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<h4 class="modal-title" id="galleryModalLabel">갤러리 등록</h4>
						</div>
						<div class="modal-body">
							<form id="f_writeForm" name="f_writeForm">
								<div class="form-group">
									<label for="g_name" class="control-label">작성자</label>
									<input type="text" class="form-control" name="g_name" id="g_name" maxlength="5" />
								</div>
								<div class="form-group">
									<label for="g_subject" class="control-label">글제목</label>
									<input type="text" class="form-control" name="g_subject" id="g_subject" maxlength="50" />
								</div>
								<div class="form-group">
									<label for="g_content" class="control-label">글내용</label>
									<textarea class="form-control" name="g_content" id="g_content" rows="4"></textarea>
								</div>
								<div class="form-group image_area">
									<label for="file" class="control-label">이미지</label>
									<input type="file" name="file" id="file" />
								</div>
								<div class="form-group">
									<label for="g_pwd" class="control-label">비밀번호</label>
									<input type="password" class="form-control" name="g_pwd" id="g_pwd" />
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary" id="galleryBtn">등록</button>
						</div>
					</div>
				</div>
			</div>
			
			<%-- 비밀번호 확인을 위한 화면 --%>
			<div id="popover-head" class="hide">
				비밀번호 확인
			</div>
			<div id="popover-content" class="hide">
				<form name="f_passwd" class="form-inline">
					<input type="hidden" name="g_num" />	
					<div class="form-group">
						<input type="password" name="g_pwd" class="form-control passwd" />
					</div>
					<div class="form-group">	
						<label class="message">입력한 비밀번호를 입력해 주세요.</label>
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-primary pwdCheckBtn">확인</button>
						<button type="button" class="btn btn-default pwdResetBtn">취소</button>
					</div>
				</form>
			</div>
			 
			<!-- <h1>Bootstrap 페이지 네비게이션 스타일</h1> -->
			<nav class="paging text-center">
				
			</nav> 
		</div>
	</body>
</html>
