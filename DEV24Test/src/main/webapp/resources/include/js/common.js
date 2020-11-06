
/** *****************************************
 * chkSubmit 함수 : 유효성 검사(공백 확인)
 * @param item 유효성체크대상
 * @param msg 메시지내용
 * @return 공백이거나 빈칸이면 false
 */
function chkSubmit(item, msg){
	if($(item).val().replace(/\s/g,"")==""){
		alert(msg+" 입력해주세요.");
		$(item).val("");
		$(item).focus();
		return false;
	}else{
		return true;
	}
}

/***************************
 정규표현식 문자포맷 지정 및 체크
 chkTextFormat(체크대상, 메시지 내용, 포맷) */
function chkTextFormat(item, msg, format){
	if($(item).val().match(format)==null){
		alert(msg+" 형식에 맞지 않습니다.");
		$(item).val("");
		$(item).focus();
		return false;
	}else{
		return true;
	}
}


/***************************
경고창이 아니라 placeholder로 유효성검사하기
checkForm(체크대상, 메시지 내용) */
function checkForm(item, msg){
	var message = "";
	if($(item).val().replace(/\s/g,"")==""){
		message = msg+" 입력해주세요.";
		$(item).attr("placeholder", message);
		$(item).val("");
		return false;
	}else{
		return true;
	}
}

/************************
 * formCheck(유효성 체크대상, 출력영역, 메시지 내용)
 * *******/
function formCheck(main, item, msg){
	if(main.val().replace(/\s/g,"")==""){
		item.css("color","#000099").html(msg+'입력해주세요.');
		main.val("");
		return false;
	}else{
		return true;
	}
}


/************************
 * addComma () : 천단위 콤마 찍기
 * *******/
function addComma(value){
     value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     return value;
}

/************************
 * unComma () : 천단위 콤마 없애기
 * *******/
function unComma(value){
	value = value.replace(/[^\d]+/g, '');
     return value;
 }


