<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lsh.Shop.user.*" %>
<%
	User user = new User();
	user = (User)request.getAttribute("user");

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>정보변경</title>
    <link rel="stylesheet" href="css/reset.css">
    <style>
        .area{width: 1500px; margin: 0 auto;}
        .title{font-size: 40px; text-align: center; margin: 50px 0;}
        .input_area{border-bottom: 1px solid #ddd; border-top: 1px solid #ddd; margin: 20px 0; position: relative;}
        .input_area > *{display: inline-block; text-align: center;}
        .input_area > p{border-right: 1px solid #ddd;padding: 30px; width: 200px;}
        .input_area > input{position: absolute; left: 340px;top: 50%; transform: translateY(-50%);}
        #test{position: absolute; left: 550px; top: 50%; transform: translateY(-50%);}
        .now{position:absolute; left:50%; line-height:76px; color: slateblue;}
        .grade_area{width:300px; margin:20px 0; }
        .grade_area > p{text-align:center;}
        .grade_area input {}
    
 
    </style>
</head>
<body>
    <div class="area">
        <h1 class="title">이름 : <%=user.getName()%></h1>
        <h1 class="title">ID : <%=user.getId() %>님의 정보</h1>
        
        <form action="mod"  method="post" onsubmit="return modAction();" id="frm">
            <div class="input_area"><p>아이디</p><input type="hidden" name="id" placeholder="id" value="<%=user.getId() %>">
            <h4 class="now"><%=user.getId() %></h4>
            </div>
            
            <div class="input_area"><p>이름</p> <input type="hidden" name="name" placeholder="name">
            	<h4 class="now"><%=user.getName()%></h4>
            </div>
            <div class="input_area"><p>보유금액</p><input type="hidden"name="address" placeholder="address">
            	<h4 class="now"><%=user.getHave_money() %></h4>
            </div>
            <div class="input_area"><p>사용한 금액</p><input type="hidden" name="number" placeholder="phone-number">
            	<h4 class="now"><%=user.getSpend_money() %></h4>
            </div>
            <div class="grade_area">
            	<p>등급</p>
            	<label><input type="radio" value="0" name="grade" checked>Normal</label>
            	<label><input type="radio" value="1" name="grade">Silver</label>
            	<label><input type="radio" value="2" name="grade">Gold</label>
            	<label><input type="radio" value="3" name="grade">Premium</label>
            </div>
            <input type="submit" value="등급변경">
        </form>
    </div>
    
    
    <script>
    	function modAction(){
    		if(frm.password.value == "" ||frm.password2.value == "" ){
    			alert('비밀번호입력');
    			return false;
    		}else if(frm.name.value==""){
    			alert("변경할 이름을 입력");
    			return false;
    		}else if(frm.address.value=""){
    			alert('변경할 주소를 입력');
    			return false;
    		}else if(frm.number.value==""){
    			alert('변경할 휴대번호를 입력')
    			return false;
    		}
    	}
    
    </script>
    
</body>
</html>