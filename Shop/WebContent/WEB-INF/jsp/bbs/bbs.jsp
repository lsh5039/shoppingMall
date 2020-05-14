<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Q & A 게시판</title>
     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/js/main.js"></script>
    <style>
        .title{text-align: center; font-size: 20px; font-weight: bold; margin-top:100px;}
        .titleSecond{font-size: 12px; text-align: center; font-weight: normal; margin: 5px 0 100px 0;}
        .itemWrap{overflow: hidden; width: 1100px; margin: 0 auto;}
        .item{float: left; width: 120px; margin: 8px; border: 1px solid #333; font-size: 12px; text-align: center; padding: 10px;}
        .item:nth-child(1){margin-left: 0;}
        .item:nth-child(7){margin-right: 0;}
        #writeWrap{width: 1200px; text-align: center; border-collapse: collapse; border: 1px solid #ddd; margin: 0 auto; margin-top: 100px;}
        td {border-bottom: 1px solid #ddd;border-top: 1px solid #ddd; border-collapse: collapse; background-color: #f3f3f3;}
        a{color:#333;}
        .writeBtn{width:1200px; margin:0 auto; position:relative;}
        #btnTarget{position:absolute; right:0;}
        tr{height:30px; line-height:30px; cursor:pointer;}
        tr:hover{text-decoration:underline;}
        .noLine:hover{text-decoration:none;}
    </style>
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
       <h2 class="title">Q&A</h2>
       <p class="titleSecond">상품 Q&A중입니다</p>
     
         <div class="itemWrap">
             <div class="item">전체문의</div>
             <div class="item">상품문의</div>
             <div class="item">배송문의</div>
             <div class="item">교환/반품문의</div>
             <div class="item">배송 전 취소/변경</div>
             <div class="item">입금확인 문의</div>
             <div class="item">기타 문의</div>
         </div>
         
         <table id="writeWrap">
             <tr class="noLine">
                 <th>no</th>
                 <th>title</th>
                 <th>contents</th>
                 <th>name</th>
                 <th>date</th>
                 <th>hit</th>
             </tr>




            <c:forEach var="vo" items="${list }">
	             <tr onclick="goDetail(${vo.bbs_pk}, ${vo.pw })">
	                 <td>${vo.bbs_pk }</td>
	                 <td>${vo.title}</td>
	                 <td>${vo.content }</td>
	                 <td>${vo.name }</td>
	                 <td>${vo.r_dt }</td>
	                 <td>${vo.hits }</td>
	             </tr>
             </c:forEach>
            
         </table>
         
         <div class="writeBtn">
         	<button type="button" class="btn btn-dark" id="btnTarget" onclick="goWrite(${loginUser.pk})">글쓰기</button>
         </div>
         <p style="color:red" id="msg">${msg }</p>
         
         <div id="dymsg"></div>
      <script>
      	function goWrite(pk){
      		if(pk==null){
      			alert("글 쓰기는 로그인 후 이용가능");
      			return;
      		}
      		location.href="/write/page?pk="+pk;
      	}
        function goDetail(bbs_pk, pw){
        	if(pw == null){
        		location.href="/write/page?bbs_pk="+bbs_pk;
        		return;
        	}else{
        		dymsg.innerHTML = " <div> "+
					        		" <p>패스워드확인</p> "+
					        		" <input type='password' id='conPw'> "+
					        		" <button type='button' onclick='confirmPw("+pw+","+bbs_pk+")'>확인</button> "+
					        		" </div> ";
        	}
        }
        function confirmPw(pw,bbs_pk){
        	
        	if(conPw.value == pw ){
        		location.href="/write/page?bbs_pk="+bbs_pk;
        	}else{
        		msg.innerHTML='패스워드가 일치하지 않습니다.';
        	}
        }
         
      </script>
</body>
</html>
