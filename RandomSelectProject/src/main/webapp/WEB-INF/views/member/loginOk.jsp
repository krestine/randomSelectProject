<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	function modify() {
		document.getElementById("form").action = "myInfoForm.do";
		document.getElementById("form").submit();
	}
	function main() {
		document.getElementById("form").action = "main.do";
		document.getElementById("form").submit();
	}
</script>
<title>loginOk.jsp</title>
</head>
<body>
	${sessionScope.loginUser.memName}회원님 환영합니다.
	<form id="form" method="post">
		<%-- 		<input type="hidden" name="memId" value="${loginUser.memId}"> --%>
		<tr>
			<td><input type="button" onclick="modify()" value="내정보"></td>
			<td><input type="button" onclick="main()" value="메인으로"></td>
		</tr>
	</form>
</body>
</html>