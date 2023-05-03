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
<script type="application/javascript"
	src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
	
	//sido option 추가
	jQuery.each(hangjungdong.sido, function(idx, code) {
		//append를 이용하여 option 하위에 붙여넣음
		jQuery('#member_address1').append(fn_option(code.sido, code.codeNm));
	});

	//sido 변경시 시군구 option 추가
	jQuery('#member_address1').change(function() {
		jQuery('#member_address2').show();
		jQuery('#member_address2').empty();
		jQuery('#member_address2').append(fn_option('', '전체')); //
		jQuery.each(hangjungdong.sigugun,function(idx, code) {
			if (jQuery('#member_address1 > option:selected').val() == code.sido)
				jQuery('#member_address2').append(fn_option(code.sigugun,code.codeNm));
			});

		//세종특별자치시 예외처리
		//옵션값을 읽어 비교
		if (jQuery('#member_address1 option:selected').val() == '36') {
			jQuery('#member_address2').hide();
			//index를 이용해서 selected 속성(attr)추가
			//기본 선택 옵션이 최상위로 index 0을 가짐
			jQuery('#member_address2 option:eq(1)').attr('selected','selected');
			//trigger를 이용해 change 실행
			jQuery('#member_address2').trigger('change');
		}
	});
});

function fn_option(code, name) {
	return '<option value="' + code +'">' + name + '</option>';
}
</script>
<script type="text/javascript">
function checkId(){
	var checkid = $("#id").val()
	if(checkid != ""){
		var param = "id="+checkid;
		$.ajax({
			type: "post",
			url: "${path}/SP_ksight_member/checkid.do",
			data: param,
			success: function(check){
				$("#checknick").html(check);
			}
		});
	}else{
		alert("활동명을 입력하세요.");
	}
	
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
      <h3 class="panel-title">회원정보수정</h3>
     </div>
     <div class="panel-body">
      <div class="row">
       <div class="col-lg" style="margin: auto; width: 75%;"> 
        <form method="post" name="registerform">
         <div class="row mb-3">
          <label for="email" class="col-sm-2 col-form-label">Email</label>
          <div class="col-sm-10">
           <input type="email" class="form-control" name="email" id="email" value="${dto.email}" readonly>
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
         
         <div class="row mb-3" id="checknick">
          <label for="id" class="col-sm-2 col-form-label">Nickname</label>
          <div class="col-sm-8" >
           <input class="form-control" name="id" id="id" placeholder="한글,영문,숫자가능">
           <div id="nickinfo"></div>
          </div>
          <input class="btn btn-sm btn-default" type="button" value="중복확인" onclick="checkId()">
         </div>
         <hr style="margin: 10px;">
         
         <div class="row mb-3">
          <label for="member_name" class="col-sm-2 col-form-label">Name</label>
          <div class="col-sm-4">
           ${dto.member_name}
          </div>
          <label for="gender" class="col-sm-2 col-form-label">Gender</label>
          <div class="col-sm-4">
           ${dto.gender}
          </div>
         </div>
         <hr style="margin: 10px;">
         
         <div class="row mb-3">
          <label for="phone" class="col-sm-2 col-form-label">Phone</label>
          <div class="col-sm-10">
           <input class="form-control" name="phone" id="phone" value="${dto.phone}">
          </div>
         </div>
         <hr style="margin: 10px;">
         
         <div class="row mb-3">
          <label for="member_address1" class="col-sm-2 col-form-label">Address1</label>
          <div class="col-sm-4">
           <select class="form-control" id="member_address1">
			<option id="sido" value="">시/도</option>
           </select>
           <input type="hidden" id="v_member_address1" name="v_member_address1" value="">
          </div>
          <label for="member_address2" class="col-sm-2 col-form-label">Address2</label>
          <div class="col-sm-4">
           <select class="form-control" id="member_address2">
			<option id="sigungu" value="">시/군/구</option>
           </select>
           <input type="hidden" id="v_member_address2" name="v_member_address2" value="">
          </div>
         </div>
         <hr style="margin: 10px;">
         
         <div class="row mb-3">
          <label for="birthday" class="col-sm-2 col-form-label">Birthday</label>
          <div class="col-sm-10">
           <fmt:formatDate value="${dto.birthday}" pattern="yyyy-MM-dd"/>
          </div>
         </div>
         <hr style="margin: 10px;">
         
         <div class="row mb-3">
          <label for="mediatype" class="col-sm-2 col-form-label">Favorite</label>
          <div class="col-sm-10">
           K-Drama <input type="radio" class="form-control-sm" name="mediatype" value="drama">
            / K-Pop <input type="radio" class="form-control-sm" name="mediatype" value="artist">
            / K-Variety <input type="radio" class="form-control-sm" name="mediatype" value="show">
            / K-Movie <input type="radio" class="form-control-sm" name="mediatype" value="movie">
          </div>
         </div>
         <hr style="margin: 10px;">
         
        </form>
          
        <div align="center">
        <a href="#" class="btn btn-info btn-lg" onclick="register()">정보수정하기</a>
        </div>
       </div>
      </div>
     </div>
    </div>
   </div>
  </div>
 </div>
 <script type="text/javascript">
 function register(){
		var pwd = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		var id = $("#id").val();
		var favorite = $('input[name=mediatype]').val();
		var phone = $("#phone").val();
		var member_address1 = $("#member_address1 > option:selected").text();
		var member_address2 = $("#member_address2 > option:selected").text();
		var checkPwd = /^[a-zA-Z\\d`~!@#$%^&*()-_=+]{8,20}$/;
		var checkPhone = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
		var checking = $("#checking").val()
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
		if(id == ""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return;
		}
		if(phone == ""){
			alert("전화번호를 입력하세요.");
			$("#phone").focus();
			return;
		}
		if(!checkPhone.test(phone)){
			alert("휴대폰번호를 잘못 입력하셨습니다.");
			$("#phone").focus();
			return;
		}
		if(member_address1 == "시/도"){
			alert("주소를 입력하세요.");
			$("#member_address1").focus();
			return;
		}
		if(member_address2 == "전체"){
			alert("주소를 입력하세요.");
			$("#member_address2").focus();
			return;
		}
		if(!$('input:radio[name=mediatype]').is(':checked')){
			alert("선호장르를 입력하세요.");
			$("#favorite").focus();
			return;
		}
		if(checking != "pass"){
			alert("활동명 중복확인하세요.");
			return;
		}
		$("#v_member_address1").val(member_address1);
		$("#v_member_address2").val(member_address2);
		document.registerform.action = "${path}/SP_ksight_member/update.do";
		document.registerform.submit();
	}
 </script>
</body>
</html>