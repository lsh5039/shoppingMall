<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정페이지</title>
<style>
	#msg{color:red;}
</style>
</head>
<body>
	<h1>상품수정</h1>
	<form action="/proRegMod" method="post" id="frm" onsubmit="return set()">
		<div><img src="/upload/${one.p_file}"></div>
		<div>이미지명 : ${one.p_file}</div><hr>
		<div>상품명 : <input type="text" value="${one.p_name}" name="p_name"></div>
		<div>금액 : <input type="number" value="${one.p_price}" name="p_price"></div>
		<div>카테고리 : <input type="text" value="${one.p_category}" name = "p_category"></div>
		<label><input type="checkbox" name="p_new" >신상품</label>
		<label><input type="checkbox" name="p_event" >이벤트 상품</label>
		<label><input type="checkbox" name="p_discount">할인상품</label>
		<div><input type="submit" value="수정"></div>
		<div id=msg></div>
		<a href="/upload/product">상품 모두 보기</a><br>
		<a href="/index">메인화면</a>
	</form>
</body>
<script>
	var p_discount = ${one.p_discount}
	var p_event = ${one.p_event}
	var p_new = ${one.p_new}
	if(p_discount==1){
		frm.p_discount.checked =true;
	}
	if(p_event==1){
		frm.p_event.checked = true;
	}
	if(p_new==1){
		frm.p_new.checked = true;
	}
	
	
	function set() {
		if(frm.p_name.value.length<2){
			msg.innerHTML = '상품명을 적어주세요(2자 이상)'
			
			return false;
		}else if(frm.p_price.value==""){
			msg.innerHTML = '가격을 입력해주세요(무료는 0입력)'
			return false;
		}else if(frm.p_category.value.length<2){
			msg.innerHTML = '카테고리를 적어주세요(2자 이상)'
			return false;
		}
		

		if (frm.p_new.checked) {//신상품,할인, 이벤트 숫자적용 예외처리
			frm.p_new.value = 1;
		} else {
			frm.p_new.checked =true;
			frm.p_new.value = 0;
		}
		if (frm.p_event.checked) {
			frm.p_event.value = 1;
		} else {
			frm.p_event.checked =true;
			frm.p_event.value = 0;
		}
		if (frm.p_discount.checked) {
			frm.p_discount.value = 1;
		} else {
			frm.p_discount.checked =true;
			frm.p_discount.value = 0;
		}
		if(frm.p_discount.value != 0 && frm.p_discount.value !=1 || frm.p_event.value != 0 && frm.p_event.value !=1 || frm.p_new.value!=0 && frm.p_new.value!=1 ){
			alert('오류발생');
			return false;
		}
	}
</script>

</html>