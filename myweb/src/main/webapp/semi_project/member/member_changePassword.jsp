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
<title>KSIGHT</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<script type="text/javascript">
function changePassword(){
	var pwd = $("#pwd").val();
	var pwd2 = $("#pwd2").val();
	var checkPwd = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,20}$/;
	if(pwd == ""){
		alert("비밀번호를 입력하세요.");
		$("#pwd").focus();
		return;
	}
	if(pwd2 == ""){
		alert("비밀번호를 입력하세요.");
		$("#pwd2").focus();
		return;
	}
	if(pwd != pwd2){
		alert("입력하신 번호가 다릅니다.");
		$("#pwd2").focus();
		return;
	}
	
	if(!checkPwd.test(pwd)){
		alert("특수문자를 포함한 영문자, 숫자를 사용해서 8~20자리로 입력하세요.");
		$("#pwd").focus();
		return;
	}
	document.registerform.action = "${path}/SP_ksight_member/changePassword.do";
	document.registerform.submit();
}
function pwdOutfo(){
	var pwd = $("#pwd").val();
	var checkPwd = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,20}$/;
	var msg;
	if(pwd == ""){
		msg = "비밀번호를 입력하세요.";
		document.getElementById("pwdinfo").innerHTML = msg;
	}else if(!checkPwd.test(pwd)) {
		msg = "잘못 입력하셨습니다.";
		document.getElementById("pwdinfo").innerHTML = msg;
	}else{
		document.getElementById("pwdinfo").innerHTML = "";
	}
}

function pwd2Outfo(){
	var pwd = $("#pwd").val();
	var pwd2 = $("#pwd2").val();
	var msg;
	if(pwd2 != pwd){
		msg = "비밀번호가 다릅니다.";
		document.getElementById("pwd2info").innerHTML = msg;
	}else{
		document.getElementById("pwd2info").innerHTML = "";
	}
}

</script>
</head>
<body>

<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>

<div class="container">
  	<div class="row">
   		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
    		<div class="panel panel-info">
     			
     			<div class="panel-heading">
      				<h3 class="panel-title">비밀번호 수정</h3>
     			</div>
     			
     			<div class="panel-body">
      				<div class="row">
       					
       					<div class="col-lg" style="margin: auto; width: 75%;"> 
        				<form method="post" name="registerform">
         					
         					<div class="row mb-3">
          						<label for="email" class="col-sm-2 col-form-label">Email</label>
          						<div class="col-sm-10">
           							<input type="email" class="form-control" name="emailid" id="emailid" value="${dto.email}" readonly>
          						</div>
         					</div>
         					<hr style="margin: 10px;">
         
         					<div class="row mb-3">
          						<label for="pwd" class="col-sm-2 col-form-label">Password</label>
          						<div class="col-sm-10">
           							<input type="password" class="form-control" name="pwd" id="pwd" placeholder="영문,숫자,특수문자포함 8자리 이상" onblur="pwdOutfo()">
           							<div id="pwdinfo"></div>
          						</div>
         					</div>
         					<hr style="margin: 10px;">
         
         					<div class="row mb-3">
          						<label for="pwd2" class="col-sm-2 col-form-label">Confirm</label>
          						<div class="col-sm-10">
           							<input type="password" class="form-control" name="pwd2" id="pwd2" placeholder="비밀번호확인" onblur="pwd2Outfo()">
           							<div id="pwd2info"></div>
          						</div>
         					</div>
         					<hr style="margin: 10px;">
         
        				</form>
        
        					<div align="center">
        						<a href="#" class="btn btn-info btn-lg" onclick="changePassword()">비밀번호 변경하기</a>
        					</div>
       					
       					</div>
       					
      				</div>
      				
     			</div>
    		</div>
   		</div>
  	</div>
</div>


</body>
</html>