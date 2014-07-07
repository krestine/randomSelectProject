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
 
 

 

</body>
</html>
