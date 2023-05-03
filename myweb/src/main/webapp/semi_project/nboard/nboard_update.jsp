<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css" href="/myweb/semi_project/include/css.css">

<title>K-SIGHT</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnUpdate").click(function(){
		document.updateform.action = "${path}/SP_ksight_nboard/update.do";
		document.updateform.submit();
	});
$("#content").onload = function(){
	var content = $("#content").val();
	content = content.replaceAll(/<br\/>/ig, "\n");
	content = content.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
	$("#content").val(content);
}
});


</script>
</head>
<body>
<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>


<div class="container" id="n_container">
 <div class="row">
  <div class="col-md-12">
   <h3 id="ntitle">수정하기</h3>
    <ul class="pagination pull-right">
     <li><a href="#" id="btnUpdate">수정</a></li>
    </ul>
    <hr>
  </div> 
  <div class="row">
  <form method="post" name="updateform">
   <div class="col-md-10" id="n_update_input_box">
    <div class="row">
     <div class="col-md-2" id="n_update_select_box">
      <select name="subject">
       <option value="notice" selected>공지사항</option>
       <option value="event">이벤트</option>
      </select>
     </div>
     <div class="col-md-10" id="n_update_title_box">
      <input type="text" name="title" value="${dto.title}" maxlength="500">
     </div>
    </div>
    <div class="row">
     <div class="col-md-12" id="n_update_content_box">
      <textarea name="content" id="content" rows="20">${dto.content}</textarea>
     </div>
    </div>
    <input type="hidden" id="submit_num" name="num" value="${dto.num}">
    </div>
    </form>
   </div>
  
 </div>
 <br><br><br><br><br>
</div>

</body>
</html>