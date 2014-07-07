<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<link href="/resources/css/bootstrap.min.css" rel="stylesheet"
	media="screen">


<link href="/controller/resources/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="/controller/resources/js/bootstrap.min.js"></script>
<script src="/controller/resources/js/respond.js"></script>

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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="navbar-pills">
		<a class="brand" href="#">아무거나</a>

		<c:choose>
			<c:when test="${sessionScope.loginUser==null}">
				<form id="select1" method="post">
					<input type="button" class="btn btn-info" onclick="loginGo()"
						value="로그인"> <input type="button" class="btn btn-info"
						onclick="registerGo()" value="회원가입">
				</form>
			</c:when>



			<c:when test="${sessionScope.loginUser.memGrade<7}">
				<form id="select1" method="post">
					<input type="button" class="btn btn-default" onclick="logoutGo()"
						value="로그아웃"> <input type="button" class="btn btn-info"
						onclick="myInfoGo()" value="내정보">
				</form>
			</c:when>

			<c:when test="${sessionScope.loginUser.memGrade==666}">
				<form id="select1" method="post">
					<input type="button" class="btn btn-default" onclick="logoutGo()"
						value="로그아웃"> <input type="button" class="btn btn-danger"
						onclick="adminGo()" value="관리">
				</form>
			</c:when>
		</c:choose>
		<form id="select3">
			<input type="button" class="btn btn-info" onclick="selectResult()"
				value="아무거나"> <input type="button" class="btn btn-info"
				onclick="ladderMake()" value="복불복">
		</form>

		<form id="select2" method="post">
			<input type="button" class="btn btn-default" onclick="settingGo()"
				value="설정 "> <input type="button" class="btn btn-info"
				onclick="communityGo()" value="커뮤니티"> <input type="button"
				class="btn btn-info" onclick="evaluateGo()" value="평가"> <input
				type="button" class="btn btn-info" onclick="" value="통계">
		</form>
	</div>

</body>
</html>