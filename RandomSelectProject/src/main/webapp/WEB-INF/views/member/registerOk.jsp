<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function loginGo() {
		document.getElementById("form").action = "loginForm.do";
		document.getElementById("form").submit();
	}
	function main() {
		document.getElementById("form").action = "main.do";
		document.getElementById("form").submit();
	}
</script>
<title>registerOk.jsp</title>
</head>
<body>
	회원가입이 완료되었습니다.로그인해주세요.
	<form id="form" method="post">
		<input type="button" onclick="loginGo()" value="로그인"> <input
			type="button" onclick="main()" value="메인으로">
	</form>
</body>
</html>