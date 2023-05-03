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
function findPassword(){
	document.registerform.action = "${path}/SP_ksight_member/findPassword.do";
	document.registerform.submit();
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
      				<h3 class="panel-title">비밀번호 찾기</h3>
     			</div>
     			
     			<div class="panel-body">
      				<div class="row">
       					<div class="col-lg" style="margin: auto; width: 75%;"> 
        				
        				<form method="post" name="registerform">
         					<div class="row mb-3">
          						<label for="email" class="col-sm-2 col-form-label">Email</label>
          						<div class="col-sm-10">
           							<input type="email" class="form-control" name="emailid" id="emailid" placeholder="이메일주소를 입력하세요">
           							<div>오기입시 메시지 받을 자리</div>
          						</div>
         					</div>
         					<hr style="margin: 10px;">
         
         					<div class="row mb-3">
          						<label for="member_name" class="col-sm-2 col-form-label">Name</label>
          						<div class="col-sm-10">
           							<input class="form-control" name="member_name" id="member_name" placeholder="이름을 입력하세요">
           							<div>오기입시 메시지 받을 자리</div>
          						</div>
         					</div>
         					<hr style="margin: 10px;">
         
         					<div class="row mb-3">
          						<label for="birthday" class="col-sm-2 col-form-label">Birthday</label>
          						<div class="col-sm-10">
           							<input type="date" class="form-control" name="birthday" id="birthday">
          						</div>
         					</div>
         					<hr style="margin: 10px;">
         
        				</form>
        
        					<div align="center">
        						<a href="#" class="btn btn-info btn-lg" onclick="findPassword()">비밀번호 찾기</a>
        						<hr style="margin: 10px;">
           						<a href="${path}/semi_project/member/member_register.jsp" class="btn btn-default btn-xs" style="margin: 10px 40px;">회원가입하기</a>
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