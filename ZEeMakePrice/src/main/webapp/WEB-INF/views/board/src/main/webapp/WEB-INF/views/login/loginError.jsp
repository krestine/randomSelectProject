<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>님 틀렸음</h1>
	<form action="login.do" method="post">
	   ID<input type="text"  name="userid">
	    비밀번호<input type="password" name="password">
		<input type="submit" value="로그인">
	</form>
	<input type="button" onclick="document.location='registerForm.do'" value="회원가입">
</body>
</html>