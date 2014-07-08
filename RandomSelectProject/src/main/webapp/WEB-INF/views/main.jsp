<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="/myapp/resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/myapp/resources/css/bootstrap-theme.min.css" />
<script type="text/javascript" src="/myapp/resources/js/bootstrap.min.js"></script>
<script src="/myapp/resources/js/respond.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 
<title>Insert title here</title>
</head>
<body>
<h1 align="center"></h1>

<center>
			<div class="container">
       			 <div class="row">
            		<div class="span10">
			
                <div id="theCarousel" class="carousel slide span5">
               <!--  <li data-target="#theCarousel" data-slide-to="0" class="active"></li>
                      <li data-target="#theCarousel" data-slide-to="1"></li>
                      <li data-target="#theCarousel" data-slide-to="2"></li>
                      <li data-target="#theCarousel" data-slide-to="3"></li>
                      <li data-target="#theCarousel" data-slide-to="4"></li>
                    </ol> -->
					
                    <!-- 아이템 -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://lorempixel.com/900/500/food/1"  alt="1">
                            <div class="carousel-caption">
                                <h4>아직도...</h4>
                                 
                            </div>
                        </div>
                        <div class="item">
                           <img src="http://lorempixel.com/900/500/food/2"  alt="2">
                            <div class="carousel-caption">
                                <h4>어디에 있는지도 모를..</h4>      
                            </div>
                        </div>
                        <div class="item">
                            <img src="http://lorempixel.com/900/500/food/3"  alt="3">
                            <div class="carousel-caption">
                                <h4>식당들을 찾아..</h4>
                            </div>
                        </div>                        
                          <div class="item">
                            <img src="http://lorempixel.com/900/500/food/4"  alt="4">
                            <div class="carousel-caption">
                                <h4>헤메이고 계십니까...?</h4>                               
                            </div>
                        </div>                       
                          <div class="item">
                            <img src="http://lorempixel.com/900/500/food/5"  alt="5">
                            <div class="carousel-caption">
                                <h4>아무거나와 함께 하세요.</h4>                               
                            </div>
                        </div>                       
                    </div>
                    <!-- 링크 -->
                    <a href="#theCarousel" class="carousel-control left" 
                        data-slide="prev"><span class="icon-prev"></span></a>
                    <a href="#theCarousel" class="carousel-control right" 
                        data-slide="next"><span class="icon-next"></span></a>
              	</div>
			</div>
		</div>
	</div>


</center>
</body>
</html>