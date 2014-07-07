<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/css/bootstrap.min.css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
<title>메인 페이지</title>
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
	function adminGo() {
		document.getElementById("select1").action = "adminMainProc.do";
		document.getElementById("select1").submit();
	}

	function communityGo() {
		document.getElementById("select2").action = "mateListProc.do";
		document.getElementById("select2").submit();
	}
	function settingGo() {
		document.getElementById("select2").action = "settingForm.do";
		document.getElementById("select2").submit();
	}
	function evaluateGo() {
		document.getElementById("select2").action = "evaluatemain.do";
		document.getElementById("select2").submit();
	}
	function selectResult() {
		document.getElementById("select3").action = "selectResult.do";
		document.getElementById("select3").submit();
	}
	function ladderMake() {
		document.getElementById("select3").action = "ladderMake.do";
		document.getElementById("select3").submit();
	}
</script>
</head>
<body>
	<!-- 구성회를 매우 쳐라 -->
	<!-- 이제 됨!!!!!!!!!
	
		<servlet-mapping..>
		<servlet-nameㅡㅡ..>.appServlet<../servlet-name>
		<url-patternㅡㅡ>*.do</..url-pattern>
	</servlet-mapping..> 
	
	url pattend *.do  빠져있어서 안되는거였어요.   -->



	<h1>아무거나</h1>



	<%-- <c:choose>
		<c:when test="${sessionScope.loginUser==null}">
			<form id="select1" method="post">
				<input type="button" onclick="loginGo()" value="로그인"> <input
					type="button" onclick="registerGo()" value="회원가입">
			</form>
			<form id="select3">
				<input type="button" onclick="selectResult()" value="아무거나">
				<input type="button" onclick="ladderMake()" value="복불복">
			</form>
		</c:when>

		<c:when test="${sessionScope.loginUser.memGrade<7}">
			<form id="select1" method="post">
				<input type="button" onclick="logoutGo()" value="로그아웃"> <input
					type="button" onclick="myInfoGo()" value="내정보">
			</form>
			<form id="select3">
				<input type="button" onclick="selectResult()" value="아무거나">
				<input type="button" onclick="ladderMake()" value="복불복">
			</form>
		</c:when>
		<c:when test="${sessionScope.loginUser.memGrade==666}">
			<form id="select1" method="post">
				<input type="button" onclick="logoutGo()" value="로그아웃"> <input
					type="button" onclick="adminGo()" value="관리">
			</form>
			<form id="select3">
				<input type="button" onclick="selectResult()" value="아무거나">
				<input type="button" onclick="ladderMake()" value="복불복">
			</form>
		</c:when>


	</c:choose>
 --%>
 
 
<div class="container-fluid" >
	<div class="row-fluid">
			<div class="span12">	
				<div class="col-md-12">
					<p>
					<c:choose>
						<c:when test="${sessionScope.loginUser==null}">
						<form id="select1" method="post">
						<ul class="nav nav-pills">
							<li><input type="button" class="btn btn-default btn-lg" onclick="loginGo()" value="로그인"></li>
							<li><input type="button" class="btn btn-default btn-lg"onclick="registerGo()" value="회원가입"></li>
						</ul>
						</form>
					</c:when>
					
					<c:when test="${sessionScope.loginUser.memGrade<7}">
						
						<form id="select1" method="post">
						<ul class="nav nav-pills">
							<li><input type="button" class="btn btn-danger btn-lg" onclick="logoutGo()" value="로그아웃"></li>
							<li><input type="button" class="btn btn-default btn-lg"onclick="myInfoGo()" value="내정보"></li>
						</ul>
						</form>
						
					</c:when>
				
					<c:when test="${sessionScope.loginUser.memGrade==666}">
						<form id="select1" method="post">
							<ul class="nav nav-pills">
								<li><input type="button" class="btn btn-default btn-lg" onclick="logoutGo()" value="로그아웃"></li>
								<li><input type="button" class="btn btn-danger btn-lg" onclick="adminGo()" value="관리"></li>
							</ul>
						</form>
					</c:when>
				</c:choose>
				</p>
			
				<p>
				<form id="select3">
				<ul class="nav nav-pills">
					<li><input type="button" class="btn btn-default btn-lg" onclick="selectResult()" value="아무거나"></li>
					<li><input type="button" class="btn btn-default btn-lg"onclick="ladderMake()" value="복불복"></li>
				</ul>
				</form>
				</p>
				
				<p>
				<form id="select2" method="post">
				<ul class="nav nav-pills">
					<li><input type="button" class="btn btn-default btn-lg" onclick="settingGo()" value="설정 "></li>
					<li><input type="button" class="btn btn-default btn-lg" onclick="communityGo()" value="커뮤니티"></li>
					<li><input type="button" class="btn btn-default btn-lg" onclick="evaluateGo()" value="평가"></li>
					<li><input type="button" class="btn btn-default btn-lg" onclick="" value="통계"></li>
				</ul>
				</form>
				</p>
				</div>			
			
		</div>
	</div>
</div>


	<!-- <form id="select2" method="post">
		<input type="button" onclick="settingGo()" value="설정 "> <input
			type="button" onclick="communityGo()" value="커뮤니티"> <input
			type="button" onclick="evaluateGo()" value="평가"> <input
			type="button" onclick="" value="통계">
	</form> -->




<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->

    <script src="//code.jquery.com/jquery.js"></script>

    <!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->

    <script src="js/bootstrap.min.js"></script>
    <script src="js/respond.js"></script>

 

</body>
</html>