<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<%@ include file="/semi_project/include/headForSemi.jsp" %>
<style type="text/css">
body {
  font-family: 'Open Sans', 'sans-serif';
  background:#f0f0f0;
}
.navbar-nav>li>.dropdown-menu {
    margin-top:20px;
    border-top-left-radius:4px;
    border-top-right-radius:4px;
}
.navbar-default .navbar-nav>li>a {
    width:200px;
    font-weight:bold;
}
.mega-dropdown {
  position: static !important;
  width:100%;
}
.mega-dropdown-menu {
    padding: 20px 0px;
    width: 100%;
    box-shadow: none;
    -webkit-box-shadow: none;
}
.mega-dropdown-menu:before {
    content: "";
    border-bottom: 15px solid #fff;
    border-right: 17px solid transparent;
    border-left: 17px solid transparent;
    position: absolute;
    top: -15px;
    left: 285px;
    z-index: 10;
}
.mega-dropdown-menu:after {
    content: "";
    border-bottom: 17px solid #ccc;
    border-right: 19px solid transparent;
    border-left: 19px solid transparent;
    position: absolute;
    top: -17px;
    left: 283px;
    z-index: 8;
}
.mega-dropdown-menu > li > ul {
  padding: 0;
  margin: 0;
}
.mega-dropdown-menu > li > ul > li {
  list-style: none;
}
.mega-dropdown-menu > li > ul > li > a {
  display: block;
  padding: 3px 20px;
  clear: both;
  font-weight: normal;
  line-height: 1.428571429;
  color: #999;
  white-space: normal;
}
.mega-dropdown-menu > li ul > li > a:hover,
.mega-dropdown-menu > li ul > li > a:focus {
  text-decoration: none;
  color: #444;
  background-color: #f5f5f5;
}
.mega-dropdown-menu .dropdown-header {
  color: #428bca;
  font-size: 18px;
  font-weight:bold;
}
.mega-dropdown-menu form {
    margin:3px 20px;
}
.mega-dropdown-menu .form-group {
    margin-bottom: 3px;
}
</style>
</head>
<body>
<div class="container">
<nav class="navbar navbar-default">
    <div class="navbar-header">
		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="#">MegaMenu</a>
	</div>
	
	
	<div class="collapse navbar-collapse js-navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="dropdown mega-dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Collection <span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
				
				<ul class="dropdown-menu mega-dropdown-menu row">
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">New in Stores</li>                            
                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                              <div class="carousel-inner">
                                <div class="item active">
                                    <a href="#"><img src="http://placehold.it/254x150/3498db/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 1"></a>
                                    <h4><small>Summer dress floral prints</small></h4>                                        
                                    <button class="btn btn-primary" type="button">49,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>       
                                </div><!-- End Item -->
                                <div class="item">
                                    <a href="#"><img src="http://placehold.it/254x150/ef5e55/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 2"></a>
                                    <h4><small>Gold sandals with shiny touch</small></h4>                                        
                                    <button class="btn btn-primary" type="button">9,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>        
                                </div><!-- End Item -->
                                <div class="item">
                                    <a href="#"><img src="http://placehold.it/254x150/2ecc71/f5f5f5/&text=New+Collection" class="img-responsive" alt="product 3"></a>
                                    <h4><small>Denin jacket stamped</small></h4>                                        
                                    <button class="btn btn-primary" type="button">49,99 €</button> <button href="#" class="btn btn-default" type="button"><span class="glyphicon glyphicon-heart"></span> Add to Wishlist</button>      
                                </div><!-- End Item -->                                
                              </div><!-- End Carousel Inner -->
                            </div><!-- /.carousel -->
                            <li class="divider"></li>
                            <li><a href="#">View all Collection <span class="glyphicon glyphicon-chevron-right pull-right"></span></a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">Dresses</li>
							<li><a href="#">Unique Features</a></li>
							<li><a href="#">Image Responsive</a></li>
							<li><a href="#">Auto Carousel</a></li>
							<li><a href="#">Newsletter Form</a></li>
							<li><a href="#">Four columns</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Tops</li>
							<li><a href="#">Good Typography</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">Jackets</li>
							<li><a href="#">Easy to customize</a></li>
							<li><a href="#">Glyphicons</a></li>
							<li><a href="#">Pull Right Elements</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Pants</li>
							<li><a href="#">Coloured Headers</a></li>
							<li><a href="#">Primary Buttons & Default</a></li>
							<li><a href="#">Calls to action</a></li>
						</ul>
					</li>
					<li class="col-sm-3">
						<ul>
							<li class="dropdown-header">Accessories</li>
							<li><a href="#">Default Navbar</a></li>
							<li><a href="#">Lovely Fonts</a></li>
							<li><a href="#">Responsive Dropdown </a></li>							
							<li class="divider"></li>
                            <li class="dropdown-header">Newsletter</li>
                            <form class="form" role="form">
                              <div class="form-group">
                                <label class="sr-only" for="email">Email address</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter email">                                                              
                              </div>
                              <button type="submit" class="btn btn-primary btn-block">Sign in</button>
                            </form>                                                       
						</ul>
					</li>
				</ul>
				
			</li>
		</ul>
		
	</div><!-- /.nav-collapse -->
</nav>
</div>






<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="images/product-detail-01.jpg">
									<div class="wrap-pic-w pos-relative">
										<img src="images/product-detail-01.jpg" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-01.jpg">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="images/product-detail-02.jpg">
									<div class="wrap-pic-w pos-relative">
										<img src="images/product-detail-02.jpg" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-02.jpg">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>

								<div class="item-slick3" data-thumb="images/product-detail-03.jpg">
									<div class="wrap-pic-w pos-relative">
										<img src="images/product-detail-03.jpg" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="images/product-detail-03.jpg">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				</div>
				
				
				
				<div class="container gallery-container">

    <h1>Bootstrap 3 Gallery</h1>

    <p class="page-description text-center">Thumbnails With Title And Description</p>
    
    <div class="tz-gallery">

        <div class="row">

            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/park.jpg">
                        <img src="${path}/semi_project/images/gf.png" alt="Park">
                    </a>
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/bridge.jpg">
                        <img src="${path}/semi_project/images/gf.png" alt="Bridge">
                    </a>
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/tunnel.jpg">
                        <img src="${path}/semi_project/images/gf.png" alt="Tunnel">
                    </a>
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/coast.jpg">
                        <img src="${path}/semi_project/images/gf.png" alt="Coast">
                    </a>
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/rails.jpg">
                        <img src="${path}/semi_project/images/gf.png" alt="Rails">
                    </a>
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                    <a class="lightbox" href="../images/traffic.jpg">
                        <img src="${path}/semi_project/images/gf.png" alt="Traffic">
                    </a>
                    <div class="caption">
                        <h3>Thumbnail label</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

			
</body>
</html>