<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
</head>
<body>
	${errmessage}
	<form action="loginProc.do" method="post">
		<table align="center" border="0" cellspacing="0" cellpadding="0"
			bgcolor="white">

			<tr>
				<td>아이디</td>
				<td><input type="text" name="memId"></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="memPasswd"></td>
			</tr>

			<tr>
				<td><input type="checkbox" name="rememId">아이디기억</td>
				<td><input type="submit" value="로그인"></td>
			</tr>

			<tr>
				<td><a href="findIdForm.do">아이디/비밀번호 찾기</a></td>
			</tr>

		</table>
	</form>

</body>
</html>