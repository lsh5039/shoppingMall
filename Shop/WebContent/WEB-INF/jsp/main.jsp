<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>언더비</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/js/main.js"></script>

        

           
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
                <p><a href="/cart/page">CART</a></p>
                <p><a href="#">MYSHOP</a></p>
<c:choose>
	<c:when test="${loginUser == null}">
		 <p><a href="/joinpage">JOIN</a></p>
         <p><a href="/loginpage">LOGIN</a></p>
	</c:when>
	<c:when test="${loginUser.id eq 'admin' }">
		<p><a href=/usergrade>관리자페이지</a></p>
         <p><a href="/logoutpage">LOGOUT</a></p>
	</c:when>
	<c:otherwise>
		  <p onclick ="myInfoMod('${loginUser.id}')" style="cursor:pointer"id="MagId" >계정관리</p>
         <p><a href="/logoutpage">LOGOUT</a></p>
         <input type="hidden" value="${loginUser.pk}" id="statePk">
	</c:otherwise>
</c:choose>       
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
   
   <div class="mainbackground">
       <div class="backgound_list active"></div>
       <div class="backgound_list"></div>
       <div class="backgound_list"></div>
       <div class="backgound_list"></div>
       
       <div class="indicator">
           <div class="indicator_list active"></div>
           <div class="indicator_list"></div>
           <div class="indicator_list"></div>
           <div class="indicator_list"></div>
       </div>
       <i class="fas fa-arrow-left"></i>
       <i class="fas fa-arrow-right"></i>
   </div>
   
   
   
   <div class="findItemWrap">
   <div class ="chItemWrap">
	<select name='chItem' onchange="chItem()" id="chItem">
	  <!-- <option value='1' selected>상품선택</option> -->
	  <option value='all'>전체상품</option>
	  <option value='event'>이벤트상품</option>
	  <option value='new'>신상품</option>
	  <option value='dis'>할인상품</option>
	  
	</select>
	<input type="hidden" value="${ch}" id="ch">
	
   </div>
   
   
   
 
   	<input type="text" placeholder="검색" id="find"  >

    <span><button type="button" class="btn btn-dark" onclick="findItem()" id="findBtn">검색하기</button></span>
    <span><button type="button" class="btn btn-dark" onclick="findItemReset()">초기화</button></span>
  

   </div>
   
   
   
   
   
   
   
   <div class="recommend" id="recommend">
       <div class="recommend_wrap" id="recommend_wrap">
       <c:forEach var="item" items="${list}">
                <div class="recommend_item">
                	<div class="imgBox">
                	<img src="/upload/${item.p_file}"/>
                	</div>
				<div class="state">
				
				<c:if test = "${item.p_event == 1}" >
					<div class="event active">이벤트</div>
				</c:if>
				<c:if test = "${item.p_new == 1}" >
					<div class="new active">신상품</div>
				</c:if>
				<c:if test = "${item.p_discount == 1}" >
					<div class="dis active">할인</div>
				</c:if>
				
               </div>
               <div class="desc">
                   <h2 class="item_name active">상품명 : ${item.p_name} </h2>
                   <p class="price">가격 : ${item.p_price}</p>
                   <div class="action">
                       <div class="go_cart" onclick="goCart(${item.p_num},${loginUser.pk} )">장바구니</div>
                       <div class="go_buy">구매하기</div>
                   </div>
               </div>
                </div>
        </c:forEach>

       </div>
       
   </div>
   <table id="table">
   
   </table>
   
   <div class="move">
    <div class="top">
        <i class="fa fa-angle-up"></i>    
    </div>
    <div class="bot">
       <i class="fa fa-angle-down"></i> 
    </div>
       
       
   </div>
   <div class="btnAction">
      <div class="btnActionLeft">
         <div class="btnActionLeftDesc">
          <h3>무슨 옷을 살지 고민인분들!</h3>
          <p>youtube를 통해 깽이의 패션을 참고</p>
          <h3>이번시즌 신상은 무엇이 있을까?</h3>
          <p>Instagram을 통해 입고예정상품을 예약</p>
          <h3>패션관련 소통이 필요하신 분들</h3>
          <p>Twitter를 통해 고민해결</p>
          <h3>지금 계절엔 어떻게 입어야할까?</h3>
          <p>Facebook의 고객 전후 비교가능</p>
          </div>
      </div>
       <div class="btnActionRight">
           <div class="cencle">
               <i class="far fa-window-close"></i>
           </div>
           <div class="snsArea">
               <div class="snsItem">
                    <img src="images/facebook.jpg">
                    <p>언더비와 함께하는 Facebook</p>
               </div>
               <div class="snsItem">
                    <img src="images/instagram.jpg">
                    <p>언더비와 함께하는 Instagram</p>
               </div>
               <div class="snsItem">
                    <img src="images/twitter.png">
                    <p>언더비와 함께하는 Twitter</p>
               </div>
               <div class="snsItem">
                    <img src="images/youtube.jpg">
                    <p>깽랭Tv를 youtube로~</p>
               </div>
           </div>
       </div>
       
   </div>
   
  		
   
        <!-- <img src="/upload/회원정보변경.PNG"/> -->
        
   <script>
	
   var loginUserPk = document.getElementById("statePk");
   if(loginUserPk == null){
	  var newEle = document.createElement("input")
	  newEle.id = "statePk"
	  newEle.value = "-1";
	  newEle.type="hidden";
	  document.body.appendChild(newEle);
	  console.log(newEle)
   } 
   
	 

   var val = document.querySelector("#chItem");
  

   
   function myInfoMod(id){
	   location.href='/myinfo/mod/page?id='+id;
   }
   
   function chItem(){
	   var target = document.querySelector("#chItem");
	   var targetText = target.options[target.selectedIndex].value;
	   display(targetText);
	   var find = document.querySelector("#find");
	   find.value="";
   }
   function display(ele){//특정 class빼고 안보이게 main페이지의 상품카테고리 설정
	  var target = document.querySelectorAll("."+ele+".active");
   	  var itemList = document.querySelectorAll(".recommend_item");
   		 if(ele=="all"){
   			for(var i=0;i<itemList.length;i++){//상품 다 안보이게
   		        itemList[i].style.display="block";
   		    }	   
   			return;
	   	 }
   	 
	   	for(var i=0;i<itemList.length;i++){//상품 다 안보이게
	        itemList[i].style.display="none";
	     	
	    }
	     for(var i=0;i<target.length;i++){//해당상품만 보이게, margin값 다시조절
	        target[i].parentElement.parentElement.style.display="block";
	        target[i].parentElement.parentElement.style.margin="0 40px 40px 40px";
	        if(i%4==1){
	        	target[i-1].parentElement.parentElement.style.marginLeft="0px";
	    	}else if(i%4==0 &&i>0){
	    		target[i-1].parentElement.parentElement.style.marginRight="0px";
	    	}
	        
	    } 
	    
	     
   }
   
   var request = new XMLHttpRequest();
  function findItem(){
	  var find = document.querySelector("#find");
	  request.open("Post","./index?find="+encodeURIComponent(find.value),true);
	  request.onreadystatechange = searchProcess;
	  request.send(null);
  }
  function searchProcess(){
	  var recommend_wrap = document.getElementById("recommend_wrap");
	  
	  recommend_wrap.innerHTML = "";
	  if(request.readyState = 4 && request.status == 200){//성공적인 통신이라면
		  
		  var object = eval('(' + request.responseText + ')');
		  
	  	  var result = object.result;
	  	  console.log(result)
	  	  console.log(result[0].p_file)
	  	  ////////////////////////
	  	 var findItem = "";
	  	 var outResult="";
	  
	  	  for(var i=0; i<result.length; i++){
	  		 
	  	  
	  	  findItem = 
	  		  '<div class="recommend_item">'+
			  	'<div class="imgBox">'+
					'<img src="/upload/'+result[i].p_file+'">'+				 
			  	'</div>'+//imgBox
			  		'<div class="state">'+
			  			'<div class="event">이벤트</div>'+
			  			'<div class="new">신상품</div>'+
			  			'<div class="dis">할인</div>'+
			  		'</div>'+//state
			  	'<div class="desc">'+
			  	'<h2 class="item_name active">상품명 : '+result[i].p_name+'</h2>'+
			  	'<p class="price">가격 : '+result[i].p_price+'</p>'+
			  	'<div class="action">'+
			  	'<div class="go_cart" onclick="goCart('+result[i].p_num+','+statePk.value+')">장바구니</div>'+
			  	'<div class="go_buy" onclick="goBuy('+result[i].p_num+')">구매하기</div>'+
			  	'</div>'+//action
			  	'</div>'+//desc
	  		  '</div>';//recommend_item
		  	if(result[i].p_new == 1){
	  			findItem = findItem.replace("new","new active");
	  		}
	  		if(result[i].p_discount == 1){
	  			findItem = findItem.replace("dis","dis active");
	  		}
	  		if(result[i].p_event == 1){
	  			findItem = findItem.replace("event","event active");
	  		}
	  		outResult+=findItem
	  		  
	  		recommend_wrap.innerHTML=outResult;
	  		
	  	
   
	  	  }
  	 }
  }
  function findItemReset(){
	  
	 var find = document.getElementById('find');
	  find.value = "";
	  findBtn.click();
	  
	  
  }
  
/*   function goCart(p_num){//장바구니 

	location.href="/cart/page?p_num="+p_num;
	  
  } */
 
  function goCart(p_num,pk){
	  
	  
	  var requestCart = new XMLHttpRequest();
	  
	  if(pk == null || pk==-1){
		  alert('로그인 후 이용가능합니다.')
		  return;
	  } 
	  requestCart.open("Post","./cart/page?p_num="+encodeURIComponent(p_num),true);
	  //request.onreadystatechange = searchProcess;
	  requestCart.send(null);
	  
	  
  }
  

   
   
   </script>

</body>
</html>