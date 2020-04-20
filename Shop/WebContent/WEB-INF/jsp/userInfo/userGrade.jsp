<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.lsh.Shop.user.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<User> list = (List<User>) request.getAttribute("list");
%>


<!DOCTYPE html>
<html>
<head>
<style>
	table, tr, td,th{border-collapse:collapse; border:1px solid #333;}
	

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1>등급관리 페이지(관리자 삭제불가)</h1>
		<table>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>연락처</th>
				<th>주소</th>
				<th>보유머니</th>
				<th>사용한 머니</th>
				<th>등급</th>
				<th colspan="2">고객관리</th>
			</tr>
			
			<%
				
				for(User user : list){
				String strGrad="";
			%>
			<tr>
				<td><%=user.getId() %></td>
				<td><%=user.getPassword() %></td>
				<td><%=user.getName() %></td>
				<td><%=user.getNumber() %></td>
				<td><%=user.getAddress() %></td>
				<td><%=user.getHave_money() %></td>
				<td><%=user.getSpend_money() %></td>
				<td>
				<%
					if(user.getGrade()==0){
						strGrad="일반";
					}else if(user.getGrade()==1){
						strGrad="실버";
					}else if(user.getGrade()==2){
						strGrad="골드";
					}else if(user.getGrade()==3){
						strGrad="프리미엄";
					}
				%>
					<%=strGrad %>
				</td>
				<td><button onclick="mod('<%=user.getId()%>')">변경</button></td>
				<td><button onclick="del('<%=user.getId()%>')">삭제</button></td>
			</tr>
		
			<%
				}
			%>
		</table>
	
	
	<script>
		function mod(id){
			if(confirm(id+"를 수정합니다.")){
				location.href="mod?id="+id;
			}
		}
		function del(id){
			if(id=="admin"){alert('관리자 계정은 삭제불가')}
			else if(confirm(id+"를 삭제합니다.")){
				location.href="del?id="+id;
			}
		}
	
	</script>
</body>
</html>