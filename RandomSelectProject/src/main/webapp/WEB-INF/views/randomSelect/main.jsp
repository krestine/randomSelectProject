<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<script type="text/javascript">
	function settingGo() {
		document.getElementById("setting").action = "settingForm.do";
		document.getElementById("setting").submit();
	}
	function adminGo() {
		document.getElementById("setting").action = "adminMainProc.do";
		document.getElementById("setting").submit();
	}
	function communityGo() {
		document.getElementById("community").action = "mateListProc.do";
		document.getElementById("community").submit();
	}
<<<<<<< HEAD
	function evaluateGo(){
		document.getElementById("evaluate").action = "evaluateProc.do";
		document.getElementById("evaluate").submit();
	}
	
=======
>>>>>>> 23e31eaf5ff4bed625c7d59484c32242059dc89c
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



	<h1>Hello world!</h1>
	<a href="loginForm.do">로그인</a>
	<a href="registerForm.do">회원가입</a>
	<a href="selectResult.do">아무거나</a>
	<a href="mateListProc.do">커뮤니티</a>
	<a href="ladderMake.do">복불복</a>
<<<<<<< HEAD
	<a href="evaluate.do">평가</a>
=======

>>>>>>> 23e31eaf5ff4bed625c7d59484c32242059dc89c

	<form id="setting" method="post">
		<input type="button" onclick="settingGo()" value="설정 "> <input
			type="button" onclick="adminGo()" value="관리">
	</form>

	<form id="community" method="post">
<<<<<<< HEAD
	<input type="button" onclick="communityGo()" value="커뮤니티">
	<input type="button" onclick="evaluateGo()" value="평가">
=======
		<input type="button" onclick="communityGo()" value="커뮤니티">
>>>>>>> 23e31eaf5ff4bed625c7d59484c32242059dc89c
	</form>


</body>
</html>