<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>findPassword.jsp</title>
</head>
<body>
	<form action="/findPasswordProc.do" method="post">
		<table align="center" border="0" cellspacing="0" cellpadding="0"
			bgcolor="white">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="memId"></td>
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
				<td><input type="submit" value="비밀번호찾기"></td>
			</tr>
		</table>
	</form>
</body>
</html>