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
<style type="text/css">
/* 맨위 회원관리목록으로 쓸것. */
.panel-table .panel-body{
  padding:0;
}

.panel-table .panel-body .table-bordered{
  border-style: none;
  margin:0;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
    text-align:center;
    width: 120px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
  border-right: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
.panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
  border-left: 0px;
}

.panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
  border-bottom: 0px;
}

.panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
  border-top: 0px;
}

.panel-table .panel-footer .pagination{
  margin:0; 
}

/*
used to vertically center elements, may need modification if you're not using default sizes.
*/
.panel-table .panel-footer .col{
 line-height: 34px;
 height: 34px;
}

.panel-table .panel-heading .col h3{
 line-height: 30px;
 height: 30px;
}

.panel-table .panel-body .table-bordered > tbody > tr > td{
  line-height: 34px;
}

</style>
<script type="text/javascript">
$(function(){
	$("#btnRegister").click(function(){
		location.href = "${path}/semi_project/member/member_register.jsp"
	});
});

function view(email){
	document.memberform.email.value = email;
	document.memberform.submit();
}

function deletem(email){
	if(confirm("정말 삭제하시겠습니까?")){
		document.deleteform.email.value = email;
		document.deleteform.submit(email);
	}
	
}

function list(page){
	location.href = "${path}/SP_ksight_member/list.do?curPage="+page;
}
</script>
</head>
<body>
<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>
<div class="container">
    <div class="row">
    
   
    
    
    
        <div class="col-md-10 col-md-offset-1">

            <div class="panel panel-default panel-table">
              <div class="panel-heading">
                <div class="row">
                  <div class="col col-xs-6">
                    <h3 class="panel-title">회원관리</h3>
                  </div>
                  <div class="col col-xs-6 text-right">
                    <button type="button" class="btn btn-sm btn-primary btn-create" id="btnRegister">신규 등록</button>
                  </div>
                </div>
              </div>
              <div class="panel-body">
                <table class="table table-striped table-bordered table-list">
                  <thead>
                    <tr>
                        <th><img src="${path}/semi_project/images/gear.svg"> </th>
                        <th class="hidden-xs">등급</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>선호</th>
                        <th>가입일</th>
                    </tr> 
                  </thead>
                  <tbody>
                  <c:forEach var="dto" items="${list}" >
                          <tr>
                          <td align="center">
                          <c:if test="${sessionScope.member_level > dto.member_level}">
                          
                              <a class="btn btn-default" href="#" onclick="view('${dto.email}')"  ><img src="${path}/semi_project/images/info-circle.svg"></a>
                              <a class="btn btn-danger" href="#" onclick="deletem('${dto.email}')"><img src="${path}/semi_project/images/trash3-fill.svg"></a>
                            
                          </c:if>
                          </td>
                            <td class="hidden-xs">${dto.member_level}</td>
                            <td>${dto.id}</td>
                            <td>${dto.email}</td>
                            <td>${dto.mediatype}</td>
                            <td><fmt:formatDate value="${dto.join_date}" pattern="yyyy-MM-dd hh-mm" /></td>
                          </tr>
                          </c:forEach>
                        </tbody>
                </table>
                <!-- 데이터 넘겨주는 용도의 form -->
                 <form name="memberform" method="post" action="${path}/SP_ksight_member/view.do">
  					<input type="hidden" name="email" value="${dto.email}">
  					<input type="hidden" name="member_level" value="${dto.member_level}">
 				 </form>
 				 <form name="deleteform" method="post" action="${path}/SP_ksight_member/delete.do">
  					<input type="hidden" name="email" value="${dto.email}">
 				 </form>
            
              </div>
              <div class="panel-footer">
              
              
              
              
              <!-- 하단 페이징버튼 -->
  	<div style="text-align: center;">
   		<ul class="pagination pagination-lg">
    	<c:if test="${page.curPage > 1}">
     		<li class="page-item">
      			<a class="page-link" href="#" onclick="list('1')">&laquo;</a>
     		</li>
    	</c:if>
    	<c:if test="${page.curBlock > 1}">
     		<li class="page-item active">
      			<a class="page-link" href="#" onclick="list('${page.prevPage}')">&lt;</a>
     		</li>
    	</c:if>
    <c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
     	<c:choose>
      	<c:when test="${num == page.curPage}">
       		<li class="page-item">
        		<span class="page-link" style="color: red">${num}</span>
       		</li>
      	</c:when>
      	<c:otherwise>
       		<li class="page-item">
        		<a class="page-link" href="#" onclick="list('${num}')">${num}</a>
       		</li>
      	</c:otherwise>
     	</c:choose>
	</c:forEach>
    	<c:if test="${page.curBlock < page.totBlock}">
     		<li class="page-item">
      			<a class="page-link" href="#" onclick="list('${page.nextPage}')">&gt;</a>
     		</li>
    	</c:if>
    	<c:if test="${page.curPage < page.totPage}">
     		<li class="page-item">
      			<a class="page-link" href="#" onclick="list('${page.totPage}')">&raquo;</a>
     		</li>
    	</c:if>
   		</ul>
	</div>
              
              </div>
            </div>
        </div>
  	</div>
</div>

</body>
</html>