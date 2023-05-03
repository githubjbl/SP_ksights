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
<title>Nboard_index By bootstarp</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<script type="text/javascript">

$(function(){
	$("#btnList").click(function(){
		location.href = "${path}/semi_project/nboard/nboard_index.jsp";
	});
	$("#btnToupdate").click(function(){
		document.updateteform.action = "${path}/SP_ksight_nboard/toupdate.do";
		document.updateteform.submit();
	});
	$("#btnDelete").click(function(){
		document.updateteform.action = "${path}/SP_ksight_nboard/delete.do";
		document.updateteform.submit();
	});
});
</script>
</head>
<body>
<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>


<div class="container" id="n_container">
 <div class="row">
  <div class="col-md-12">
   <h3 id="ntitle">공지사항</h3>
   <ul class="pagination pull-right">
    <li><a href="#" id="btnList">목록</a></li>
   </ul>
  </div>
  <hr>
 </div>
 <div class="row">
  <div class="col-md-1">
   <c:choose>
    <c:when test="${dto.subject == 'notice'}">
     <img alt="image_N/E" src="${path}/semi_project/images/notice.png">
    </c:when>
    <c:otherwise>
     <img alt="image_N/E" src="${path}/semi_project/images/event.png">
    </c:otherwise>
  </c:choose>
  </div>
  <div class="col-md-9">
   <h2>${dto.title}</h2>
  </div>
  
 <c:if test="${sessionScope.member_level > 1}">
  <div class="col-md-2">
   <ul class="pagination pull-right" id="n_view_ul">
    <li><a href="#" id="btnToupdate">수정</a></li>
    <li><a id="btnModal" data-title="Delete" data-toggle="modal" data-target="#delete">삭제</a></li>
   </ul>
  </div>
 </c:if>
 
 
  <hr>
 </div>
 <div class="row" >
  <div class="col-md-8"><!-- 빈공간 --></div>
  <div class="col-md-2" id="n_view_count_box">
   <img alt="조회수" src="${path}/semi_project/images/eyes.svg"><strong>${dto.readcount}</strong>
  </div>
  <div class="col-md-2" style="opacity: 0.5;">
   <img alt="날짜" src="${path}/semi_project/images/clock.svg"><strong>${dto.write_date}</strong>
  </div>
  <hr>
 </div>
 <div class="row">
  <div class="col-md-10" id="n_view_content_box">
   <textarea rows="20" readonly>${dto.content}</textarea>
  </div>
 </div>
 <br><br><br><br><br>
</div>

<!-- 삭제버튼 modal(팝업) -->
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
 <div class="modal-dialog">
  <div class="modal-content">
   <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
    <h4 class="modal-title custom_align" id="Heading">글 삭제</h4>
   </div>
   <div class="modal-body">
    <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> 해당 글을 삭제하시겠습니까?</div>
   </div>
   <div class="modal-footer ">
    <button type="button" class="btn btn-success" id="btnDelete"><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
   </div>
  </div>
 </div>
</div>



<form name="updateteform" id="updateteform" method="post">
 <input type="hidden" id="submit_num" name="num" value="${dto.num}">
 <input type="hidden" id="submit_title" name="title" value="${dto.title}">
 <input type="hidden" id="submit_content" name="content" value="${dto.content}">
</form>

</body>
</html>