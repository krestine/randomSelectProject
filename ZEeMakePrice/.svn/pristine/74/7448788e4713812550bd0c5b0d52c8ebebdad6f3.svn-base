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
<h1>orderList</h1>
<table border="1">
	<tr>
		<td>주문번호</td>
		<td>상품명</td>
		<td>수량</td>
		<td>주소</td>
		<td>결제수단</td>
		<td>배송요청사항</td>
		<td>결제금액</td>
	</tr>
	<c:forEach var="list" items="${orderlist}">
	<tr>
		<td>${list.ordernumber}</td>
		<td>${list.productname}</td>
		<td>${list.ea}</td>
		<td>${list.address}</td>
		<td>${list.payment}</td>
		<td>${list.recontext}</td>
		<td>${list.totalamount }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>