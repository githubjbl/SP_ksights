<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<%@ include file="/semi_project/include/headForSemi.jsp" %>
    
    <title>Freebie: 4 Bootstrap Gallery Templates</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
	<link rel="stylesheet" type="text/css" href="/myweb/semi_project/include/gallery_css.css">
	
</head>
<body>

<div class="container gallery-container">

    <h1>${sightname}</h1>

    <p class="page-description text-center">PHOTO GALLERY</p>
    
    <div class="tz-gallery">

        <div class="row">
          
          <c:forEach var="photo" items="${plist}">
            <div class="col-sm-6 col-md-4">
                <a class="lightbox" href="${path}/semi_project/images/ksights/${photo.photo_url}">
                    <img src="${path}/semi_project/images/ksights/${photo.photo_url}" alt="${photo.photo_sight}${photo.photonum}" height="280px">
                </a>
            <span><fmt:formatDate value="${photo.upload_date}" pattern="yyyy년 MM월 dd일 "/></span>
            <span style="float: right; margin-right: 20px;">${photo.id}</span>
            </div>
          </c:forEach>
          
        </div>

    </div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
<script>
    baguetteBox.run('.tz-gallery');
</script>
</body>
</html>