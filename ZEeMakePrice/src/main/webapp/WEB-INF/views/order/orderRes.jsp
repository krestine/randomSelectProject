<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
	<h1>orderRes</h1>
	<a href="orderList.do">orderList</a>
	<a href="/z/">home</a>
	<center>
		<form action="orderList.do">
			<!-- 	<img src="" alt="orderList" width="300px"> <font size="3"
				face="Arial"></font>  -->
			<font size="5"
				color="red" face="Arial">주문이 완료되었습니다.</font>
			<button type="submit" id="orderCheck" value="확인"></button>
		</form>
	</center>

</body>
</html>