<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>cartContext</h1>
<table border="1">
	<tr>
		<td>장바구니번호</td>
		<td>상품명</td>
		<td>수량</td>
		<td>금액</td>
		<td>주문</td>
	</tr>
	<c:forEach var="list" items="${list}">
	<tr>
		<td>${list.cartnumber}</td>
		<td>${list.productname}</td>
		<td>${list.ea}</td>
		<td>${list.amount}</td>
		<td><input type="button" value="주문"><br>
		<input type="button" value="삭제" onclick="document.location='cartDelete.do?cartnumber=${list.cartnumber}'"></td>
	</tr>
	</c:forEach>
</table>
총 주문 금액<input type="button" value="전체주문">
</body>
</html>