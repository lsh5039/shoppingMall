<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${one.bbs_pk != null }">
	<c:set var="ch" value="readonly"/>
</c:if>
<c:if test="${one.user_pk == loginUser.pk }">
	<c:set var="ch" value=""/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A 글쓰기</title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/cs	s/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="/js/main.js"></script>
    <style>
    	a{color:#333;}
    	#writeWrap{width:1000px; margin:0 auto; position:relative;}
    .title{text-align: center; font-size: 20px; font-weight: bold; margin-top:100px;}
        .titleSecond{font-size: 12px; text-align: center; font-weight: normal; margin: 5px 0 100px 0;}
        .write_item  *{float:left;}
        .write_item{overflow:hidden; margin: 5px 0;}
        .write_item  p{width:100px;}
        .write_item > textarea{width:800px; height:500px;} 
       /*  #moveToOut{position:absolute; top:-10000px;} */
        
        .btn-dark{position:absolute; right:100px; bottom:-60px;}
        .modBtn{position:absolute; right:180px; bottom:-60px;}
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
	<form action="/write/page" method="post" id="frm" onsubmit="return chk()"  enctype="multipart/form-data">
	<div><input type="hidden" name="user_pk" value="${loginUser.pk }"></div>
	<div id="writeWrap">
		<div class="write_item">
			<p>제목</p>
			<input type="text" placeholder="제목" name="title" value="${one.title }" ${ch}>
		</div>
		<div class="write_item">
			<p>이메일</p>
			<input type="email" placeholder="이매일" name="email" value="${one.email }" ${ch}>
		</div>
		<div class="write_item">
			<p>문의내용</p>
			<textarea name="content" ${ch}>${one.content }</textarea>
		</div>
	<c:if test="${one.bbs_pk eq null }">
		<div class="raido_item">
			<label><input type="radio" id="pri" name="ch">비공개글</label>
			<label><input type="radio" id="pub" name="ch" checked>공개글</label>
			<input type="password" placeholder="패스워드" name="pw" id="pw" disabled>
		</div>
		
		<div>
			<input type="file" name="img">
		</div>
		<button class="btn btn-dark" onclick="goSubmit()">Write</button>
		<input type="submit" id="moveToOut" value="글쓰기">
	</c:if>
	<c:if test="${loginUser.pk == one.user_pk }"><!--자신의 글을 보러왔을때만 보이게  -->
		<button type="button" class="btn btn-dark modBtn" id="modBtn" onclick="goMod(${one.bbs_pk})">수정</button>
		<button type="button" class="btn btn-dark delBtn" onclick="goDel(${one.bbs_pk})">삭제</button>
	</c:if>
	</div>
	</form>
	
	<p id="msg">${msg }</p>
<%-- 	로그인 유저${loginUser.pk }<br>
	게시물 유저${one.user_pk }
 --%>
<script>
	/* moveToOut.click(); */
	pri.onfocus = function(){
		pw.disabled=false;
	}
	pub.onfocus = function(){
		pw.disabled=true;
	}
	
	function goSubmit(){
		moveToOut.click();
	}
	
	
	function goDel(bbs_pk){
		location.href="/regMod?del="+bbs_pk;
	}
	
	function goMod(bbs_pk){
		var title = frm.title.value;
		var email = frm.email.value;
		var content = frm.content.value;
		
		console.log('/regMod?mod="+bbs_pk+"&title="+title+"&email="+email+"&content="+content');
		
		location.href="/regMod?mod="+bbs_pk+"&title="+title+"&email="+email+"&content="+content;
		
	}
	
</script>


</body>
</html>