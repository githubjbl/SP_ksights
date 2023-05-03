<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.bundle.min.js"></script>
<title>Nboard_index By bootstarp</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
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
	
});	

function klogin(){
	var log_email = $("#email").val();
	var log_password = $("#password").val();
	var checkId = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	var checkPassword = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,20}$/;
		if(log_email=="" || !checkId.test(log_email)){
			var msg = "이메일주소를 잘못 입력하셨습니다.";
			document.getElementById("email_msg").innerHTML = msg;
			$("#email").focus();
		}else if(log_password=="" || !checkPassword.test(log_password)){
			var msg = "영문대소문자,특수문자,숫자포함 8자리 이상.";
			document.getElementById("password_msg").innerHTML = msg;
			$("#password").focus();
		}else{
			document.login_form.submit();
	
}
</script>
<style type="text/css">
#email_msg, #password_msg {
	color: red;
}
</style>

</head>
<body>

<div class="container">
  <div class="row">
   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
    <div class="panel panel-info">
     <div class="panel-heading">
      <h3 class="panel-title">로그인</h3>
     </div>
     <div class="panel-body">
      <div class="row">
       <div class="col-lg" style="margin: auto; width: 75%;"> 
        <form id="login_form" name="login_form" method="post" action="${path}/SP_ksight_member/login.do">
         <div class="row mb-3">
          <label for="email" class="col-sm-2 col-form-label">Email</label>
          <div class="col-sm-10">
           <input type="email" class="form-control" name="email" id="email" placeholder="이메일주소를 입력하세요">
           <div id="email_msg"></div>
          </div>
         </div>
         <hr style="margin: 10px;">
         
         <div class="row mb-3">
          <label for="password" class="col-sm-2 col-form-label">Password</label>
          <div class="col-sm-10">
           <input type="password" class="form-control" name="password" id="password" placeholder="영문,숫자,특수문자포함 8자리 이상">
           <div id="password_msg"></div>
          </div>
         </div>
         <hr style="margin: 10px;">
         
         
        </form>
        <div align="center">
        <button type="button" class="btn btn-info btn-lg" id="btnLogin">로그인하기</button>
        <hr style="margin: 10px;">
           <a href="${path}/semi_project/member/member_register.jsp" class="btn btn-default btn-xs" style="margin: 10px 40px;">회원가입하기</a>
           <a href="${path}/semi_project/member/member_findpassword.jsp" class="btn btn-default btn-xs" style="margin: 10px 40px;">비밀번호찾기</a>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
</body>
</body>
</html>