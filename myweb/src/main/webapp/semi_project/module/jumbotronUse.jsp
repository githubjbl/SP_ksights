<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Nboard_index By bootstarp</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<style type="text/css">
body {
	 font-family: 'Open Sans' ,'sans-serif';
 	 background:#f0f0f0;
}
.jumbotron {
	padding: 20px, 0px;
	margin-bottom: 20px;
}
.item {
	border: 1px solid black; 
	background-size : cover; 
	background-position: center; 
	height: 300px; 
	width: 100%;  
	background-repeat : no-repeat;"
}
.item .container {
	position: relative; 
	margin-top: 100px;
}
.item .container .jumbo_h1 {
	color: white;
	text-shadow: #FC0 6px 0 10px;
	cursor: default;
}
</style>
<script type="text/javascript">
$(function(){
	$("#jumbo_lotte").click(function(){
		location.href= "${path}/SP_ksight/profile.do?sightname=롯데월드";
	});
});

</script>
</head>
<body>

<!-- 점보트론 -->

<div class="jumbotron">

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
  
  <div class="item active" style="background-image: url('/myweb/semi_project/images/lotteworld.jpg');" id="jumbo_lotte">
    <div class="container text-center">
     <h1 class="jumbo_h1">#롯데월드</h1>      
    </div>
   </div>
   
   <div class="item" style="background-image: url('/myweb/semi_project/images/k-pop.jpg');">
    <div class="container text-center">
     <h1 class="jumbo_h1">K-POP</h1>      
    </div>
   </div>
    
    <div class="item" style="background-image: url('/myweb/semi_project/images/k-drama.jpg');">
     <div class="container text-center">
     <h1 class="jumbo_h1">K-DRAMA</h1>      
     </div>
    </div>
    
    <div class="item" style="background-image: url('/myweb/semi_project/images/k-movie.jpg');">
     <div class="container text-center">
     <h1 class="jumbo_h1">K-MOVIE</h1>      
     </div>
    </div>
    
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</div>
</body>
</html>