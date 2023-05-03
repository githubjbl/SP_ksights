<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="/myweb/semi_project/include/user-profiles-list-small.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.bundle.min.js"></script>
<title>K-SIGHT</title>
<%@ include file="/semi_project/include/headForSemi.jsp"%>
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
	function list(page) {
		var sort = "${map.sort}";
		var ini = "${map.ini}";
		var p1 = "${map.mediatype}";
		location.href = "${path}/SP_ksight/sort.do?sort=" + sort + "&p1=" + p1
				+ "&p2=" + ini + "&curPage=" + page;
	}
</script>
</head>
<body>
	<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>
	<jsp:include page="/semi_project/module/jumbotronUse.jsp"></jsp:include>
	<jsp:include page="/semi_project/module/sortUse.jsp"></jsp:include>





	<div class="container" id="n_container">

		<div id="title_div">
			
			<ul class="user-profiles-list-small" style="max-width: none;">
			<c:forEach var="list" items="${list2}">
				
				<li>
					<div class="user-avatar">
						<a href="${path}/SP_ksight/sort_t.do?tit=${list.title}"> 
							<img src="${path}/semi_project/images/search.svg" width="44" />
						</a>
					</div>

					<p class="user-name">
						<a href="${path}/SP_ksight/sort_t.do?tit=${list.title}">${list.title}</a>
						<span><b style="font-size: 1.4em;">${list.scount}</b> 개의 Sights</span>
					</p>			
				</li>
				
			</c:forEach>
			</ul>
			
		</div>

		<div style="margin-bottom: 20px;">
	<c:set var="sort" value="${map.sort}" />
			<h2>
				<c:choose>
				<c:when test="${sort eq 'me'}">
					<span class="label label-default">제목별</span>
					<span class="label label-info">${map.mediatype}</span>
					<span class="label label-success">${map.initial}</span>
					<span class="label label-warning">검색결과 : ${map.count}</span>
				</c:when>
				
				<c:when test="${sort eq 'ar'}">
					<span class="label label-default">가수명별</span>
					<span class="label label-success">${map.initial}</span>
					<span class="label label-warning">검색결과 : ${map.count}</span>
				</c:when>
				
				<c:otherwise>
					<span class="label label-default">SORT</span>
				</c:otherwise>
				</c:choose>
			</h2>
		</div>

		<div class="table-responsive">
			
			<table id="mytable" class="table table-bordered table-striped">
		<c:set var="i" value="0" />
		<c:set var="j" value="2" />
				<c:forEach var="dto" items="${list_pager}">
					<c:if test="${i%j==0}">
						<tr>
					</c:if>
							<td><img alt="220*220" src="${path}/semi_project/images/gf.png"></td>
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
	</div><!-- 페이징 -->
	
 	</div>    
 	        
</div>
</body>
</html>