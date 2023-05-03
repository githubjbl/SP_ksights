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
	$("#btnWrite").click(function(){
		location.href = "${path}/semi_project/nboard/nboard_write.jsp";
	});
	$("#btnSearch").click(function(){
		search_keyword();
	});
	$("#keyword").keydown(function(key){
		if(key.keyCode == 13){
			search_keyword();
		}
	});
	$("#btnList").click(function(){
		var subject = $("#n_select").val();
		location.href = "${path}/semi_project/nboard/nboard_index.jsp";
	});
		
	$("#btnDelete_notice").click(function(){
		$("#deleteform").submit();
	});
	
});
function search_keyword(){
	var keyword = $("#keyword").val();
	var subject = $("#n_select").val();
	if(keyword != ""){
		location.href = "${path}/SP_ksight_nboard/list.do?subject="+subject+"&keyword="+keyword;
	}
}
function list(page){
	var keyword = $("#keyword").val();
	var subject = $("#n_select").val();
	if(subject == "none"){
		location.href = "${path}/SP_ksight_nboard/list.do?curPage="+page;
	}else{
		if(keyword == ""){
			location.href = "${path}/SP_ksight_nboard/list.do?curPage="+page+"&subject="+subject;
		}else{
			location.href = "${path}/SP_ksight_nboard/list.do?curPage="+page+"&subject="+subject+"&keyword="+keyword;
		}
	}
	
}
</script>
</head>
<body>

<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>

<!-- 공지사항리스트 -->
<div class="container" id="n_container">
 <div>
  <h3 id="ntitle">K-Notice</h3>
 </div>
<!-- 공지사항리스트 상단 input과 검색,목록,쓰기버튼 -->
 <div class="pagination pull-left">

  <select id="n_select" name="subject">
   <c:choose>
    <c:when test="${subject =='none'}">
     <option value="none" selected>선택</option>
     <option value="notice">공지사항</option>
     <option value="event">이벤트</option>
    </c:when>
    <c:when test="${subject =='notice'}">
     <option value="none">선택</option>
     <option value="notice" selected>공지사항</option>
     <option value="event">이벤트</option>
    </c:when>
    <c:when test="${subject =='event'}">
     <option value="none">선택</option>
     <option value="notice">공지사항</option>
     <option value="event" selected>이벤트</option>
    </c:when>
   </c:choose>
  </select>
  <input name="keyword" id="keyword" value="${keyword}">

 </div>
 <ul class="pagination">
  <li><a href="#" id="btnSearch">검색</a></li>
  <li><a href="#" id="btnList">목록</a></li>
 </ul>
 
 <c:if test="${sessionScope.member_level > 1}">
  <ul class="pagination pull-right">
   <li><a href="#" id="btnWrite">작성</a></li>
  </ul>
 </c:if>
 <hr>

 <div class="table-responsive" >
  <table id="mytable" class="table table-bordred table-striped">
    <colgroup>
     <col width="8%" />
     <col width="8%" />
     <col width="60%" />
     <col width="8%" />
     <col width="12%" />
     </colgroup>  
   <thead>  
    <tr>          
    <th>번호</th> 
    <th></th>  
    <th>제목</th>              
    <th>조회수</th>
    <th>날짜</th>
    <tr>
   </thead>
   <tbody>
    <c:forEach var="dto" items="${list}" >
     <tr>
      <td>${dto.num}</td>
      <td>
       <c:choose>
        <c:when test="${dto.subject == 'notice'}">
         <i class="glyphicon glyphicon-bullhorn" style="background-color: aqua; font-size: 16pt;"></i>
        </c:when> 
        <c:otherwise>
         <i class="glyphicon glyphicon-bell" style="background-color: yellow; font-size: 16pt;"></i>
        </c:otherwise>     
       </c:choose>
      </td>
      <td>
       <a href="${path}/SP_ksight_nboard/view.do?num=${dto.num}" id="viewlink">${dto.title}</a>
      </td>
      <td>${dto.readcount}</td>
      <td>${dto.write_date}</td>
     </tr>
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


</body>
</html>