<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Nboard_index By bootstarp</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<style type="text/css">
body {
	 font-family: 'Open Sans' ,'sans-serif';
 	 background:#f0f0f0;
}
.navbar-brand {
	font-size: 18pt;
}
.navbar-nav>li>.dropdown-menu {
    margin-top:20px;
    border-top-left-radius:4px;
    border-top-right-radius:4px;
}
.navbar-default .navbar-nav>li>a {
    width:160px;
    font-weight:bold;
}

.mega-dropdown {
  	position: static !important;
  	width:100%;
}
.mega-dropdown-menu {
    padding: 20px 0px;
    width: 100%;
    box-shadow: none;
    -webkit-box-shadow: none;
}
.mega-dropdown-menu:before {
    content: "";
    border-bottom: 15px solid #fff;
    border-right: 17px solid transparent;
    border-left: 17px solid transparent;
    position: absolute;
    top: -15px;
    left: 285px;
    z-index: 10;
}
.mega-dropdown-menu:after {
    content: "";
    border-bottom: 17px solid #ccc;
    border-right: 19px solid transparent;
    border-left: 19px solid transparent;
    position: absolute;
    top: -17px;
    left: 283px;
    z-index: 8;
}
.mega-dropdown-menu > li > ul {
  	padding: 0;
 	 margin: 0;
}
.mega-dropdown-menu > li > ul > li {
	  list-style: none;
}
.mega-dropdown-menu > li > ul > li > a {
 	 display: block;
 	 padding: 3px 20px;
 	 clear: both;
	  font-weight: normal;
	  line-height: 1.428571429;
 	 color: #999;
 	 white-space: normal;
}
.mega-dropdown-menu > li ul > li > a:hover,
.mega-dropdown-menu > li ul > li > a:focus {
 	 text-decoration: none;
 	 color: #444;
 	 background-color: #f5f5f5;
}
.mega-dropdown-menu .dropdown-header {
 	 color: #428bca;
 	 font-size: 18px;
 	 font-weight:bold;
}

#loginout li {
	list-style: none;
}

#custom-search-input{
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#custom-search-input input{
	font-size: 12pt;
    border: 0;
    box-shadow: none;
}

#custom-search-input button{
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{
    font-size: 23px;
}

</style>

<script type="text/javascript">
$(document).ready(function(){
	<%if(session == null || session.getAttribute("email") == null || session.getAttribute("email").equals("")){%>
		$("#btnLogin").click(function(){
			klogin();
		});
		$("#password").keyup(function(key){
			if(key.keyCode == 13){
				klogin();
			}
		});
	<%}else{%>
		$.ajax({
			type: "post",
			url: "${path}/SP_ksight_member/loginbox.do",
			success: function(result){
				$("#loginout").html(result);
		}
	});
	<%}%>
	
	$("#btn_K_Search").click(function(){
		ksearch();
	});
	$("#kword").keyup(function(key){
		if(key.keyCode == 13){
			ksearch();
		}
	});
});	


function ksearch(){
	var kword = $("#kword").val();
	if(kword != ""){
		location.href = "${path}/SP_ksight/list.do?kword="+kword;
	}
}
function klogin(){
	var log_email = $("#email").val();
	var log_password = $("#password").val();
	var checkId = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	var checkPassword = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,20}$/;
		if(log_email=="" || !checkId.test(log_email)){
			alert("이메일주소를 잘못 입력했습니다.");
			location.href = "${path}/semi_project/member/member_login.jsp";
		}else if(log_password=="" || !checkPassword.test(log_password)){
			alert("비밀번호를 잘못 입력했습니다.");
			location.href = "${path}/semi_project/member/member_login.jsp";
		}else{
			document.login_form.submit();			
		}
}

</script>
</head>
<body>
<div class="container">

<nav class="navbar navbar-expand-xxl navbar-default">
<!-- 창 줄었을 시 변화 -->
 <div class="navbar-header">
  <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
   <span class="sr-only">Toggle navigation</span>
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
   <span class="icon-bar"></span>
  </button>
  <a class="navbar-brand" href="${path}/semi_project/mainpage.jsp">K-Sights</a>
 </div>
	
<!-- navbar 메뉴들 -->
 <div class="collapse navbar-collapse js-navbar-collapse">
  <ul class="nav navbar-nav border d-flex justify-content-start" style="list-style: none">
   <li class="dropdown mega-dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">K - 메뉴 <span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
    <ul class="dropdown-menu mega-dropdown-menu row">
       
	 
	 <li class="col-sm-3">
	  <ul>
	   <li class="divider"></li> 
	   <li class="dropdown-header">K-NOTICE</li>
	   <li><a href="${path}/semi_project/nboard/nboard_index.jsp">#전달목록</a></li>
	   <li><a href="${path}/SP_ksight_nboard/list.do?subject=notice">#공지사항</a></li>
	   <li><a href="${path}/SP_ksight_nboard/list.do?subject=event">#이벤트</a></li>
	   <li class="divider"></li>
	   <li class="dropdown-header">K-INTRO</li>
	   <li><a href="#">#사이트소개</a></li>
	   <li><a href="#">#구현기능</a></li>
	   <li><a href="#">#DB설계도</a></li>
	  </ul>
	 </li>
	 
	 <li class="col-sm-3">
	  <ul>
	   <li class="divider"></li> 
	   <li class="dropdown-header">K-SIGHTS</li>
	   <li><a href="${path}/SP_ksight/list.do">#전체목록</a></li>
	   <li><a href="${path}/SP_ksight/list_ingi.do?ingi=film">#인기촬영지</a></li>
	   <li><a href="${path}/SP_ksight/list_ingi.do?ingi=visit">#인기방문지</a></li>
	   <li class="divider"></li>
	  <c:if test="${sessionScope.member_level > 0}">
	   <li class="dropdown-header">K-MY</li>
	   <li><a href="${path}/SP_ksight/list_ingi.do?type=near">#내주변</a></li>
	   <li><a href="${path}/SP_ksight/list_ingi.do?type=like">#내관심</a></li>
	  </c:if>
	  </ul>
	 </li>
	 
	 <li class="col-sm-3">
	  <ul>
	   <li class="divider"></li> 
	   <li class="dropdown-header">K-PLAY</li>
	   <li><a href="${path}/SP_ksight/list_ingi.do?type=cafe">#카페</a></li>
	   <li><a href="${path}/SP_ksight/list_ingi.do?type=food">#식당</a></li>
	   <li><a href="${path}/SP_ksight/list_ingi.do?type=stay">#숙소</a></li>
	   <li class="divider"></li>
	  <c:if test="${sessionScope.member_level > 1}">
	   <li class="dropdown-header">K-ADMIN</li>
	   <li><a href="${path}/semi_project/nboard/nboard_write.jsp">공지사항 작성</a></li>
	   <li><a href="${path}/semi_project/member/member_index.jsp">회원관리</a></li>
	   <li><a href="${path}/semi_project/ksight/ksight_write.jsp">게시글 작성</a></li> 
	  </c:if>  
	  </ul>
	 </li>
	 
	 <li class="col-sm-3" id="loginout">
       <form id="login_form" name="login_form" method="post" action="${path}/SP_ksight_member/login.do">
	  <ul>
       <li class="divider"></li>                     
       <li>
        <div class="form-group has-success">
        <label class="form-label mt-2" for="email">이메일</label>
         <input type="email" placeholder="email@email.com" class="form-control is-valid input-sm" id="email" name="email">
        </div>
       </li>
       <li>
        <div class="form-group has-success">
         <label class="form-label mt-2" for="password">비밀번호</label>
         <input type="password" placeholder="8글자이상." class="form-control is-valid input-sm" id="password" name="password">
        </div>
       </li>
       <li>
        <span class="btn" style="float: right;">
         <button type="button" class="btn btn-primary" id="btnLogin">K-로그인</button>
        </span>
       </li>
	  </ul>
        </form>
	 </li>
	 
	</ul>
   </li>
  </ul>
  
  
  
  
  
  <div style="text-align: right;">
   <ul class="nav navbar-nav navbar-right">
  <c:choose>
   <c:when test="${sessionScope.member_level > 0}">
    <li><a href="${path}/SP_ksight_member/logout.do"><span class="glyphicon glyphicon-log-in"></span> K-로그아웃</a></li>
   </c:when>
   <c:otherwise>
    <li><a href="${path}/semi_project/member/member_register.jsp"><span class="glyphicon glyphicon-log-in"></span> K-회원가입</a></li>
   </c:otherwise>
  </c:choose>
   </ul>
  </div>
		
  
  <div class="container text-center" style="text-align: center;" >
	<div id="custom-search-input" style="display: inline-block; width: 600px;" >
	 <div class="input-group">
	  <input type="text" class="form-control input-lg" id="kword" placeholder="지역,작품명 또는 아티스트명을 입력해보세요" />
 	  <span class="input-group-btn">
	   <button class="btn btn-info btn-lg" type="button" id="btn_K_Search">
		<i class="glyphicon glyphicon-search"></i>
	   </button>
      </span>
	 </div>
	</div>
  </div>
 </div><!-- /.nav-collapse -->
</nav>

</div>


</body>
</html>