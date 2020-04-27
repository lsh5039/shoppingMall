<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>언더비</title>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
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
		  <p onclick ="myInfoMod('${loginUser.id}')" style="cursor:pointer">계정관리</p>
         <p><a href="/logoutpage">LOGOUT</a></p>
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
   
   <div class="recommend">
       <div class="recommend_wrap">
       <c:forEach var="item" items="${list}">
                <div class="recommend_item">
                	<div class="imgBox">
                	<img src="/upload/${item.p_file}"/>
                	</div>
				<div class="state">
				<%-- <c:choose> --%>
				<c:if test = "${item.p_event == 1}" >
					<div class="event active">이벤트</div>
				</c:if>
				<c:if test = "${item.p_new == 1}" >
					<div class="new active">신상품</div>
				</c:if>
				<c:if test = "${item.p_discount == 1}" >
					<div class="discount active">할인</div>
				</c:if>
				<%-- </c:choose> --%>
                   <!-- 
                   <div class="new active">new</div>
                   <div class="discount active">할인</div> -->
               </div>
               <div class="desc">
                   <h2 class="item_name active">상품명 : ${item.p_name} </h2>
                   <p class="price">가격 : ${item.p_price}</p>
                   <div class="action">
                       <div class="go_cart">장바구니</div>
                       <div class="go_buy">구매하기</div>
                   </div>
               </div>
                </div>
        </c:forEach>
           
          <!--  <div class="recommend_item">
               <img src="https://placehold.it/300x336">
               <div class="state">
               
                   <div class="event">이벤트</div>
                   <div class="new active">new</div>
                   <div class="discount">할인</div>
               </div>
                <div class="desc">
                   <h2 class="item_name">lorem</h2>
                   <p class="price">lorem</p><div class="action">
                       <div class="go_cart">장바구니</div>
                       <div class="go_buy">구매하기</div>
                   </div>
               </div>
               
           </div>
           <div class="recommend_item">
               <img src="https://placehold.it/300x336">
               <div class="state">
                   <div class="event">이벤트</div>
                   <div class="new">new</div>
                   <div class="discount active">할인</div>
               </div>
                <div class="desc">
                   <h2 class="item_name">lorem</h2>
                   <p class="price">lorem</p><div class="action">
                       <div class="go_cart">장바구니</div>
                       <div class="go_buy">구매하기</div>
                   </div>
               </div>
               
           </div>
           <div class="recommend_item">
               <img src="https://placehold.it/300x336">
               <div class="state">
                   <div class="event active">이벤트</div>
                   <div class="new">new</div>
                   <div class="discount active">할인</div>
               </div>
                <div class="desc">
                   <h2 class="item_name">lorem</h2>
                   <p class="price">lorem</p><div class="action">
                       <div class="go_cart">장바구니</div>
                       <div class="go_buy">구매하기</div>
                   </div>
               </div>
               
           </div>
           <div class="recommend_item">
               <img src="https://placehold.it/300x336">
               <div class="state">
                   <div class="event">이벤트</div>
                   <div class="new active">new</div>
                   <div class="discount active">할인</div>
               </div>
                <div class="desc">
                   <h2 class="item_name">lorem</h2>
                   <p class="price">lorem</p><div class="action">
                       <div class="go_cart">장바구니</div>
                       <div class="go_buy">구매하기</div>
                   </div>
               </div>
           </div>
           <div class="recommend_item">
               <img src="https://placehold.it/300x336">
               <div class="state">
                   <div class="event active">이벤트</div>
                   <div class="new">new</div>
                   <div class="discount">할인</div>
               </div>
               <div class="desc">
                   <h2 class="item_name active">lorem</h2>
                   <p class="price">lorem</p>
                   <div class="action">
                       <div class="go_cart">장바구니</div>
                       <div class="go_buy">구매하기</div>
                   </div>
               </div>
               
           </div> -->
           
       </div>
       
   </div>
   
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
   function myInfoMod(id){
	   location.href='/myinfo/mod/page?id='+id;
   }
   
   </script>

</body>
</html>