<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>K-SIGHT</title>
<%@ include file="/semi_project/include/headForSemi.jsp"%>
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
$(function() {
	$('#n_div-link').click(function(e) {
		$("#n_div").delay(100).fadeIn(100);
		$("#m_div").fadeOut(100);
		$("#a_div").fadeOut(100);
		$('#m_div-link').removeClass('active');
		$('#a_div-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#m_div-link').click(function(e) {
		$("#m_div").delay(100).fadeIn(100);
		$("#n_div").fadeOut(100);
		$("#a_div").fadeOut(100);
		$('#n_div-link').removeClass('active');
		$('#a_div-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#a_div-link').click(function(e) {
		$("#a_div").delay(100).fadeIn(100);
		$("#n_div").fadeOut(100);
		$("#m_div").fadeOut(100);
		$('#n_div-link').removeClass('active');
		$('#m_div').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	
	$("#btnSort_n").click(function(){
		var member_address1 = $("#member_address1 > option:selected").text();
		var member_address2 = $("#member_address2 > option:selected").text();
		location.href = "${path}/SP_ksight/sort.do?sort=na&p1="+member_address1+"&p2="+member_address2;
	});
	
	$("#btnSort_m").click(function(){
		var mediatype = $('input[name="mediatype"]:checked').val();
		var ini = $('input[name="mfirstname"]:checked').val();
		if(ini==null){
			alert("옵션을 선택하세요.")
			return;
		}
		location.href = "${path}/SP_ksight/sort.do?sort=me&p1="+mediatype+"&p2="+ini;
	});
	$("#btnSort_a").click(function(){
		var mediatype = "artist";
		var ini = $('input[name="afirstname"]:checked').val();
		if(ini==null){
			alert("옵션을 선택하세요.")
			return;
		}
		location.href = "${path}/SP_ksight/sort.do?sort=ar&p1="+mediatype+"&p2="+ini;
	});
	
	
});
</script>

<style type="text/css">
body {
	 font-family: 'Open Sans' ,'sans-serif';
 	 background:#f0f0f0;
}
/* 회원 로그인시 보여줄 창 */
.media {
	/*box-shadow:0px 0px 4px -2px #000;*/
	margin: 20px 0;
	padding: 30px;
}

.dp {
	border: 10px solid #eee;
	transition: all 0.2s ease-in-out;
}

.dp:hover {
	border: 2px solid #eee;
	transform: rotate(360deg);
	-ms-transform: rotate(360deg);
	-webkit-transform: rotate(360deg);
	/*-webkit-font-smoothing:antialiased;*/
}

.panel-sort {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 2px 3px 0px rgba(0, 0, 0, 0.2);
}

.panel-sort>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align: center;
}

.panel-sort>.panel-heading a {
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-sort>.panel-heading a.active {
	color: #029f5b;
	font-size: 18px;
}

.panel-sort>.panel-heading hr {
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -ms-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
	background-image: -o-linear-gradient(left, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.15), rgba(0, 0, 0, 0));
}

.panel-sort input[type="text"], .panel-sort input[type="email"],
	.panel-sort input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}

.panel-sort input:hover, .panel-sort input:focus {
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}

.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}

.btn-login:hover, .btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}

.forgot-password {
	text-decoration: underline;
	color: #888;
}

.forgot-password:hover, .forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}

.btn-register:hover, .btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}
</style>
</head>
<body>
	<%
	String ini[] = { "전체", "ㄱ", "ㄴ", "ㄷ", "ㄹ", "ㅁ", "ㅂ", "ㅅ", "ㅇ", "ㅈ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ", "기타" };
	%>


 <div class="container">
  <div class="row">
   <div class="col-md">
	<div class="panel panel-sort">
	 <div class="panel-heading">
	  <div class="row">
	   <div class="col-lg-4">
		<a href="#" class="active" id="n_div-link">지역별</a>
	   </div>
	   <div class="col-lg-4">
		<a href="#" id="m_div-link">프로그램명별</a>
	   </div>
	   <div class="col-lg-4">
		<a href="#" id="a_div-link">아티스트명별</a>
	   </div>
	  </div>
      <hr>
	 </div>
	 <div class="panel-body">
	  <div class="row">
	   <div class="col-lg-12" style="font-size: 18pt; font-family: fantasy;">
		
		<div id="n_div" style="display: block;">
		 <div class="form-group" style="text-align: center;">
		  <select name="member_address1" id="member_address1" style="width: 300px; height: 60px; margin: 20px;">
		   <option id="sido" value="">시/도 선택</option>
		  </select> 
		  <select name="member_address2" id="member_address2" style="width: 300px; height: 60px; margin: 20px;">
		   <option id="sigungu" value="">시/도를 먼저 선택하세요</option>
		  </select>
		 </div>
		 <div class="form-group">
		  <div class="row">
		   <div class="col-sm-6 col-sm-offset-3">
			<input type="button" name="btnSort_n" id="btnSort_n" tabindex="4" class="form-control btn-primary" value="지역으로 검색">
		   </div>
		  </div>
		 </div>
		 </div>

		<div id="m_div" style="display: none;">
		<input type="hidden" name="sort" value="media">
		 <div class="form-group">
		  <div class="row">
           <div class="col-sm-4" style="text-align: center;">
			<div class="form-check">
			 <input type="radio" name="mediatype" id="mediatype1" value="drama" checked>
			 <label for="mediatype1">K-DRAMA </label>
			</div>
			<div class="form-check">
			 <input type="radio" name="mediatype" id="mediatype2" value="show"> 
			 <label for="mediatype2">K-VARIETY </label>
			</div>
			<div class="form-check">
			 <input type="radio" name="mediatype" id="mediatype3" value="movie"> 
			 <label for="mediatype3">K-MOVIE </label>
			</div>
		   </div>
		   <div class="col-sm-8">
			<div>
			 <c:forEach var="i" items="<%=ini%>" varStatus="st">
			  <span> 
			   <input type="radio" name="firstname" id="mfirstname${st.index}" value="${st.index}"> 
			   <label for="firstname${st.index}">${i}</label>
		      </span>
			 </c:forEach>
			</div>
		   </div>
		  </div>
		 <div class="form-group">
		  <div class="col-sm-6 col-sm-offset-3">
		   <input type="button" id="btnSort_m" tabindex="4" class="form-control btn-primary" value="제목으로 검색">
		  </div>
		 </div>
		</div>
	   </div>

	   <div id="a_div" style="display: none;">
		<div class="form-group">
  		  <div style="text-align: center;">
		   <c:forEach var="i" items="<%=ini%>" varStatus="st">
			<span> <input type="radio" name="firstname" id="afirstname${st.index}" value="${st.index}"> 
			 <label for="firstname${st.index}">${i}</label>
			</span>
		   </c:forEach>
		  </div>
		 </div>
		 <div class="form-group">
		  <div class="col-sm-6 col-sm-offset-3">
		   <input type="button" id="btnSort_a" tabindex="4" class="form-control btn-primary" value="가수명으로 검색">
		  </div>
		 </div>
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