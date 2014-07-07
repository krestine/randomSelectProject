
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function() {
	$('input[type=button]').click(function() {
		formHanddler(this);
	});
	function formHanddler(obj) {
		var objID = obj.id;
		var actionStr;

		if (objID === "restntListBtn") {
			actionStr = "restntListProc.do";

		}
		if (objID === "mainBtn") {
			actionStr = "main.do";

		} 
		$('#community').attr("action", actionStr).submit();
	}
});

</script>
<title>mateList</title>
</head>
<body>
	 <div class="container">
        <div class="row">
            <div class="span12">
	<h1>친구리스트</h1>

	
	
	<form id="community" method="POST">
		 <input type="button" class="btn btn-primary" value="식당 리스트" id="restntListBtn"/> 
		 <input type="button" class="btn btn-primary" value="메인" id="mainBtn"/>
	</form>
	<br>
	<c:forEach var="mate" items="${mates}">
		<br>
		
				
					
					<form action="mateDetailProc.do" method="post">
				
						<input type="hidden" value="${mate.memId}" name="memId">
					
				
						<input value="${mate.memName}" name="memName">
						<input value="${mate.mateId}" name="mateId">
						
						<input type="submit" value="상세보기">
					
					</form>
					
	</c:forEach>
		 <div class="bs-docs-section">
    <div class="page-header">
      <h1 id="carousel">캐러셀 <small>carousel.js</small></h1>
    </div>

   
    <div class="bs-example">
      <div id="carousel-example-generic" class="carousel slide bs-docs-carousel-example">
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img src="http://lorempixel.com/900/500/food" data-src="holder.js/900x500/auto/#777:#555/text:First slide" alt="First slide">
          </div>
          <div class="item">
            <img src="http://lorempixel.com/900/500/food" data-src="holder.js/900x500/auto/#666:#444/text:Second slide" alt="Second slide">
          </div>
          <div class="item">
            <img src="http://lorempixel.com/900/500/food" data-src="holder.js/900x500/auto/#555:#333/text:Third slide" alt="Third slide">
          </div>
        </div>
        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
          <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
          <span class="icon-next"></span>
        </a>
      </div>
    </div><!-- /example -->
<script type="syntaxhighlighter" class="brush: html">

<div id="carousel-example-generic" class="carousel slide">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="..." alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
    <span class="icon-prev"></span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
    <span class="icon-next"></span>
  </a>
</div>
                
	
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
    <script src="//code.jquery.com/jquery.js"></script>
    <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
    <script src="src/main/webapp/resources/bootstrap/css/bootstrap.min.css"></script>
    <script src="bootstrap/js/respond.js"></script>	
</body>
</html>
