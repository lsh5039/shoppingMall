<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/reset.css">
    <style>
        .area{width: 1500px; margin: 0 auto;}
        .title{font-size: 40px; text-align: center; margin: 50px 0;}
        .input_area{border-bottom: 1px solid #ddd; border-top: 1px solid #ddd; margin: 20px 0; position: relative;}
        .input_area > *{display: inline-block; text-align: center;}
        .input_area > p{border-right: 1px solid #ddd;padding: 30px; width: 200px;}
        .input_area > input{position: absolute; left: 340px;top: 50%; transform: translateY(-50%);}
        #test{position: absolute; left: 550px; top: 50%; transform: translateY(-50%); background-color:antiquewhite; width:100px; height:30px; border-radius:15px;line-height:30px;}
      	#test:hover{cursor:pointer; background-color:#333; color:yellow; letter-spacing:3px;}
      	#msg{color:red;}
    </style>
</head>
<body>
    <div class="area">
        <h1 class="title">REGISTER</h1>
        <p id="msg">${msg}</p>
        <form action="JoinSer" method="post" id="frm" onsubmit="return chk()">
            <div class="input_area"><p>아이디</p><input type="text" name="id" placeholder="id"value="${id}"><div id="test" onclick="chkID(frm.id.value)">중복확인</div>
            </div>
            <div class="input_area"><p>비밀번호</p><input type="password" name="password" placeholder="password" id="pw1"></div>
            <div class="input_area"><p>비밀번호 확인</p><input type="password" placeholder="password" id ="pw2" onfocusout="chkPw()"></div>
            <div class="input_area"><p>이름</p> <input type="text" name="name" placeholder="name"></div>
            <div class="input_area"><p>주소</p><input type="text"name="address" placeholder="address"></div>
            <div class="input_area"><p>번호</p><input type="text" name="number" placeholder="phone-number" onkeypress="inNumber()"></div>
            <input type="submit" value="회원가입">
        </form>
    </div>
    <script>
    var msg = document.getElementById('msg');
    
    	function chk(){
    		if(msg.innerHTML!="사용 가능한 아이디입니다."){
    			alert('중복확인 후 가입해주세요.');
    			return false;
    		}
    		
    		 if(frm.id.value=="" || frm.password.value=="" || frm.name.value=="" || frm.address.value==""||frm.number.value==""){
    			alert('입력이 안 된 사항이 있습니다.');
    			return false;
    		}else if(frm.number.value.indexOf("-") > 0){
    			alert('전화번호에 -는 빼고 입력하세요!');
    			frm.number.focus();
    			return false;
    		}
    	}	
        function inNumber(){
            if(event.keyCode<48 || event.keyCode>57){
               event.returnValue=false;
            }
        }
        function chkID(id){
        	location.href="checkID?id="+id;
        }
	
       function chkPw(){
    		if(pw1.value!=pw2.value){
    			frm.name.value='비밀번호가 일치하지 않습니다.';
    			frm.address.value="비밀번호가 일치하지않습니다."
    			frm.name.disabled=true;
    			frm.address.disabled=true;
    			frm.number.disalbed=true;
    			
    		}else{
    			frm.name.value='name';
    			frm.address.value="address"
    			frm.name.disabled=false;
    			frm.address.disabled=false;
    			frm.number.disalbed=false;
    		}
       }
       
        
        
    </script>
</body>
</html>