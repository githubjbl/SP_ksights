<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>K-SIGHT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <%@ include file="/semi_project/include/headForSemi.jsp" %>
  <link rel="stylesheet" type="text/css" href="/myweb/semi_project/include/css.css">
<style type="text/css">

</style>
</head>
<body>
<!-- navbar & jumbotron -->
<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>
<jsp:include page="/semi_project/module/jumbotronUse.jsp"></jsp:include>

<div class="container">
 
 <div class="container-fluid row g-5" style="margin:20px 0;"> 
  <h2 style="padding-bottom:10px; margin-bottom:0; border-bottom: 2px double maroon;">#${map.title1} </h2>
  <c:forEach var="list" items="${list1}" begin="0" end="2">
   <div class="col-sm-4" >
    <h3>${list.photo_sight}</h3>
    <a href="${path}/SP_ksight/profile.do?sightname=${list.photo_sight}">
     <img src="/myweb/semi_project/images/ksights/${list.photo_url}" class="img-responsive" style="width: 100%; height: 200px;">
    </a>
   </div>
   </c:forEach>
  </div>
 
 
 <div class="container-fluid row g-5" style="margin:20px 0;"> 
  <h2 style="padding-bottom:10px; margin-bottom:0; border-bottom: 2px double maroon;">#${map.title2} </h2>
  <c:forEach var="list" items="${list2}" begin="0" end="2">
   <div class="col-sm-4" >
    <h3>${list.photo_sight}</h3>
    <a href="${path}/SP_ksight/profile.do?sightname=${list.photo_sight}">
     <img src="/myweb/semi_project/images/ksights/${list.photo_url}" class="img-responsive" style="width: 100%; height: 200px;">
    </a>
   </div>
   </c:forEach>
  </div>
  
  <div class="container-fluid row g-5" style="margin:20px 0;"> 
  <h2 style="padding-bottom:10px; margin-bottom:0; border-bottom: 2px double maroon;">#${map.title3} </h2>
  <c:forEach var="list" items="${list3}" begin="0" end="2">
   <div class="col-sm-4" >
    <h3>${list.photo_sight}</h3>
    <a href="${path}/SP_ksight/profile.do?sightname=${list.photo_sight}">
     <img src="/myweb/semi_project/images/ksights/${list.photo_url}" class="img-responsive" style="width: 100%; height: 200px;">
    </a>
   </div>
   </c:forEach>
  </div>
 
 
</div>
<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>


