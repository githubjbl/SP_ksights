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
<title>K-SIGHT</title>
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
	var title = "${map.title}";
	location.href = "${path}/SP_ksight/sort_t.do?tit="+title+"&curPage="+page;
}
</script>
</head>
<body>
<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>
<jsp:include page="/semi_project/module/jumbotronUse.jsp"></jsp:include>
<jsp:include page="/semi_project/module/sortUse.jsp"></jsp:include>

<div>
<c:forEach var="title" items="${list2}" >
 <a href="${path}/SP_ksight/sort_t.do?tit=${title.title}">${title.title}(${title.scount})</a>
</c:forEach>
</div>



<!-- 공지사항리스트 -->
<div class="container" id="n_container">
 	<div style="margin-bottom: 20px;">
 		<h2>
    		<span class="label label-default">${map.title}</span>
    		<span class="label label-info">총 ${map.count} 개의 결과</span>
  		</h2>
	</div>

 	<div class="table-responsive" >
  		<table id="mytable" class="table table-bordered table-striped">
    <c:set var="i" value="0" />
    <c:set var="j" value="2" />
    	<c:forEach var="dto" items="${list}" >
     	<c:if test="${i%j==0}">
      		<tr>
     	</c:if>
       			<td>
       		<c:choose>
       			<c:when test="${dto.photo_url != null}">
       				<img alt="220*220" src="${path}/semi_project/images/ksights/${dto.photo_url}" width="220px" height="220px">
       			</c:when>
       			<c:otherwise>
       				<img alt="220*220" src="${path}/semi_project/images/ksights/empty^.jpg" width="220px" height="220px">
       			</c:otherwise>		
       		</c:choose>
       			</td>
       			
       			<td>
        			<ol style="list-style: none; margin: 20px auto;">  
         				<li><a href="${path}/SP_ksight/profile.do?sightname=${dto.sightname}">${dto.sightname}</a>(${dto.scount})</li>
         				<li>${dto.sighttype}</li>
         				<li>${dto.address}</li>
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