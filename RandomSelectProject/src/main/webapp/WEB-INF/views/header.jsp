<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://code.jquery.com/jquery-latest.js"
	type="text/javascript"></script>
<script src="/myapp/resources/js/jquery.cookie.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?sensor=true&language=ko"></script>
<link rel="stylesheet" type="text/css"
	href="/myapp/resources/css/bootstrap.min.css" media="screen" />
<script type="text/javascript"
	src="/myapp/resources/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function navbarMain() {
	document.getElementById("navbar").action = "main.do";
	document.getElementById("navbar").submit();
}
function navbarLogin() {
	document.getElementById("navbar").action = "loginForm.do";
	document.getElementById("navbar").submit();
}
function navbarLogout() {
	document.getElementById("navbar").action = "logoutForm.do";
	document.getElementById("navbar").submit();
}
function navbarRandomSelect() {
	document.getElementById("navbar").action = "selectResult.do";
	document.getElementById("navbar").submit();
}
</script>
<title>Insert title here</title>
<script type="text/javascript">
	function loginGo() {
		document.getElementById("select1").action = "loginForm.do";
		document.getElementById("select1").submit();
	}
	function registerGo() {
		document.getElementById("select1").action = "registerForm.do";
		document.getElementById("select1").submit();
	}
	function myInfoGo() {
		document.getElementById("select1").action = "myInfoForm.do";
		document.getElementById("select1").submit();
	}
	function logoutGo() {
		document.getElementById("select1").action = "logoutForm.do";
		document.getElementById("select1").submit();
	}
	function mateListGo() {
		document.getElementById("select2").action = "mateListProc.do";
		document.getElementById("select2").submit();
	}
	function restntListGo() {
		document.getElementById("select2").action = "restntListProc.do";
		document.getElementById("select2").submit();
	}
	function settingGo() {
		document.getElementById("select2").action = "settingForm.do";
		document.getElementById("select2").submit();
	}
	function selectResult() {
		document.getElementById("select3").action = "selectResult.do";
		document.getElementById("select3").submit();
	}
	function memberGo() {
		document.getElementById("select1").action = "memberSearchForm.do";
		document.getElementById("select1").submit();
	}
	function restntGo() {
		document.getElementById("select1").action = "restntManantProc.do";
		document.getElementById("select1").submit();
	}
</script>
</head>
<style>
</style>
<body>
	<!-- 	<div class="navbar navbar-inverse navbar-fixed-top " > -->
	<!-- 	      <div class="container"> -->
	<!-- 	        <div class="navbar-header" > -->
	<!--           <a href="main.do" class="navbar-brand">아무거나</a> -->

	<!--         </div> -->
	<!--       </div> -->
	<!--     </div> -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<!-- 	<nav class="navbar navbar-default" role="navigation"> Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-ex1-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="main.do">잇콕</a>
	</div>

	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse navbar-ex1-collapse">
		<c:choose>
			<c:when test="${sessionScope.loginUser==null}">
				<ul class="nav navbar-nav">
					<li><a onclick="loginGo()">로그인</a></li>
					<li><a onclick="registerGo()">회원가입</a></li>
				</ul>
			</c:when>

			<c:when test="${sessionScope.loginUser.memGrade<7}">
				<ul class="nav navbar-nav">
					<li><a onclick="logoutGo()">로그아웃</a></li>
					<li><a onclick="myInfoGo()">내정보</a></li>
				</ul>
			</c:when>

			<c:when test="${sessionScope.loginUser.memGrade==666}">
				<ul class="nav navbar-nav">
					<li><a onclick="logoutGo()">로그아웃</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">관 리<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a onclick="memberGo()">회원 관리</a></li>
							<li><a onclick="restntGo()">식당 관리</a></li>
						</ul></li>
				</ul>
			</c:when>
		</c:choose>

		<ul class="nav navbar-nav">
			<li><a onclick="selectResult()">아무거나</a></li>
			<li><a onclick="settingGo()">설 정</a></li>
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">커뮤니티<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a onclick="mateListGo()">친구리스트</a></li>
					<li><a onclick="restntListGo()">식당리스트</a></li>
				</ul></li>
		</ul>

		<ul class="nav navbar-nav">
			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown">평 가<b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a href="evaluateList.do">평가한 페이지 </a></li>
					<li><a href="nEvaluateListForm.do">평가 안한 페이지 </a></li>
				</ul></li>
		</ul>
	</div>
	<!-- /.navbar-collapse --> </nav>
</body>
</html>
