<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>findId.jsp</title>
<script type="text/javascript">
	function findId() {
		document.getElementById("form").action = "findIdProc.do";
		document.getElementById("form").submit();
	}
	function findPw() {
		document.getElementById("form").action = "findPasswordForm.do";
		document.getElementById("form").submit();
	}
</script>
</head>
<body>
	<form id="form" method="post">
		<table align="center" border="0" cellspacing="0" cellpadding="0"
			bgcolor="white">
			<tr>
				<td>이름</td>
				<td><input type="text" name="memName"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="memBirth"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="memMobile"></td>
			</tr>
			<tr>
				<td><input type="button" onclick="findId()" value="아이디찾기"></td>
				<td><input type="button" onclick="findPw()" value="비밀번호찾기"></td>
			</tr>
		</table>
	</form>
</body>
</html>