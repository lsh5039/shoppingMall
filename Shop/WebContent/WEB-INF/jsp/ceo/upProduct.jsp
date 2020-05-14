<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#msg{color:red;}
table,td,tr,th{border-collapse:collapse; border:1px solid #333; text-align:center;}
img{width:300px; height:336px;}
#title{margin:30px 0;}
#frm{margin-bottom:30px;}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
 		  <div>
            <a href="/index"><button type="button" class="btn btn-primary">메인화면</button></a>
            <a href="/upload/product"><button type="button" class="btn btn-primary">상품등록</button></a>
            <a href="/usergrade"><button type="button" class="btn btn-primary">회원관리</button></a>
            <a href="#"><button type="button" class="btn btn-primary">lorem</button></a>
          </div>
	<h1 id="title">상품을 등록합니다</h1>
	<form method="post" action="/upload/product" enctype="multipart/form-data" id="frm" onsubmit="return set()">
	<div><input type="text" name="p_name" placeholder="상품명"></div>
	<div><input type="text" name ="p_price"placeholder="가격"></div>
	<div><input type="text" name="p_category"  placeholder="카테고리 ex)바지,상의,드레스"></div>
	<label><input type="checkbox" name="p_new" >신상품</label>
	<label><input type="checkbox" name="p_event" >이벤트 상품</label>
	<label><input type="checkbox" name="p_discount">할인상품</label>
	<div><input type="file" name="file"></div>
	<div><input type="submit" value="상품업로드"></div>
	<span id="msg"></span>
	</form>
	
	
	
	${msg}
	
	<table>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>카테고리</th>
			<th>신상품</th>
			<th>이벤트상품</th>
			<th>할인상품</th>
			<th>이미지</th>
			<th>이미지명</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var = "list" items="${list}">
		<tr>
			<td>${list.p_num}</td>
			<td>${list.p_name}</td>
			<td>${list.p_price}</td>
			<td>${list.p_category }</td>
			<td>${list.p_new }</td>
			<td>${list.p_event }</td>
			<td>${list.p_discount }</td>
			<td><img src="/upload/${list.p_file }"></td>
			<td>${list.p_file}</td>
			<td><button onclick="proMod(${list.p_num})">수정하기</button></td>
			<td onclick="proDel('${list.p_num}')"><button>삭제하기</button></td>
		</tr>
		</c:forEach>
	</table>
	
	

	
	
	
	
	
	
	
	<a href="/index">메인페이지로</a>
	<script>
	
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
			}else if(frm.file.value==""){
				msg.innerHTML = '파일을 첨부해주세요'
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
		function proDel(p_num){
			if(confirm(p_num+"번 상품을 삭제합니다")){
				location.href="/proRegMod?del="+p_num;
			}
		}
		function proMod(p_num){
			if(confirm(p_num+"번 상품을 수정합니다")){
				location.href="/proRegMod?mod="+p_num;
			}
		}
		
	</script>
	
</body>
</html>