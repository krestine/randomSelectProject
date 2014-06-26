<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<script type="text/javascript">
	function loginGo() {
		document.getElementById("member").action = "loginForm.do";
		document.getElementById("member").submit();
	}
	function registerGo() {
		document.getElementById("member").action = "registerForm.do";
		document.getElementById("member").submit();
	}
	function myInfoGo() {
		document.getElementById("myPage").action = "myInfoForm.do";
		document.getElementById("myPage").submit();
	}
	function logoutGo() {
		document.getElementById("myPage").action = "logoutForm.do";
		document.getElementById("myPage").submit();
	}

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


	
	function evaluateGo() {
		document.getElementById("evaluate").action = "evaluateListProc.do";
		
		document.getElementById("evaluate").submit();
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



	<h1>Hello world!</h1>
	<c:choose>
		<c:when test="${sessionScope.loginUser==null}">
			<form id="member" method="post">
				<input type="button" onclick="loginGo()" value="로그인"> <input
					type="button" onclick="registerGo()" value="회원가입">
			</form>
		</c:when>
		<c:otherwise>
			<form id="myPage" method="post">
				<input type="button" onclick="logoutGo()" value="로그아웃"> <input
					type="button" onclick="myInfoGo()" value="내정보">
			</form>
		</c:otherwise>
	</c:choose>
	<a href="selectResult.do">아무거나</a>
	<a href="mateListProc.do">커뮤니티</a>
	<a href="ladderMake.do">복불복</a>
	<a href="evaluate.do">평가</a>



	<form id="setting" method="post">
		<input type="button" onclick="settingGo()" value="설정 "> <input
			type="button" onclick="adminGo()" value="관리">
	</form>

	
	<form id="community" method="post">
	<input type="button" onclick="communityGo()" value="커뮤니티">
	</form>
	

	<form id="evaluate" method="post">

		<input type="button" onclick="evaluateGo()" value="평가">
	</form>


</body>
</html>
