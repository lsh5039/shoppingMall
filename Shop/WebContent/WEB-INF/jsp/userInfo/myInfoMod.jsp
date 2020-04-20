<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>정보변경</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/main.css">
    
    <style>
        .area{width: 1500px; margin: 0 auto;}
       
        
        .input_area{border-bottom: 1px solid #ddd; border-top: 1px solid #ddd; margin: 20px 0; position: relative;}
        .input_area > *{display: inline-block; text-align: center;}
        .input_area > p{border-right: 1px solid #ddd;padding: 30px; width: 200px;}
        .input_area > input{position: absolute; left: 340px;top: 50%; transform: translateY(-50%);}
         #test{position: absolute; left: 550px; top: 50%; transform: translateY(-50%); background-color:antiquewhite; width:100px; height:30px; border-radius:15px;line-height:30px;}
      	#test:hover{cursor:pointer; background-color:#333; color:yellow; letter-spacing:3px;}
      	#msg{color:red;}
      	#joinMsg{color:red; margin-left:20px;} 
		 .title{font-size: 40px; text-align: center; margin: 250px 0 50px 0;}
    </style>
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
     <script src="/js/main.js"></script>
</head>
<body>
<header>
	
       <div class="headerwrap">
            <div class="left_header">
                <p class="left_header_items"><a href="#">NOTICE</a></p>
                <p class="left_header_items"><a href="#">Q&A</a></p>
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
                <p><a href="#">LOGIN</a></p>
                 
            </div>
        </div>
    </header>
	<h1 id="title"><a href="#">UNDER-VI</a></h1>
    
    
    <nav id="gnb">
        <div class="nav_wrap">
            <div class="category_left_btn">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
            </div>
            <div class="category target">BY.UNDER-VI</div>
            <div class="category" id="target">luv,봄♥</div>
            <div class="category">NORMAL</div>
            <div class="category" id="target">BEST 30</div>
            <div class="category">OUTER</div>
            <div class="category">TOP</div>
            <div class="category">BLOUSE</div>
            <div class="category">KNIT</div>
            <div class="category">PANTS</div>
            <div class="category">SKIRT</div>
            <div class="category">DRESS</div>
            <div class="category">SHOES & BAG</div>
            <div class="category">ACC</div>
            <div class="category">당일배송</div>
            <div class="category">SALE</div>
            <div class="category_right_btn">
                <div class="cart">
                   <i class="fas fa-cart-arrow-down"></i>
                    <p>CART</p>
                </div>
                <div class="wish">
                    <i class="far fa-heart"></i>
                    <p>WISH</p>
                </div>
                
            </div>
        </div>
        
    </nav>
    
   <div class="item_list">
       <div class="item">
           <p class="list"><a href="#">OUTER</a></p>
           <p class="list"><a href="#">TOP/BLOUS/DRESS</a></p>
           <p class="list"><a href="#">OUR/PANTS</a></p>
           <p class="list"><a href="#">PLZ</a></p>
           <p class="list"><a href="#">ACC</a></p>
           
       </div>
       <div class="item">
           <p class="list"><a href="#">MADE</a></p>
           <p class="list"><a href="#">코트</a></p>
           <p class="list"><a href="#">자켓</a></p>
           <p class="list"><a href="#">패딩&야상</a></p>
           <p class="list"><a href="#">무스탕</a></p>
          
       </div>
       <div class="item">
           <p class="list"><a href="#">MADE</a></p>
           <p class="list"><a href="#">티셔츠</a></p>
           <p class="list"><a href="#">맨투맨&후드</a></p>
           <p class="list"><a href="#">Homewear</a></p>
           <p class="list"></p>
          
       </div>
       <div class="item">
           <p class="list"><a href="#">블라우스</a></p>
           <p class="list"><a href="#">셔츠&남방</a></p>
           <p class="list"></p>
           <p class="list"></p>
           <p class="list"></p>
          
       </div>
       <div class="item">
           <p class="list"><a href="#">니트</a></p>
           <p class="list"><a href="#">가디건</a></p>
           <p class="list"></p>
           <p class="list"></p>
        
           <p class="list"></p>
       </div>
       <div class="item">
           <p class="list"><a href="#">OUR</a></p>
           <p class="list"><a href="#">슬림핏</a></p>
           <p class="list"><a href="#">일자&와이드</a></p>
           <p class="list"><a href="#">밴딩</a></p>
           <p class="list"><a href="#">반바지</a></p>
           
       </div>
       <div class="item">
           <p class="list"><a href="#">숏/미디</a></p>
           <p class="list"><a href="#">롱</a></p>
           <p class="list"></p>
           <p class="list"></p>
           
           <p class="list"></p>
       </div>
       <div class="item">
           <p class="list"><a href="#">신발</a></p>
           <p class="list"><a href="#">가방</a></p>
           <p class="list"></p>
          
           <p class="list"></p>
           <p class="list"></p>
       </div>
       <div class="item">
           <p class="list"><a href="#">earring 귀걸이</a></p>
           <p class="list"><a href="#">necklace 목걸이</a></p>
           <p class="list"><a href="#">ring 반지</a></p>
           <p class="list"><a href="#">기타</a></p>
           <p class="list"></p>
 
       </div>
       <div class="item">
           <p class="list"><a href="#">Sale</a></p>
           <p class="list"><a href="#">Flea market</a></p>
           <p class="list"><a href="#">only you</a></p>
           <p class="list"><a href="#">공구</a></p>
           <p class="list"></p>
       </div>
   </div>

	<div class="area">

		 <h1 class="title">${user.id}님의 정보</h1>
        <p id="msg">${msg}</p>
		<form action="/myinfo/mod/page" method="post" id="frm" onsubmit="return chk()">
			<div class="input_area"><p>아이디</p><input type="text" name="id" placeholder="id"value="${user.id}" readonly></div>
            <div class="input_area"><p>비밀번호</p><input type="password" name="password" placeholder="password" id="pw1" onfocus="afterChkID()"></div>
            <div class="input_area"><p>비밀번호 확인</p><input type="password" placeholder="password" id ="pw2" ></div>
            <div class="input_area"><p>이름</p> <input type="text" name="name" placeholder="name" value="${user.name }"></div>
            <div class="input_area"><p>주소</p><input type="text"name="address" placeholder="address" value="${user.address}"></div>
            <div class="input_area"><p>번호</p><input type="text" name="number" placeholder="phone-number" onkeypress="inNumber()"value="${user.number}"></div>
            <input type="submit" value="정보변경"><span id="joinMsg"></span>
			
		</form>
	</div>
	<script>
	function chk(){
		if(eleChk(frm.password)){
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
   
    function chkID(id){
    	location.href="checkID?id="+id;
    }
	
	
	</script>
	
</body>
</html>
