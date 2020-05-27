<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
</head>
<body>
	<h2>${loginUser.name}님의 장바구니 목록</h2>
	<table>
		<tr>
			<th>상품사진</th>
			<th>상품명</th>
			<th>상품가격</th>
		</tr>
		<c:forEach var="item" items="${list }">
		<tr>
			<td>1</td>
			<td>${item.p_name }</td>
			<td>${item.p_price }</td>
		</tr>
		</c:forEach>
	
	</table>

</body>
</html>
