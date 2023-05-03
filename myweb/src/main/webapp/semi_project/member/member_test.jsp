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
$(document).ready(function() {
    var panels = $('.user-infos');
    var panelsButton = $('.dropdown-user');
    panels.hide();

    //Click dropdown
    panelsButton.click(function() {
        //get data-for attribute
        var dataFor = $(this).attr('data-for');
        var idFor = $(dataFor);

        //current button
        var currentButton = $(this);
        idFor.slideToggle(400, function() {
            //Completed slidetoggle
            if(idFor.is(':visible'))
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
            }
            else
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
            }
        })
    });


    $('[data-toggle="tooltip"]').tooltip();

    $('button').click(function(e) {
        e.preventDefault();
        alert("This is a demo.\n :-)");
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
        <img alt="User Pic" src="http://babyinfoforyou.com/wp-content/uploads/2014/10/avatar-300x300.png" class="img-circle img-responsive"> 
       </div>
       <div class=" col-md-9 col-lg-9 "> 
        <table class="table table-user-information">
         <tbody>
          <tr>
           <td>이름 :</td>
           <td><input type="email" class="form-control" id="colFormLabel" placeholder="col-form-label"></td>
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
           <td><fmt:formatDate value="${dto.birthday}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
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
        <a href="#" class="btn btn-primary">업로드한 댓글보기</a>
        <a href="#" class="btn btn-primary">업로드한 사진보기</a>
       </div>
      </div>
     </div>
     <div class="panel-footer">
      <a data-original-title="회원목록으로" data-toggle="tooltip" type="button" class="btn btn-sm btn-info"><i class="glyphicon glyphicon-list-alt warning"></i></a>
      <span class="pull-right">
       <a href="#" data-original-title="회원정보수정" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
       <a data-original-title="회원삭제하기" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
      </span>
     </div>
    </div>
   </div>
  </div>
 </div>
</body>
</html>