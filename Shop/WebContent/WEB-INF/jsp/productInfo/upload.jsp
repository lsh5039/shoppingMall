<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

</head>
<body>
	<form action="upload" method="post">
		<div><input type="file"></div>
		<div><input type="text" placeholder="상품명" ></div>
		<div><input type="number" placeholder="금액" ></div>
		<div><input type="text" placeholder="카테고리" ></div>
		
		<input type="radio" value="1" class="btn" >할인
		<input type="radio" value="1" class="btn" >신상품
		<input type="radio" value="1" class="btn" >이벤트상품
		<button type="reset" class="again">다시</button>
		<div><input type="submit" value="등록"></div>
	</form>
</body>
</html>