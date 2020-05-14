<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    
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
      	#joinMsg{color:red; margin-left:20px;}
    </style>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
<header>
       <div class="headerwrap">
            <div class="left_header">
                <p class="left_header_items"><a href="#">NOTICE</a></p>
                <p class="left_header_items"><a href="/q&a">Q&A</a></p>
                <p class="left_header_items"><a href="#">REVIEW</a></p>
                <p class="left_header_items"><a href="#">DELAY</a></p>
                <p class="left_header_items"><a href="#">DELIVERY</a></p>
                <p class="left_header_items"><a href="#">BOOKMARK</a></p>
            </div>
            <div class="right_header">
                <button><img src="https://placehold.it/20x20"></button>
                <input type="text" placeholder="검색">
                <p><a href="#">ORDER</a></p>
                <p><a href="#">CART</a></p>
                <p><a href="#">MYSHOP</a></p>
                <p><a href="/joinpage">JOIN</a></p>
                <p><a href="/loginpage">LOGIN</a></p>
            </div>
        </div>
    </header>
    


    <div class="area">
        <h1 class="title">REGISTER</h1>
        <p id="msg">${msg}</p>
        <form action="joinpage" method="post" id="frm" onsubmit="return chk()">
            <div class="input_area"><p>아이디</p><input type="text" name="id" placeholder="id"value="${id}"><div id="test" onclick="chkID(frm.id.value)">중복확인</div>
            </div>
            <div class="input_area"><p>비밀번호</p><input type="password" name="password" placeholder="password" id="pw1" onfocus="afterChkID()"></div>
            <div class="input_area"><p>비밀번호 확인</p><input type="password" placeholder="password" id ="pw2" ></div>
            <div class="input_area"><p>이름</p> <input type="text" name="name" placeholder="name"></div>
            <div class="input_area"><p>주소</p><input type="text"name="address" placeholder="address"></div>
            <div class="input_area"><p>번호</p><input type="text" name="number" placeholder="phone-number" onkeypress="inNumber()"></div>
            <input type="submit" value="회원가입"><span id="joinMsg"></span>
        </form>
    </div>
    <!--  -->
    
     
    <script>
    var msg = document.getElementById('msg');
    
    	function chk(){
    		if(eleChk(frm.id)){
    			return false;
    		}else if(eleChk(frm.password)){
    			return false;
    		}else if(pw1.value != pw2.value){
    			joinMsg.innerHTML = '비밀번호가 일치하지 않습니다.'
    			return false;
    		}else if(eleChk(frm.name)){
    			return false;
    		}else if(eleChk(frm.address)){
    			return false;
    		}else if(eleChk(frm.number)){
    			return false;
    		}else if(msg.innerHTML != '사용 가능한 아이디입니다.'){
    			joinMsg.innerHTML = '아이디 중복확인을 해주세요.'
    			return false;	
    		}
    		
    	}
    	function eleChk(ele){
    		if(ele.value.length==0){
    			joinMsg.innerHTML = ele.placeholder+'을(를) 입력해주세요.';
    			ele.focus();
    			return true;
    		}
    		return false;
    	}
        function inNumber(){
            if(event.keyCode<48 || event.keyCode>57){
               event.returnValue=false;
            }
        }
        function afterChkID(){
        	
        	if(msg.innerHTML != '사용 가능한 아이디입니다.'){
        		alert('아이디 중복확인 후 진행해주세요');
        		frm.id.focus();
        		return false;
        	}
        }
        function chkID(id){
        	if(id==""){
        		msg.innerHTML = '아이디를 입력해주세요';
        		return;
        	}
        	location.href="checkID?id="+id;
        }

      
       
        
        
    </script>
</body>
</html>