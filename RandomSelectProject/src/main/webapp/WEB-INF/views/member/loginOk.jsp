<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginOk.jsp</title>
</head>
<body>
	${sessionScope.loginUser.memName}회원님 환영합니다.
	<form action="myInfoForm.do" method="post">
		<input type="hidden" name="memId" value="${loginUser.memId}">
		<input type="submit" value="내정보">
	</form>
	<%-- <a href="<c:url value="/myInfoForm.do?memId=${loginUser.memId}"/>">내정보</a> --%>
</body>
</html>