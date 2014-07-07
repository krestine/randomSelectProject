<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
	<div align="center">
		<table>
			<caption></caption>
			<thead>
			<tbody>
				<tr>
					<c:choose>
						<c:when test="${sessionScope.loginUser==null}">
							<form id="select1" method="post">
								<td><input type="button" onclick="loginGo()" value="로그인"></td>
								<td><input type="button" onclick="registerGo()"
									value="회원가입"></td>
							</form>
						</c:when>



						<c:when test="${sessionScope.loginUser.memGrade<7}">
							<form id="select1" method="post">
								<td><input type="button" onclick="logoutGo()" value="로그아웃"></td>
								<td><input type="button" onclick="myInfoGo()" value="내정보"></td>
							</form>
						</c:when>

						<c:when test="${sessionScope.loginUser.memGrade==666}">
							<form id="select1" method="post">
								<td><input type="button" onclick="logoutGo()" value="로그아웃">
								<td><input type="button" onclick="adminGo()" value="관리"></td>
							</form>
						</c:when>
					</c:choose>
					<form id="select3">
						<td><input type="button" onclick="selectResult()"
							value="아무거나"></td>
						<td><input type="button" onclick="ladderMake()" value="복불복"></td>
					</form>
				</tr>
				<tr>
					<form id="select2" method="post">
						<td><input type="button" onclick="settingGo()" value="설정 "></td>
						<td><input type="button" onclick="communityGo()" value="커뮤니티"></td>
						<td><input type="button" onclick="evaluateGo()" value="평가"></td>
						<td><input type="button" onclick="" value="통계"></td>
					</form>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>