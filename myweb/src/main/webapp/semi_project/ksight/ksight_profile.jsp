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
<link rel="stylesheet" type="text/css" href="/myweb/semi_project/include/user-profiles-list-small.css">
<title>K-SIGHT</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<style type="text/css">
.imgcarousel {
	margin: auto;
	object-fit: contain;
	position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
#profile_h1 {
	font-size: 40pt;
}
#title_div {
	margin-top: 20px;
}
#profile_table {
	 width: 100%;
}
#profile_table td {
	font-size: 14pt;
	height: 40px;
}
#profile_table img {
	width: 100%;
}

</style>
<script type="text/javascript">
$(function(){
	/* 사진등록버튼 */
	$("#btnCheck").click(function(){
		checkname();
		<%if(session == null || session.getAttribute("email") == null || session.getAttribute("email").equals("")){%>
			alert("로그인후 이용가능합니다.");
		<%}else{%>
			document.photoupload.submit();
		<%}%>
	});
	
	/* 전체사진보기 */
	$("#gallery").click(function(){
		var photocnt = $("#photocnt").text();
		var sightname = $("#sn").val();
		if(photocnt == 0 || photocnt == null){
			alert("등록된 이미지가 없습니다.");
		}else{
			 window.open("${path}/SP_ksight_photo/gallery.do?sn="+sightname);
		}
	});
});


function readURL(input) {
	 if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  	} else {
	    document.getElementById('preview').src = "";
	}
}
function checkname(){
	var filevalue = $("#photoUL").val().split("\\");
	var filename = filevalue[filevalue.length-1];
	var checkname = /^[a-zA-Z0-9.]{2,}$/;
	if(!checkname.test(filename)){
		alert("한글,특수문자는 파일명으로 사용할수 없습니다.");
		return;
	}
}


</script>
</head>
<body>
<jsp:include page="/semi_project/module/navbarUse.jsp"></jsp:include>

<!-- Content page -->
<div class="container">
  	<div class="row">
   		<div class="col-md-8 col-lg-9 p-b-80">
   
   		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  		
  		<!-- Indicators -->
  			<ol class="carousel-indicators">
    			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    		<c:forEach var="i" items="${plist}" begin="1" end="9" varStatus="status">
    			<li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>
    		</c:forEach>
  			</ol>

  		<!-- Wrapper for slides -->
  			<div class="carousel-inner" role="listbox">
    			<div class="item active" style="height: 500px; text-align: center;">
      				<img src="${path}/semi_project/images/ksights/${pdto.photo_url}" class="imgcarousel">
    			</div>
    		<c:forEach var="photo" items="${plist}" begin="1" end="9"> 
    			<div class="item" style="height: 500px; text-align: center;">
      				<img src="${path}/semi_project/images/ksights/${photo.photo_url}" class="imgcarousel">
    			</div>
    		</c:forEach>
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
   
   
     	<div>
       
        <span>By ${pdto.email}</span>   <!-- 작성자 이메일 -->

      	<h1 id="profile_h1">${sightname}</h1>   <!-- 제목 -->
       
      
	<!-- ksight 들어갈것 -->
	 	<div id="title_div">
	 		<ul class="user-profiles-list-small">
		<c:forEach var="list" items="${list}">
        		<li>

            		<div class="user-avatar">
                		<a data-toggle="modal" data-target="#modal${list.num}">
                    		<img src="${path}/semi_project/images/list.svg" width="44"/>
                		</a>
            		</div>

            		<p class="user-name">
                		<a href="${path}/SP_ksight/sort_t.do?tit=${list.title}">${list.title}</a>
                		<span>${list.mediatype}</span>
            		</p>

        		</li>
		</c:forEach>
    		</ul>
	 	</div>
	 
	 
	 <!-- Modal -->
	<c:forEach var="list" items="${list}">
		<div class="modal fade" id="modal${list.num}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  			<div class="modal-dialog" role="document">
    			<div class="modal-content">
      				<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        				<h2 class="modal-title" id="myModalLabel">${sightname} @ ${list.title}</h2>
      				</div>
      				<div class="modal-body">
        				<table id="profile_table">
        					<tr>
         						<td colspan="2">
         							<img src="${path}/semi_project/images/ksights/${pdto.photo_url}">
         						</td>
        					</tr>
        
       						<tr>
        						<td style="width:20%;">WHEN : </td>
        						<td>${list.explain}</td>
       						</tr>
        
        					<tr>
        						<td>TYPE : </td>
        						<td>${list.sighttype}</td>
       						</tr>
        
        					<tr>
        						<td>ADDRESS : </td>
        						<td>${list.address}</td>
       						</tr>
     
       						<tr>
        						<td>OPEN : </td>
        						<td>${list.opentime}</td>
       						</tr>
       						
       						<tr>
        						<td>BREAK : </td>
        						<td>${list.breaktime}</td>
       						</tr>
       						
       						<tr>
        						<td>CLOSE : </td>
        						<td>${list.holiday}</td>
       						</tr>
       						
       						<tr>
        						<td>PHONE : </td>
        						<td>${list.tel}</td>
       						</tr>
      					
      					</table>
      				</div>
      
      				<div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      				</div>
   				
   				</div>
  			</div>
		</div>
		</c:forEach>
		
		</div>


<jsp:include page="/semi_project/module/reviewUse.jsp">
	<jsp:param name="rsightname" value="${sightname}" />
</jsp:include>
  
		</div>
   	
   		<div class="col-md-4 col-lg-3 p-b-80">
    		
    		<div class="side-menu">

				<div class="p-t-65">
	   				<h4 class="mtext-112 cl2 p-b-33">
						총 (<strong id="photocnt">${pcount}</strong>) 개의 사진이 있습니다.
	   				</h4><br>

	   				<ul style="list-style: none;">
						<li style="margin-bottom: 10px">
		 					<div>전체사진 보기</div><br>
		 					<a href="#" id="gallery">
		  						<img src="${path}/semi_project/images/ksights/viewall.png" width="150px" height="150px">
		 					</a>
	    				</li>
	    				
	    				<li>
		 					<form name="photoupload" method="post" action="${path}/SP_ksight_photo/upload.do" enctype="multipart/form-data">
		 						<label for="photoUL">사진올리기</label>
 								<img src="${path}/semi_project/images/camera2.svg" onerror="this.src='${path}/semi_project/images/camera2.svg'" 
 									id="preview" width="150px" height="150px">
 								<input type="file" name="photoUL" id="photoUL" onchange="readURL(this);">
 								<input type="hidden" name="sightname" id="sn" value="${sightname}">
 								<input type="button" id="btnCheck" value="사진 등록">
							</form>
	   		 			</li>
		
	   				</ul>
	  			</div><br>


				<div class="p-t-55">
	  
 					<h4 class="mtext-112 cl2 p-b-33">Categories</h4>
  
  					<ul>
   						<li class="bor18">
							<a role="button" data-toggle="collapse" href="#collapsenearby" aria-expanded="false" aria-controls="collapsenearby">
      							주변 SIGHTS
    						</a>	 
      							
      						<div class="collapse well" id="collapsenearby">
    
						<c:forEach var="nearby" items="${list2}">
     							<div>
      								<a href="${path}/SP_ksight/profile.do?sightname=${nearby.sightname}">${nearby.sightname}</a>
     							</div> 
    					</c:forEach> 

    						</div>
   						</li>

   						<li class="bor18">
							<a role="button" data-toggle="collapse" href="#collapsetitle" aria-expanded="false" aria-controls="collapsetitle">
      							촬영 주체
    						</a>	 
   
    						<div class="collapse well" id="collapsetitle">
     
    					<c:forEach var="title" items="${list3}">
     							<div>
     								<a href="${path}/SP_ksight/sort_t.do?tit=${title.title}">${title.title}</a>
     							</div> 
    					</c:forEach> 

    						</div>
   						</li>

	   				</ul>
	  			</div>
      
			</div>
		</div>
   	</div>
</div>
	


</body>
</html>