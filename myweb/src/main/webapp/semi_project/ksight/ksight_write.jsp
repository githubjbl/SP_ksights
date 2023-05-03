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
<link rel="stylesheet" type="text/css" href="/myweb/semi_project/include/user-profiles-list-small.css">
<script type="application/javascript"
	src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<title>Nboard_index By bootstarp</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<style type="text/css">

#profile_h1 {
	font-size: 40pt;
}
#title_div {
	margin-top: 20px;
}
#profile_table {
	 width: 100%;
}
#profile_table td {
	font-size: 14pt;
	height: 40px;
}
#profile_table img {
	width: 100%;
}
#uploaddiv > div {
	text-align: center;
	margin: 20px;
	border: 1px dotted maroon;
}
#uploaddiv > div > div {
	margin: 10px;
}

</style>
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
	
	$("#btnCheckSight").click(function(){
		checksight();
		<%if(session == null || session.getAttribute("email") == null || session.getAttribute("email").equals("")){%>
			alert("로그인후 이용가능합니다.");
		<%}else{%>
			document.sightupload.submit();
		<%}%>
	});
});

function fn_option(code, name) {
	return '<option value="' + code +'">' + name + '</option>';
}


function readURL(input) {
	 if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  	} else {
	    document.getElementById('preview').src = "";
	}
}

function checksight(){
	var sightname = $("#sightname").val();
	var title = $("#title").val();
	var explain = $("#explain").val();
	
	var filevalue = $("#photoUL").val().split("\\");
	var filename = filevalue[filevalue.length-1];
	var checkname = /^[a-zA-Z0-9.]{2,}$/;
	
	if(!checkname.test(filename)){
		alert("한글,특수문자는 파일명으로 사용할수 없습니다.");
		return;
	}
	
	var member_address1 = $("#member_address1 > option:selected").text();
	var member_address2 = $("#member_address2 > option:selected").text();
	
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
		alert("촬영의 종류를 입력하세요.");
		return;
	}
	if(!$('input:radio[name=sighttype]').is(':checked')){
		alert("SIGHT의 종류를 입력하세요.");
		return;
	}
	if(sightname == ""){
		alert("SIGHT의 이름을 입력하세요.");
		$("#sightname").focus();
		return;
	}
	if(title == ""){
		alert("촬영주체를 입력하세요.");
		$("#title").focus();
		return;
	}
	if(explain == ""){
		alert("어떤 촬영을 했는지 입력하세요.");
		$("#explain").focus();
		return;
	}
	
	$("#v_member_address1").val(member_address1);
	$("#v_member_address2").val(member_address2);
	
	
}

</script>
</head>
<body>
<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>

<!-- Content page -->
 <div class="container">
  <div class="row">
  <div class="col-md-2 col-lg-2 p-b-80">
  </div>
  
  <form name="sightupload" method="post" action="${path}/SP_ksight/upload.do" enctype="multipart/form-data">
   <div class="col-md-8 col-lg-9 p-b-80" id="uploaddiv">
   
   <div><h2><input name="sightname" id="sightname" maxlength="200" placeholder="SIGHT의 이름" style="width: 80%;"> @</h2></div> 
  
   <div><h2><input name="title" id="title" maxlength="200" placeholder="SIGHT의 촬영주체" style="width: 80%;"></h2></div>
  
   <div>
    <img src="${path}/semi_project/images/camera2.svg" onerror="this.src='${path}/semi_project/images/camera2.svg'" id="preview" height="500px">      
    <input type="file" name="photoUL" id="photoUL" onchange="readURL(this);">
   </div>
   
   <div>
    <textarea name="explain" rows="10" placeholder="어떤 촬영을 했는지" style="width: 80%;"></textarea>
   </div> 
        
   <div>
    <label for="mediatype" class="col-sm-2 col-form-label">촬영의 종류</label>
     <div><h4>
           K-Drama <input type="radio" class="form-control-sm" name="mediatype" value="drama">
            / K-Pop <input type="radio" class="form-control-sm" name="mediatype" value="artist">
            / K-Variety <input type="radio" class="form-control-sm" name="mediatype" value="show">
            / K-Movie <input type="radio" class="form-control-sm" name="mediatype" value="movie">
     </h4></div>
   </div>
   
   <div>
    <label for="sighttype" class="col-sm-2 col-form-label">SIGHT의 종류</label>
     <div><h4>
           식당 <input type="radio" class="form-control-sm" name="sighttype" value="restaurant">
            / 카페 <input type="radio" class="form-control-sm" name="sighttype" value="cafe">
            / 숙박 <input type="radio" class="form-control-sm" name="sighttype" value="stay">
            / 상점 <input type="radio" class="form-control-sm" name="sighttype" value="store">
            / 역 <input type="radio" class="form-control-sm" name="sighttype" value="station">
            / 편의점 <input type="radio" class="form-control-sm" name="sighttype" value="cvs">
            / 기타 <input type="radio" class="form-control-sm" name="sighttype" value="playground">
     </h4></div>
   </div>
        
    <div>
      <div class="col-sm-4">
       <select class="form-control" id="member_address1">
        <option id="sido" value="">시/도</option>
       </select>
       <input type="hidden" id="v_member_address1" name="v_member_address1" value="">
      </div>
      
      <div class="col-sm-4">
       <select class="form-control" id="member_address2">
	    <option id="sigungu" value="">시/군/구</option>
       </select>
       <input type="hidden" id="v_member_address2" name="v_member_address2" value="">
      </div>
      
      <div>
       <input name="addressdetail" maxlength="50" placeholder="나머지 주소를 입력하세요" style="width: 80%;">
      </div>
      
     </div>
       
     <div>
      <input name="opentime" maxlength="200" placeholder="영업시간을 입력하세요" style="width: 80%;">
     </div>
     
     <div>
      <input name="breaktime" maxlength="200" placeholder="마감시간을 입력하세요" style="width: 80%;">
     </div>
     
     <div>
      <input name="holiday" maxlength="200" placeholder="휴무일을 입력하세요" style="width: 80%;">
     </div>
     
     <div>
      <input name="tel" maxlength="100" placeholder="SIGHT의 전화번호를 입력하세요" style="width: 80%;">
     </div>
     
     <div style="border: none;">
      <button class="btn btn-info btn-lg" type="button" id="btnCheckSight">등록하기</button>
     </div>
     
    </div>
   </form>
    
   </div>
  </div>
	


</body>
</html>