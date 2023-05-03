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
<style type="text/css">
#listOl {
	 list-style: none; 
	 margin: 20px auto; 
	 height: 220px;
}
#listOl li {
	font-size: 14pt; 
	height: 40px;
}
</style>
<script type="text/javascript">
function list(page){
	var p1 = "${map.member_address1}";
	var p2 = "${map.member_address2}";
	location.href = "${path}/SP_ksight/sort.do?sort=na&p1="+p1+"&p2="+p2+"&curPage="+page;
}
</script>
</head>
<body>
<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>
<jsp:include page="/semi_project/module/jumbotronUse.jsp"></jsp:include>
<jsp:include page="/semi_project/module/sortUse.jsp"></jsp:include>


<!-- 공지사항리스트 -->
<div class="container" id="n_container">
 <div style="margin-bottom: 20px;">
 <c:set var="sort" value="${map.sort}"/>
 <h2>
    <span class="label label-default">지역별</span>
    <span class="label label-info">${map.member_address1}</span>
    <span class="label label-success">${map.member_address2}</span>
    <span class="label label-warning">검색결과 : ${map.count}</span>
  </h2>
</div>

 <div class="table-responsive" >
  <table id="mytable" class="table table-bordered table-striped">
    <c:set var="i" value="0" />
    <c:set var="j" value="2" />
    <c:forEach var="dto" items="${list_pager}" >
     <c:if test="${i%j==0}">
      <tr>
     </c:if>
       <td><img alt="220*220" src="${path}/semi_project/images/gf.png"> </td>
       <td>
        <ol id="listOl">  
         <li>
          <b>${dto.sortnum}.</b><a href="${path}/SP_ksight/profile.do?sightname=${dto.sightname}">${dto.sightname}</a>
         </li>
         <li>촬영지로 <b>(${dto.scount})</b> 회</li>
         <li>${dto.sighttype}</li>
         <li style="font-size: 12pt; margin-bottom: 15px;">${dto.address}</li>
         <li>댓글 <b>(${dto.tcount})</b> 개</li>
        </ol>
       </td>
     <c:if test="${i%j==j-1}">
      </tr>
     </c:if>
     <c:set var="i" value="${i+1}" />
    </c:forEach>
  </table>
    
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

</body>
</html>