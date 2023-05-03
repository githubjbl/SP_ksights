<!-- nboard에서 사용한 게시판 리스트 -->
<!-- 프론트 -->


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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Nboard_index By bootstarp</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
</head>
<body>

<!-- navbar -->
<nav class="navbar navbar-inverse">
 <div class="container-fluid">
  <div class="navbar-header">
   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>
    <span class="icon-bar"></span>                        
   </button>
   <a class="navbar-brand" href="#">K-Sights</a>
  </div>
  <div class="collapse navbar-collapse" id="myNavbar">
   <ul class="nav navbar-nav">
    <li class="active"><a href="/myweb/semi_project/index.jsp">메인페이지로</a></li>
    <li><a href="/myweb/semi_project/nboard/nboard_index.jsp">K-공지사항</a></li>
    <li><a href="#">K-사이트 소개</a></li>
    <li><a href="#">K-사이트 제보</a></li>
   </ul>
   <ul class="nav navbar-nav navbar-right">
    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> K-로그인</a></li>
   </ul>
  </div>
 </div>
</nav>

<!-- 점보트론 -->
<div class="jumbotron">
  <div class="container text-center">
    <h1>공지사항</h1>      
    <p>Some text that represents "Me"...</p>
  </div>
</div>



<!-- 공지사항리스트 -->
<div class="container">

<!-- 공지사항리스트 상단 input과 검색,목록,쓰기버튼 -->
    <div class="clearfix"></div>
     <div class="pagination pull-left">
      <select style="height: 32px; margin-top: 1px; border-color: rgba(0,0,0,0.1); color: #4487cb;" name="search_option">
       <option value="title">제목</option>
      </select>
      <input style="height: 32px; margin-top: 1px; border-color: rgba(0,0,0,0.1);" name="keyword" id="keyword" value="${keyword}">
     </div>
     <ul class="pagination">
      <li><a href="#" id="btnSearch">검색</a></li>
      <li><a href="#" id="btnList">목록</a></li>
     </ul>
     <ul class="pagination pull-right">
      <li><a href="#" id="btnWrite">작성</a></li>
     </ul>
     
     
 <div class="row">
  <div class="col-md-12">
   <div class="table-responsive">
    <table id="mytable" class="table table-bordred table-striped">
     <thead>              
      <th>번호</th>             
      <th>작성자</th>            
      <th>제목</th>              
      <th>날짜</th>
      <th>조회수</th>
      <th>삭제</th>
     </thead>
     <tbody>
      <c:forEach var="dto" items="${list}">
       <c:choose>
        <c:when test="${dto.show == 'y'}">
         <tr>
          <td>${dto.num}</td>
          <td>${dto.writer}</td>
          <td>
           <c:forEach var="i" begin="1" end="${dto.reply_grade}">&nbsp;&nbsp;</c:forEach>
           <a href="${path}/board_servlet/view.do?num=${dto.num}" id="viewlink">${dto.title}</a>
           <!-- 댓글갯수 표시 -->
           <c:if test="${dto.comment_count > 0}">
            <span style="color: red;">(${dto.comment_count})</span>
           </c:if>
          </td>
          <td>${dto.write_datetime}</td>
          <td>${dto.readcount}</td>
          <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
         </tr>
        </c:when>
        <c:otherwise>
         <tr>
          <td>${dto.num}</td>
          <td colspan="5" align="center">삭제된 게시물입니다.</td>
         </tr>
        </c:otherwise>
       </c:choose>
      </c:forEach>
     </tbody>
    </table>
    
    <!-- 공지사항리스트 하단 페이징버튼 -->
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
    <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign" id="btnDelete"></span> Yes</button>
    <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
   </div>
  </div>
 </div>
</div>

<!-- modal의 삭제기능을 위한 데이터 전달용 form -->
<form name="deleteform" method="post">
  <input type="hidden" name="num" value="${dto.num}">
</form>

</body>
</html>