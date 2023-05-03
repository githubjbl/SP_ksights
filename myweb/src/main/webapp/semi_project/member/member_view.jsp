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
$(document).ready(function() {
	$("#btnList").click(function(){
		location.href = "${path}/semi_project/member/member_index.jsp";
	});
	$("#btnToupdate").click(function(){
		document.updateteform.action = "${path}/SP_ksight_member/toupdate.do";
		document.updateteform.submit();
	});
	$("#btnDelete").click(function(){
		document.updateteform.action = "${path}/SP_ksight_member/delete.do";
		document.updateteform.submit();
	});
});
</script>

</head>
<body>
<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>
    
 <div class="container">
  <div class="row">
   <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
    <div class="panel panel-info">
     <div class="panel-heading">
      <h3 class="panel-title">아이디명 : ${dto.id}</h3>
     </div>
     <div class="panel-body">
      <div class="row">
       <div class="col-md-3 col-lg-3 " align="center"> 
        <img alt="User Pic" src="/myweb/semi_project/images/person-square.svg" class="img-circle img-responsive" width="300px" height="300px"> 
       </div>
       <div class=" col-md-9 col-lg-9 "> 
        <table class="table table-user-information">
         <tbody>
          <tr>
           <td>이름 :</td>
           <td>${dto.member_name}</td>
          </tr>
          <tr>
           <td>성별 : </td>
           <td>${dto.gender}</td>
          </tr>
          <tr>
           <td>전화번호 :</td>
           <td>${dto.phone}</td>
          </tr>
          <tr>
           <td>가입 일자 :</td>
           <td><fmt:formatDate value="${dto.join_date}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
          </tr>
          <tr>
           <td>생년월일 :</td>
           <td><fmt:formatDate value="${dto.birthday}" pattern="yyyy-MM-dd"/></td>
          </tr>
          <tr>
           <td>이메일 :</td>
           <td>${dto.email}</td>
          </tr>
          <tr>
           <td>주소 :</td>
           <td>${dto.member_address1} / ${dto.member_address2}</td>
          </tr>
          <tr>
           <td>회원등급 : </td>
           <td>${dto.member_level}</td>
          </tr>
          <tr>
           <td>선호 : </td>
           <td>${dto.mediatype}</td>
          </tr>
         </tbody>
        </table>
       </div>
      </div>
      <form name="updateteform" method="post">
       <input type="hidden" value="${dto.email}" name="email">
      </form>
     </div>
     <div class="panel-footer">
      <a data-original-title="회원목록으로" data-toggle="tooltip" type="button" class="btn btn-sm btn-info" id="btnList"><i class="glyphicon glyphicon-list-alt warning"></i></a>
      <span class="pull-right">
       <a href="#" data-original-title="회원정보수정" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning" id="btnToupdate"><i class="glyphicon glyphicon-edit"></i></a>
       <a data-original-title="회원삭제하기" data-toggle="modal" data-target="#delete" type="button" class="btn btn-sm btn-danger" id="btnModal"><i class="glyphicon glyphicon-remove"></i></a>
      </span>
     </div>
    </div>
   </div>
  </div>
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
</body>
</html>