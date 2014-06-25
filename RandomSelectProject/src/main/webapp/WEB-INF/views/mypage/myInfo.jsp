<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function modify() {
		document.getElementById("form").action = "myInfoProc.do";
		document.getElementById("form").submit();
	}
	function drop() {
		document.getElementById("form").action = "dropForm.do";
		document.getElementById("form").submit();
	}
</script>
<title>myInfo.jsp</title>
</head>
<body>
	<%
		session.getAttribute("loginUser");
	%>

	${errmessage}
	<table align="center" border="0" cellspacing="0" cellpadding="0"
		bgcolor="white">

		<tr>
			<td>아이디 :</td>
			<td>${userInfo.memId}</td>
		</tr>

		<tr>
			<td>이름 :</td>
			<td>${userInfo.memName}</td>
		</tr>

		<tr>
			<td>등급 :</td>
			<td>${userInfo.memGrade}</td>
		</tr>

	</table>

	<form id="form" method="post">
		<table align="center" border="0" cellspacing="0" cellpadding="0"
			bgcolor="white">
			<tr>
				<td><input type="hidden" name="memId"
					value="${loginUser.memId}"></td>
			</tr>
			<tr>
				<td>현재비밀번호</td>
				<td><input type="password" name="memPasswd"></td>
			</tr>

			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" name="tempPw"></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" name="tempPw2"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="memMobile"></td>
			</tr>
			<tr>
				<td><input type="button" onclick="modify()" value="정보수정"></td>
				<td><input type="button" onclick="drop()" value="회원탈퇴"></td>
			</tr>
		</table>
	</form>
</body>
</html>