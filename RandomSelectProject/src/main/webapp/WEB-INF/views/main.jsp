<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="myapp/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
 <script src="//code.jquery.com/jquery.js"></script>
 <script src="myapp/resources/js/bootstrap.min.js"></script>
 <script src="myapp/resources/js/respond.js"></script>
 
<title>Insert title here</title>
</head>
<body>
<h1 align="center">어서 옵쇼!!</h1>
<div class="container">
        <div class="row">
            <div class="span10">

                <div id="theCarousel" class="carousel slide span5">
                   <ol class="carousel-indicators">
                      <li data-target="#theCarousel" data-slide-to="0" class="active"></li>
                      <li data-target="#theCarousel" data-slide-to="1"></li>
                      <li data-target="#theCarousel" data-slide-to="2"></li>
                    </ol>

                    <!-- 아이템 -->
                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="http://lorempixel.com/400/200/sports" alt="" />
                            <div class="carousel-caption">
                                <h4>제목</h4>
                                <p>간단 설명들...</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="http://lorempixel.com/400/200/city" alt="" />
                            <div class="carousel-caption">
                                <h4>제목</h4>
                                <p>간단 설명들...</p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="http://lorempixel.com/400/200/food" alt="" />
                            <div class="carousel-caption">
                                <h4>제목</h4>
                                <p>간단 설명들...</p>
                            </div>
                        </div>
                    </div>
                    <!-- 링크 -->
                    <a href="#theCarousel" class="carousel-control left" 
                        data-slide="prev">&lsaquo;</a>
                    <a href="#theCarousel" class="carousel-control right" 
                        data-slide="next">&rsaquo;</a>
                </div>

            </div>
        </div>
    </div>

    <script src="../Scripts/jquery-2.0.2.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
</body>
</html>