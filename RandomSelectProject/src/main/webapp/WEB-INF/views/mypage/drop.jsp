<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 

"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>drop.jsp</title>
<script type="text/javascript">
	function main() {
		document.getElementById("form").action = "main.do";
		document.getElementById("form").submit();
	}
	function drop() {
		document.getElementById("form").action = "dropProc.do";
		document.getElementById("form").submit();
	}
</script>
</head>
<body>
	탈퇴한 아이디는 영구적으로 사용불가합니다.
	<br> 재가입시 다른 아이디를 사용해 주세요.
	<br>
	<form id="form" action="dropProc.do" method="post">
		<table align="center" border="0" cellspacing="0" cellpadding="0"
			bgcolor="white">

			<tr>
				<td>탈퇴사유</td>
				<td><input type="text" name="leaveReason"></td>
			</tr>

			<tr>
				<td><input type="hidden" name="memId"
					value="${sessionScope.loginUser.memId}"></td>
				<td><input type="button" onclick="drop()" value="회원탈퇴"></td>
				<td><input type="button" onclick="main()" value="메인으로"></td>
			</tr>
		</table>
	</form>
</body>
</html>